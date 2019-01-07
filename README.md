# IUNIT IBM i Unit Testing Framework

Welcome to IUNIT. The lightweight extensible unit testing framework for IBM i.

## Building
Open a SSH shell to the IFS

git clone https://github.com/i-unit/iunit.git  
cd iunit  
./build.sh IUNIT  

## Using
Create a library 'mytest'  
Create a CLLE program named 'pass' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/PASS.CLLE)    

addlible iunit *last  
addlible mytest *last  
runall mytest

Create a CLLE program named 'fail' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/FAIL.CLLE)   
runall mytest
