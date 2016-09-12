#! /bin/sh
cd /git/casual/webapp
bower update --allow-root
touch bower_components/app-route/app-location.html
polymer build
cd ..
zip -r casual-webapp.zip webapp
chmod a+w -R .
