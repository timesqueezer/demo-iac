default: setup

.PHONY: setup
setup:
	ansible-galaxy collection install community.docker

.PHONY: terraform
terragrunt:
	export TG_LOG_FORMAT=bare && \
	cd terraform/environments/local && \
	terragrunt init && \
	terragrunt plan && \
	terragrunt apply -auto-approve

.PHONY: ansible
ansible:
	cd ansible && \
	ansible-playbook -i inventory.ini playbook.yml

.PHONY: cleanup
cleanup:
	cd terraform/environments/local && \
	terragrunt destroy -auto-approve
