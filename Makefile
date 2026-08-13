setup:
	cd infra && ansible-playbook setup.yml -K

setup-format-disk:
	cd infra && ansible-playbook setup.yml -K --tags never

core-deploy-and-sync:
	cd infra && ansible-playbook core.yml

core-sync:
	cd infra && ansible-playbook core.yml --tags sync

core-deploy:
	cd infra && ansible-playbook core.yml --tags deploy
