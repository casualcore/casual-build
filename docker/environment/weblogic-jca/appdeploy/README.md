
# Run

To start the containerized Admin Server, run:

        $ docker run -d --name wlsadmin --hostname wlsadmin -p 7001:7001 casual-java/appdeploy

To start a containerized Managed Server to self-register with the Admin Server above, run:

        $ docker run -d --link wlsadmin:wlsadmin -p 7002:7002 casual-java/appdeploy createServer.sh

To let the container get access to localhost, run:

       $ docker run -d --name wlsadmin --net="host" -p 7001:7001 casual-java/appdeploy
