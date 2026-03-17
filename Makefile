.PHONY: ansible 

ANSIBLE_DIR := "infrastructure/ansible"
HOMELAB_KEY := $(HOME)/.ssh/homelab_key
ANSIBLE_INVENTORY := $(ANSIBLE_DIR)/inventory.ini

add-node:
	@if [ -z "$(IP)" ]; then \
		echo "IP is required. Usage: make add-node IP=x.x.x.x"; \
		exit 1; \
	fi
	@touch $(ANSIBLE_INVENTORY)
	@if grep -qw "$(IP)" $(ANSIBLE_INVENTORY); then \
		echo "Node $(IP) already exists in $(ANSIBLE_INVENTORY). Skipping."; \
	else \
		grep -q "\[proxmox_nodes\]" $(ANSIBLE_INVENTORY) || echo "[proxmox_nodes]" >> $(ANSIBLE_INVENTORY); \
		sed -i '/\[proxmox_nodes]/a $(IP) ansible_user=root $(EXTRA)' $(ANSIBLE_INVENTORY); \
		echo "Added node $(IP) to $(ANSIBLE_INVENTORY)"; \
	fi

playbook: 
	ansible-galaxy install lae.proxmox
	ansible-playbook -i $(ANSIBLE_DIR)/inventory.ini $(ANSIBLE_DIR)/proxmox.yml \
