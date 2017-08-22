## Bring up containers

From this project root directory

`docker-compose build --no-cache`  
`docker-compose up -d`

## Bringing down containers

If you've made a change to any of the configurations (docker, nginx, tomcat), then you just need to bring down the containers and then bring them back up.   From this project root directory

`docker-compose down`   
`docker-compose build --no-cache`  
`docker-compose up -d`

## Accessing tomcat 

In web browser go to http://localhost:5000.  You can change port 5000 in the docker-compose.yml file.  Find this line:

`- "5000:80"`

Change 5000 to any unused port

## Accessing hello world war file

By default this container will have the sample.war (hello world). You should be able to go to the following url to access:

http://localhost:5000/sample/

## Changing to deploy a different war file on startup

Put your actual war file into the tomcat/webapps directory and then edit the tomcat/Dockerfile, changing the sample.war file to your new war file:

`COPY webapps/sample.war /usr/local/tomcat/webapps/`

change to 

`COPY webapps/newwarfile.war /usr/local/tomcat/webapps/`

## Deploying a war file through the manager

Go to your manager app (username: admin, password: admin) and you'll see a section for uploading your war file.

In your browser, go to the server running docker,  http://localhost:5000/manager/html

Manager app username and password can be found in the tomcat/conf/context.xml directory if you want to change

## Deploying a war file through custom shell script

Put your war file inside the tomcat/webapps directory (example: test.war) and then run the following command from within that directory

`./deploy_webapp.sh test.war`

You should be able to then go to http://localhost:5000/test/


## Notes

This should not be used in production as is, because the tomcat manager is open to any ip with a basic username/password.   Both of these can be adjusted by the config files in the tomcat directory
