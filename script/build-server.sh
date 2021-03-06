#! /bin/sh
cd /git/casual
#casual-make --debug -a make && casual-make clean && casual-make --debug -a --use-valgrind compile && casual-make --debug -a --use-valgrind link 
casual-make make && casual-make clean && casual-make compile && casual-make link 
ISOLATED_UNITTEST_DIRECTIVES="--gtest_output='xml:report.xml'" casual-make test
casual-make install
tar cvf /git/casual/casual.tar /usr/local/casual
casual-make clean
#find . -name ".casual" | xargs rm -rf
#find middleware -name "obj" | xargs rm -rf
#find middleware -name "bin" | xargs rm -rf
#find middleware -name ".unttest_domain_home" | xargs rm -rf
chmod a+w -R .
