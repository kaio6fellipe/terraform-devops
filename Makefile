include help.mk

keyname?=id_rsa
keyfile=~/.ssh/$(keyname)
user?="ec2-user"
server?=""
reset?=false
region?="us-east-1"
cluster?=""
version?=development

dockerenv=--env GROUP_ID="$(shell id -g $$USER)" \
  --env USER_ID="$(shell id -u $$USER)" \
  --env KEY_FILE
base_imagename=ghcr.io/kaio6fellipe/terraform-devops/platform-ops
development_imagename=$(base_imagename):development

docker_run=docker run --rm $(dockerenv) --volume `pwd`:/platform --volume ~/.aws:/root/.aws $(base_imagename):$(version)
docker_run_interactive=docker run --rm $(dockerenv) --volume `pwd`:/platform --volume ~/.aws:/root/.aws --tty --interactive $(base_imagename):$(version)

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "argument '$*' is required"; \
		exit 1; \
	fi

.PHONY: init
init: guard-reset ##@repository Init repository config and hooks and reset .terraform cache
ifeq ($(reset), true)
	$(shell cp hooks/pre-push .git/hooks/pre-push)
	$(shell chmod +x .git/hooks/pre-push)
	rm -rfd .terraform/
	chmod +x stack/platform/platform-k8s/eks-cluster-ca-certificate.sh
	chmod +x stack/platform/platform-k8s/eks-cluster-endpoint.sh
	chmod +x stack/platform/platform-k8s/eks-cluster-token.sh
	$(docker_run) /bin/bash -c "terraform init -upgrade -backend=true -backend-config='global/backend.hcl'"
	@echo "Repository initialized with success..."
else
	@echo "To init the repository pass the parameter reset=true"
endif

.PHONY: plan
plan: ##@terraform Execute Terraform Plan
	$(docker_run) ./lib/plan

.PHONY: bastion
bastion: guard-keyname guard-user ##@bastion Get access directly to bastion server
	export KEY_FILE="$(shell cat $(keyfile))" && \
	$(docker_run_interactive) ./lib/bastion --keyname $(keyname) --user $(user)

.PHONY: jump
jump: guard-keyname guard-user guard-server ##@bastion Jump access through bastion to another server
	export KEY_FILE="$(shell cat $(keyfile))" && \
	$(docker_run_interactive) ./lib/jump --keyname $(keyname) --user $(user) --server $(server)

.PHONY: clean
clean: ##@bastion Clean known_hosts
	rm -rv ~/.ssh/known_hosts

.PHONY: kubectl
kubectl: guard-region guard-cluster ##@eks Connect to an EKS cluster
	$(docker_run_interactive) ./lib/eks-connect --region $(region) --cluster $(cluster)

.PHONY: lint
lint: check tflint tfsec tffmt plan  ##@check Execute linters, security check and Terraform Plan

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