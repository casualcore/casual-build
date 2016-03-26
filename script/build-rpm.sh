#! /bin/bash

mkdir -p RPM/BUILD RPM/RPMS RPM/SOURCES RPM/SPECS RPM/SRPMS

rpmbuild -bb --define "source_root $(pwd)" --define "casual_version $1" --define "casual_release $2" build/RPM-SPECS/casual-middleware.spec
rpmbuild -bb --define "source_root $(pwd)" --define "casual_version $1" --define "casual_release $2" build/RPM-SPECS/casual-middleware-dev.spec

