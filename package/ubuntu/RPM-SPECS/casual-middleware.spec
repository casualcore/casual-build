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
URL: http://casual.laz.se/redmine
Distribution: Redhat

Prefix: /usr/local/casual

%description
This is the core package for casual-middleware

%prep
%build
%install
install -m 0755 -d $RPM_BUILD_ROOT/usr/local/casual/middleware/bin
install -m 0755 -d $RPM_BUILD_ROOT/usr/local/casual/middleware/lib
install -m 0755 -d $RPM_BUILD_ROOT/usr/local/casual/middleware/configuration
install -m 0755 -d $RPM_BUILD_ROOT/usr/local/casual/middleware/internal
install -m 0755 -d $RPM_BUILD_ROOT/usr/local/casual/middleware/internal/bin

install -m 0755  %{source_root}/casual/usr/local/bin/* $RPM_BUILD_ROOT/usr/local/casual/middleware/bin
install -m 0755  %{source_root}/casual/usr/local/lib/* $RPM_BUILD_ROOT/usr/local/casual/middleware/lib
install -m 0755  %{source_root}/casual/usr/local/configuration/* $RPM_BUILD_ROOT/usr/local/casual/middleware/configuration
install -m 0755  %{source_root}/casual/usr/local/internal/bin/* $RPM_BUILD_ROOT/usr/local/casual/middleware/internal/bin

%files
/usr/local/casual
/usr/local/casual/middleware
/usr/local/casual/middleware/bin
/usr/local/casual/middleware/lib
/usr/local/casual/middleware/configuration
/usr/local/casual/middleware/internal
/usr/local/casual/middleware/internal/bin

%changelog
* Tue Sep  22 2015  Fredrik Eriksson <lazan@laz.se> 
- Some insightful comment

