dev-init:
	@terraform-init -backend-config=backend/dev.tfvar -no-color
dev-apply:
	@terraform-apply -var-file=Env/dev.tfvars -auto-approve -no-color
dev-destroy:
	@terraform-destroy -var-file=Env/dev.tfvars -auto-approve -no-color
prod-init:
	@terraform-init -backend-config=backend/dev.tfvar -no-color
prod-apply:
	@terraform-apply -var-file=Env/dev.tfvars -auto-approve -no-color
prod-destroy:
	@terraform-destroy -var-file=Env/dev.tfvars -auto-approve -no-color