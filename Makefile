.PHONY: ansible 

ANSIBLE_DIR := "infra/ansible"
TOFU_DIR := "infra/tofu"
HOMELAB_KEY := $(HOME)/.ssh/homelab_key
ANSIBLE_INVENTORY := $(ANSIBLE_DIR)/inventory.ini

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

init-proxmox: 
	ansible-galaxy install lae.proxmox
	ansible-galaxy collection install community.sops
	cd $(ANSIBLE_DIR) && ansible-playbook playbooks/proxmox.yml

init-debian:
	cd $(ANSIBLE_DIR) && ansible-playbook playbooks/debian/debian.yml
