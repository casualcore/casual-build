#! /bin/bash

SOURCE_ROOT=$1
CASUAL_VERSION=$2
CASUAL_RELEASE=$3
SPEC_ROOT=$4

mkdir -p RPM/BUILD RPM/RPMS RPM/SOURCES RPM/SPECS RPM/SRPMS

rpmbuild -bb --define "source_root $SOURCE_ROOT" --define "casual_version $CASUAL_VERSION" --define "casual_release $CASUAL_RELEASE" $SPEC_ROOT/RPM-SPECS/casual-middleware.spec
rpmbuild -bb --define "source_root $SOURCE_ROOT" --define "casual_version $CASUAL_VERSION" --define "casual_release $CASUAL_RELEASE" $SPEC_ROOT/RPM-SPECS/casual-middleware-dev.spec

