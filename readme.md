Hello World Challenge

main: 24/10/2022
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
>>>>>>>>WIP 