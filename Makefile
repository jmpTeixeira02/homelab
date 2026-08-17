setup:
	cd ansible && ansible-playbook setup.yml -K

setup-format-disk:
	cd ansible && ansible-playbook setup.yml -K --tags never

core-deploy-and-sync:
	cd ansible && ansible-playbook core.yml

core-sync:
	cd ansible && ansible-playbook core.yml --tags sync

core-deploy:
	cd ansible && ansible-playbook core.yml --tags deploy
