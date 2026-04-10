.PHONY: ansible 

ANSIBLE_DIR := "infra/ansible"
TOFU_DIR := "infra/tofu"

tofu-init:
	cd $(TOFU_DIR) && tofu init

tofu-plan: 
	cd $(TOFU_DIR) && tofu plan 

tofu-apply:
	cd $(TOFU_DIR) && tofu apply \
	-auto-approve

tofu-destroy:
	cd $(TOFU_DIR) && tofu destroy \
	-auto-approve

# Runs post-install proxmox script and hw passthrough
init-proxmox: 
	ansible-galaxy install lae.proxmox
	ansible-galaxy collection install community.sops
	cd $(ANSIBLE_DIR) && ansible-playbook playbooks/proxmox.yml

# Initiates debian VM and starts it's services
init-debian:
	cd $(ANSIBLE_DIR) && ansible-playbook playbooks/debian/debian.yml
