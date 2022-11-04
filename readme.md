# Hello World Challenge

## Pre-requisite:
- Docker, docker-compose should be running on the host
- Terraform should be installed on the host
- Ansible should be installed on the host (to run it locally)


### All apps are running in docker
- Sample app (flask app) - installed using terraform (check terraform folder - creating network, building and deploying container), with environment variable `HW_ENV_VAR` displayed in UI
- elasticsearch, kibana, filebeat, logstash installed in same docker network
- hw-kibana-update python script to update/create index patterns, search, dashboard using saved_objects
- `ansible installed in same docker network, but not working as expected`
- Now running ansible in local

### Ansible:
1. docker exec -it ansible /bin/sh
2. `Able to ping other host (Enter password=test, when prompted)` ansible default -i hosts -u test -m ping -k -b
3. `Able to run command like hostname (Enter password = test)` ansible-playbook -i hosts test.yml -k -b -vvvv (It's able to ping back the container id of the hello-world app container)
4. Getting error on trying to use docker_container plugin ansible-playbook -i hosts main.yml -k -b -vvvv : `fatal: [hello-world]: FAILED! => {"changed": false, "msg": "Error connecting: Error while fetching server API version: ('Connection aborted.', FileNotFoundError(2, 'No such file or directory'))"}` Full [log](./ansible_error.log) attached for reference
5. ~~Not able to figure out any other ways :( SOS~~
6. Ansible should be installed on host, Running ansible locally to update the variables.tf file, where environment variable is stored, and then running tf again to re-deploy the container.

### Steps to start the exercise:

1. In the project folder execute: `make up` 
2. Apps: Sample python app (flask app), accessible on [localhost:5002](http://localhost:5002/)
3. Kibana, accessible on [localhost:5601](http://localhost:5601/)
4. To re-install/install index_patterns, search, dashboard execute: `make update-kibana`
5. Search [link](http://localhost:5601/app/discover#/view/hello-world-search?_g=(filters%3A!()%2CrefreshInterval%3A(pause%3A!t%2Cvalue%3A0)%2Ctime%3A(from%3Anow-7d%2Cto%3Anow)))
6. Dashboard [link](http://localhost:5601/app/dashboards#/view/hello-world-dashboard?_g=(filters%3A!()%2Cquery%3A(language%3Akuery%2Cquery%3A'')%2CrefreshInterval%3A(pause%3A!t%2Cvalue%3A0)%2Ctime%3A(from%3Anow-7d%2Cto%3Anow))) 
7. Update environment variable `make update-env`
8. To destroy all. execute: `make down`

---

#### day1: 24/10/2022
https://github.com/jassi-singh-wig/hello-world-challenge/tree/day1
1. Sample Flask app
2. ES, Kibana, Filebeat installed
3. Container logs sent from the app + ES + Kibana + filebeat to ES using Filebeat --> Need to exclude all except Flask app logs

#### day2: 25/10/2022
https://github.com/jassi-singh-wig/hello-world-challenge/tree/day2
1. Sample Flask app, updated to log in a local file
2. Flask app logs saved in file sent to ES using Filebeat (used filestream instead of container)
3. Updated to send logs from filebeat to Logstash, to extract & append some fields
4. Saved search in kibana
5. Created dashboard in kibana

#### day3: 26/10/2022
https://github.com/jassi-singh-wig/hello-world-challenge/tree/day3
Pending:
    a. Store hello world env. variable in github
    b. Insert hello world env. variable using ansible
    c. app must read and output env. variable to screen
    d. Install app using terraform
1. Installed app using terraform
2. Envrionment variable added in app


#### day4: 27/10/2022
https://github.com/jassi-singh-wig/hello-world-challenge/tree/day4
Pending:
    a. Store hello world env. variable in github
    b. Insert hello world env. variable using ansible

1. App is able to display env. variable
2. Make file updated for simple commands 
3. App is built & installed using tf

#### day5-6: 28/10/2022 31/10/2022
https://github.com/jassi-singh-wig/hello-world-challenge/tree/day5
Pending:
Ansible :(