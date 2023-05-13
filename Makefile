include help.mk

keyname?=id_rsa
keyfile=~/.ssh/$(keyname)
keyfile_public=~/.ssh/$(keyname).pub
user?="ec2-user"
server?=""
reset?=false
region?="us-east-1"
cluster?=""
version?=development
script?=""
args?=--help
current_user?=$(shell echo $$USER)
log_level?=""

dockerenv=--env GROUP_ID="$(shell id -g $$USER)" \
  --env USER_ID="$(shell id -u $$USER)" \
  --env KEY_FILE \
  --env KEY_FILE_PUB \
  --env AWS_ACCESS_KEY_ID \
  --env AWS_SECRET_ACCESS_KEY
base_imagename=ghcr.io/kaio6fellipe/terraform-devops/platform-ops
terramate_image=ghcr.io/mineiros-io/terramate:0.2.18
development_imagename=$(base_imagename):development

docker_run=docker run --rm $(dockerenv) --volume `pwd`:/platform --volume ~/.aws:/root/.aws $(base_imagename):$(version)
docker_run_interactive=docker run --rm $(dockerenv) --volume `pwd`:/platform --volume ~/.aws:/root/.aws --tty --interactive $(base_imagename):$(version)
terramate_run=docker run --rm $(dockerenv) --volume `pwd`:/workdir $(terramate_image) --chdir="/workdir" --log-level="info"

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "argument '$*' is required"; \
		exit 1; \
	fi

.PHONY: init
init: guard-reset ##@repository (args: reset)Init repository config and hooks and reset .terraform cache
ifeq ($(reset), true)
	$(shell cp hooks/pre-push .git/hooks/pre-push)
	$(shell chmod +x .git/hooks/pre-push)
	find . -type d -wholename '*/.terraform/*' | xargs sudo rm -rfd
	chmod +x stacks/platform/platform-k8s/eks-cluster-ca-certificate.sh
	chmod +x stacks/platform/platform-k8s/eks-cluster-endpoint.sh
	chmod +x stacks/platform/platform-k8s/eks-cluster-token.sh
	git add .
	$(docker_run) /bin/bash -c "terramate run terraform init -upgrade -backend=true"
	@echo "Repository initialized with success..."
else
	@echo "To init the repository pass the parameter reset=true"
endif

.PHONY: plan
plan: ##@terraform (Deprectated, use terramate-plan) Execute Terraform Plan
	@echo "Deprectated, use terramate-plan"	
# $(docker_run) ./lib/plan

.PHONY: bastion
bastion: guard-keyname guard-user ##@bastion (args: keyname, user) Get access directly to bastion server
	export KEY_FILE="$(shell cat $(keyfile))" && \
	$(docker_run_interactive) ./lib/bastion --keyname $(keyname) --user $(user)

.PHONY: jump
jump: guard-keyname guard-user guard-server ##@bastion (args: keyname, user, server) Jump access through bastion to another server
	export KEY_FILE="$(shell cat $(keyfile))" && \
	$(docker_run_interactive) ./lib/jump --keyname $(keyname) --user $(user) --server $(server)

.PHONY: clean
clean: ##@bastion Clean known_hosts
	rm -rv ~/.ssh/known_hosts

.PHONY: kubectl
kubectl: guard-region guard-cluster ##@eks (args: region, cluster) Connect to an EKS cluster
	$(docker_run_interactive) ./lib/eks-connect --region $(region) --cluster $(cluster)

.PHONY: lint
lint: check tflint tfsec tffmt terramate-plan ##@check Execute linters, security check and Terramate Plan

.PHONY: check
check: ##@check Check pre-push integrity
	$(docker_run) ./lib/lint/check-pre-push

.PHONY: tflint
tflint: ##@check Execute TFLint
	$(docker_run) ./lib/lint/tflint

.PHONY: tfsec
tfsec: ##@check Execute TFSec
	$(docker_run) ./lib/lint/tfsec

.PHONY: tffmt
tffmt: ##@check Execute Terraform fmt
	$(docker_run) ./lib/lint/tffmt

.PHONY: image
image: ##@docker Create the container image used for local development and operation
	@docker build --tag $(development_imagename) .

.PHONY: image-push
image-push: ##@docker Push the container image used for local development and operation
	@docker push $(development_imagename)

.PHONY: image-pull
image-pull: ##@docker Pull the container image used for local development and operation
	@docker pull $(development_imagename)

.PHONY: run
run: ##@docker Run the container image used for local development and operation
	$(docker_run_interactive) /bin/bash
# export KEY_FILE_PUB="$(shell cat $(keyfile_public))" && \ 
# export KEY_FILE="$(shell cat $(keyfile))" && \ 
	
.PHONY: python
python: guard-script ##@python (args: script) Run external scripts with Python
	$(docker_run) bash -c "python3 ./lib/python/$(script)"

.PHONY: terramate
terramate: guard-args ##@terramate (args: args) Run terramate with additional args
	git add . && \
	$(docker_run) bash -c "terramate $(args)" && \
	make terramate-chown

.PHONY: terramate-docker
terramate-docker: guard-args ##@terramate (args: args) Run terramate with additional args with docker
	git add . && \
	$(terramate_run) $(args)
	make terramate-chown

.PHONY: terramate-generate
terramate-generate: ##@terramate Run terramate generate to generate stack files managed by Terramate
	git add . && \
	$(docker_run) bash -c "terramate generate" && \
	make terramate-chown

.PHONY: terramate-fmt
terramate-fmt: ##@terramate Run terramate fmt to format all terramate files
	git add . && \
	$(docker_run) bash -c "terramate fmt"

.PHONY: terramate-chown
terramate-chown: guard-current_user ##@terramate (args: current_user) Change owner of terramate generated files inside platform-ops container
	sudo find . -type f -name '*.tm.hcl' | sudo xargs chown $(current_user):$(current_user) && \
	sudo find . -type f -name '*.tf' | sudo xargs chown $(current_user):$(current_user)

.PHONY: terramate-plan
terramate-plan: guard-keyname ##@terramate Execute terramate generate and terramate run with init and plan on each stack that has detected differences
	git add . && \
	$(docker_run) ./lib/terramate-plan --keyname $(keyname) --log_level $(log_level)
# export KEY_FILE_PUB="$(shell cat $(keyfile_public))" && \ 
# export KEY_FILE="$(shell cat $(keyfile))" && \ 
