# Image build order

* java
* wls
* domain
* appdeploy

# Prerequisites
## java
Download the jre from http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html and put it in the java dir

## wls
Download fmw_12.2.1.3.0_wls_quick_Disk1_1of1.zip from http://www.oracle.com/technetwork/middleware/weblogic/downloads/wls-for-dev-1703574.html and put it in wls/12.2.1.3

# Info

## domain
The domain image is only for an adminserver, no appserver

## appdeploy
Contains casual-jca and a test application
You can drive the test application via a REST interface such as:

* http://127.0.0.1:7001/casual-java-testapp/example/echo/bazinga?bufferType=fielded ( json is also a valid buffer type)
* http://127.0.0.1:7001/casual-java-testapp/example/queue/enqueue/bazinga?queuespace=casual&queuename=testQueue
* http://127.0.0.1:7001/casual-java-testapp/example/queue/dequeue?queuespace=casual&queuename=testQueue

Obviously the names and what you can do depends on your casual domain setup

