#! /bin/sh
cd /git/casual
casual-make make && casual-make clean && casual-make compile && casual-make link 
ISOLATED_UNITTEST_DIRECTIVES="--gtest_output='xml:report.xml'" casual-make --debug -a -i test
casual-make install
tar cvf /git/casual/casual.tar /usr/local/casual
casual-make clean
find middleware -name "obj" | xargs rm -rf
find middleware -name "bin" | xargs rm -rf
find middleware -name ".unttest_domain_home" | xargs rm -rf
find middleware -name ".casual" | xargs rm -rf
find thirdparty/unittest/gtest/  -name ".casual" | xargs rm -rf
