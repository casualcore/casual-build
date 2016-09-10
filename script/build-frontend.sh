#! /bin/sh
cd /git/casual/webapp
bower update
touch bower_components/app-route/app-location.html
polymer build
chmod a+w -R .
