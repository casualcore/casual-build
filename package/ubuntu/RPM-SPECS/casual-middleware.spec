#
# Spec for casual
#
Summary: Casual Middleware
Name: casual-middleware
Version: %{casual_version}
Release: %{casual_release}
License: GPL
Group: Applications/System
Source: -
URL: https://bitbucket.org/casualcore/casual
Distribution: Centos

Prefix: /opt/casual

%description
This is the core package for casual-middleware

%prep
%build
%install
install -m 0755 -d $RPM_BUILD_ROOT/opt/casual/middleware/bin
install -m 0755 -d $RPM_BUILD_ROOT/opt/casual/middleware/lib
install -m 0755 -d $RPM_BUILD_ROOT/opt/casual/middleware/configuration
install -m 0755 -d $RPM_BUILD_ROOT/opt/casual/middleware/configuration/example
install -m 0755 -d $RPM_BUILD_ROOT/opt/casual/middleware/internal
install -m 0755 -d $RPM_BUILD_ROOT/opt/casual/middleware/internal/bin

install -m 0755  %{source_root}/opt/casual/bin/* $RPM_BUILD_ROOT/opt/casual/middleware/bin
install -m 0755  %{source_root}/opt/casual/lib/* $RPM_BUILD_ROOT/opt/casual/middleware/lib
install -m 0755  %{source_root}/opt/casual/configuration/example/* $RPM_BUILD_ROOT/opt/casual/middleware/configuration/example
install -m 0755  %{source_root}/opt/casual/internal/bin/* $RPM_BUILD_ROOT/opt/casual/middleware/internal/bin

%files
/opt/casual
/opt/casual/middleware
/opt/casual/middleware/bin
/opt/casual/middleware/lib
/opt/casual/middleware/configuration
/opt/casual/middleware/internal
/opt/casual/middleware/internal/bin

%changelog
* Tue Sep  22 2015  Fredrik Eriksson <lazan@laz.se> 
- Some insightful comment

