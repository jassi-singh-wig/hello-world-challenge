Hello World Challenge:

Pre-requisite:
    a. Docker, docker-compose should be running on the host
    b. Terraform should be installed on the host

All apps are running in docker
- Sample app (flask app) - installed using terraform (check terraform folder - creating network, building and deploying container), with environment variable `HW_ENV_VAR` displayed in UI
- elasticsearch, kibana, filebeat, logstash installed in same docker network
- hw-kibana-update python script to update/create index patterns, search, dashboard using saved_objects
- `ansible installed in same docker network, but not working as expected`

Steps to start the exercise:

1. In the project folder execute: `make up` 
2. Apps: Sample python app (flask app), accessible on [localhost:5002](localhost:5002)
3. Kibana, accessible on [localhost:5601](localhost:5002)
4. To re-install/install index_patterns, search, dashboard execute: `make update`
5. To destroy all. execute: `make down`

---

day1: 24/10/2022
1. Sample Flask app
2. ES, Kibana, Filebeat installed
3. Container logs sent from the app + ES + Kibana + filebeat to ES using Filebeat --> Need to exclude all except Flask app logs

day2: 25/10/2022
1. Sample Flask app, updated to log in a local file
2. Flask app logs saved in file sent to ES using Filebeat (used filestream instead of container)
3. Updated to send logs from filebeat to Logstash, to extract & append some fields
4. Saved search in kibana
5. Created dashboard in kibana

day3: 26/10/2022
Pending:
    a. Store hello world env. variable in github
    b. Insert hello world env. variable using ansible
    c. app must read and output env. variable to screen
    d. Install app using terraform
1. Installed app using terraform
2. Envrionment variable added in app


day4: 27/10/2022
Pending:
    a. Store hello world env. variable in github
    b. Insert hello world env. variable using ansible

1. App is able to display env. variable
2. Make file updated for simple commands 
3. App is built & installed using tf

day5-6: 28/10/2022 31/10/2022
Pending:
Ansible :(