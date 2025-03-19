default: setup

setup:
	ansible-galaxy collection install community.docker

terragrunt-clean:
	rm -rf terraform/environments/local/.terraform
	rm -f terraform/environments/local/terraform.tfstate
	rm -f terraform/environments/local/terraform.tfstate.backup
	rm -rf terraform/environments/local/.terragrunt-cache

terragrunt: terragrunt-clean
	cd terraform/environments/local && \
	terragrunt init && \
	terragrunt plan && \
	terragrunt apply -auto-approve

ansible:
	cd ansible && \
	ansible-playbook -i inventory.ini playbook.yml

cleanup:
	cd terraform/environments/local && \
	terragrunt destroy -auto-approve
