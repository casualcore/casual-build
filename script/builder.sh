#! /bin/sh
cd /git/casual
find . -name "obj" | xargs rm -rf
find . -name "bin" | xargs rm -rf
casual-make make && casual-make clean && casual-make compile && casual-make link 
ISOLATED_UNITTEST_DIRECTIVES="--gtest_output='xml:report.xml'" casual-make --debug -a -i test
casual-make install
tar cvf /git/casual/casual.tar /usr/local/casual
casual-make clean

