# Minishift instructions

Make sure that minishift is started, then that you are logged in 
* eval $(minishift docker-env)
* docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)

Build the images needed using:
(casual)
../../../casual/build.sh

Note, you should then only build the layer that you are working on and what extends that

tag and push casual-domain to the registry via ../../casual/openshift/tag-and-push-casual-domain.sh

(wls)
../build.sh

Note, you should then only build the layer that you are working on and what extends that

tag and push casual-weblogic-jca to the registry via ./tag-and-push-wls-casual-java-test-application.sh

# Create application
./create-application.sh

# Delete application
./delete-application.sh


To test a call from java to casual, to java again:
http://your-external-route/casual-with-wls-java/example/echo/testJavaService/asdf?bufferType=fielded
