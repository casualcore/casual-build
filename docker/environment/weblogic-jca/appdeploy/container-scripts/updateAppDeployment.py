import os

# Deployment Information 
admin_name = os.environ.get('ADMIN_NAME', 'weblogic')
passwd = os.environ.get('WLS_PASSWD', 'weblogic1')
app_deployment_plan = os.environ.get('APP_DEPLOYMENT_PLAN', 'exampleDeploymentPlan.xml')
appname    = os.environ.get('APP_NAME', 'casual-jca')
appdir     = os.environ.get('APP_PKG_LOCATION', '/u01/oracle')
wlshost = os.environ.get('WLS_HOST', 't3://127.0.0.1:7001')

# dump info
print('appname : [%s]' % appname);
print('appdir : [%s]' % appdir);
print('app_deployment_plan : [%s]' % app_deployment_plan);
print('wlshost : [%s]' % wlshost);

connect(admin_name, passwd, wlshost)
edit()
startEdit()
updateApplication(appname, app_deployment_plan)
save()
activate()
disconnect()
exit()

