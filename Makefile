plan:
	terraform -chdir=./terraform init
	terraform -chdir=./terraform plan
up:
	terraform -chdir=./terraform init
	terraform -chdir=./terraform apply
	docker-compose up -d
down:
	terraform -chdir=./terraform destroy
	docker-compose down
