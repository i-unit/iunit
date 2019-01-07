# IUNIT IBM i Unit Testing Framework

Welcome to IUNIT. The lightweight extensible unit testing framework for IBM i.

## Prerequisites
* [IBM i package manager](https://bitbucket.org/ibmi/opensource/src/master/docs/yum/) (if that link is dead search 'ibm i yum package manager')  
* bash (yum install bash)  
* putty 

## First Time Access To IBMi
1. putty \<user\>@\<your.ibmi\>
2. \<password\>
3. echo 'exec /QOpenSys/pkgs/bin/bash' > .profile
4. echo 'export PS1="\v:\h@\w> \\[$(tput sgr0)\\]"' > .bashrc
5. echo 'PATH=/QOpenSys/pkgs/bin:$PATH' >> .bashrc
6. exit

## Second Time Access To IBMi
1. putty \<user\>@\<your.ibmi\>
2. \<password\>

## Building
git clone https://github.com/i-unit/iunit.git  
cd iunit  
source build.sh 
iunit.restore IUNIT  

## Using
Create a library 'mytest'  
Create a CLLE program named 'pass' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/PASS.CLLE)    

addlible iunit *last  
addlible mytest *last  
runall mytest

Create a CLLE program named 'fail' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/FAIL.CLLE)   
runall mytest
