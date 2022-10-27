plan:
	terraform -chdir=./terraform init
	terraform -chdir=./terraform plan
up:
	terraform -chdir=./terraform init
	terraform -chdir=./terraform apply
	docker-compose up 
down:
	terraform -chdir=./terraform destroy
	docker-compose down
