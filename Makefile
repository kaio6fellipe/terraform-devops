init:
	$(shell cp hooks/pre-push .git/hooks/pre-push)
	$(shell chmod +x .git/hooks/pre-push)
	rm -rfd .terraform/
	terraform init -upgrade -backend=true -backend-config="global/backend.hcl"
	@echo "Repository initialized with success..."

plan:
	terraform init -backend=true -backend-config="global/backend.hcl" && \
	export TF_VAR_SSH_PRIVATE_KEY="" && \
	export TF_VAR_AWS_RDS_PASSWORD="" && \
	export TF_VAR_ANSIBLE_VAULT_PASSWORD="" && \
	terraform plan -var-file="global/terraform.tfvars" && \
	unset TF_VAR_SSH_PRIVATE_KEY && \
	unset TF_VAR_AWS_RDS_PASSWORD && \
	unset TF_VAR_ANSIBLE_VAULT_PASSWORD

check:
	./hooks/pre-push