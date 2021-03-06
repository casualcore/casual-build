#
# Spec for casual
#
Summary: Casual Middleware
Name: casual-middleware-dev
Version: %{casual_version}
Release: %{casual_release}
License: GPL
Group: Applications/System
Source: -
URL: http://casual.laz.se/redmine
Distribution: Redhat

Prefix: /usr/local/casual

Requires: casual-middleware >= 1.0

%description
This is the development package for casual-middleware

%prep
%build
%install
install -m 0755 -d $RPM_BUILD_ROOT/usr/local/casual/middleware/include
install -m 0755 -d $RPM_BUILD_ROOT/usr/local/casual/middleware/include/buffer

install -m 0755  %{source_root}/usr/local/casual/include/* $RPM_BUILD_ROOT/usr/local/casual/middleware/include
install -m 0755  %{source_root}/usr/local/casual/include/buffer/* $RPM_BUILD_ROOT/usr/local/casual/middleware/include/buffer

%files
/usr/local/casual/middleware/include
/usr/local/casual/middleware/include/buffer

%changelog
* Tue Sep  22 2015  Fredrik Eriksson <lazan@laz.se> 
- Some insightful comment

