include help.mk

keyname?=id_rsa
user?=""
server?=""
init?=false

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "argument '$*' is required"; \
		exit 1; \
	fi

.PHONY: init
init: guard-init ##@repository Init repository config and hooks and reset .terraform cache
ifeq ($(init), true)
	$(shell cp hooks/pre-push .git/hooks/pre-push)
	$(shell chmod +x .git/hooks/pre-push)
	rm -rfd .terraform/
	terraform init -upgrade -backend=true -backend-config="global/backend.hcl"
	@echo "Repository initialized with success..."
else
	@echo "To init the repository pass the parameter init=true"
endif

.PHONY: plan
plan: ##@terraform Execute Terraform Plan
	terraform init -backend=true -backend-config="global/backend.hcl" && \
	export TF_VAR_SSH_PRIVATE_KEY="" && \
	export TF_VAR_AWS_RDS_PASSWORD="" && \
	export TF_VAR_ANSIBLE_VAULT_PASSWORD="" && \
	export TF_VAR_ADMIN_USER_ARN="" && \
	export TF_VAR_ADMIN_USER_NAME="" && \
	terraform plan -var-file="global/terraform.tfvars" && \
	unset TF_VAR_SSH_PRIVATE_KEY && \
	unset TF_VAR_AWS_RDS_PASSWORD && \
	unset TF_VAR_ANSIBLE_VAULT_PASSWORD && \
	unset TF_VAR_ADMIN_USER_ARN && \
	unset TF_VAR_ADMIN_USER_NAME

.PHONY: bastion
bastion: guard-keyname ##@bastion Get access directly to bastion server
	ssh -i $(keyname) ec2-user@bastion-dev.ktech-devops.com.br

.PHONY: jump
jump: guard-keyname guard-user guard-server ##@bastion Jump access through bastion to another server
	ssh -A -i $(keyname) -J $(user)@bastion-dev.ktech-devops.com.br $(user)@$(server)

.PHONY: clean
clean: ##@bastion Clean known_hosts
	rm -rv ~/.ssh/known_hosts

.PHONY: check
check: ##@check Execute pre-push hook
	./hooks/pre-push