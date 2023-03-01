init:
	$(shell cp hooks/pre-push .git/hooks/pre-push)
	$(shell chmod +x .git/hooks/pre-push)
	rm -rfd .terraform/
	terraform init -upgrade -backend=true -backend-config="global/backend.hcl"
	@echo "Repository initialized with success..."

check:
	./hooks/pre-push