# IUNIT IBM i Unit Testing Framework

Welcome to IUNIT. The lightweight extensible unit testing framework for IBM i.  
Check [prerequisites.](https://github.com/i-unit/iunit/blob/master/PREREQUISITES.md)  

## Building
git clone https://github.com/i-unit/iunit.git  
cd iunit  
source build.sh 
iunit.restore IUNIT  

## Test
addlible iunit  
runone iunit pass  
runall

## Using
Create a library 'mytest'  
Create a CLLE program named 'pass' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/PASS.CLLE)   
addlible iunit *last  
ADDLIBLE LIB(MYTEST) POSITION(*BEFORE IUNIT)    
runall mytest  

Create a CLLE program named 'fail' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/FAIL.CLLE)   
runall mytest

## Workings
RUNALL runs all programs in the library that do not start with @  
Fail your test program by sending an escape message to *PRV with sndpgmmsg   
Make sure the tests do not hang in QSYSOPR message queue by monitoring all commands. Otherwise they will stall your test  
@SETUP is called before RUNONE and RUNALL run any tests (copy @SETUP source from IUNIT into your own library and modify)  
@TEARDOWN is called after RUNONE and RUNALL have ran all tests (copy @TEARDOWN source from IUNIT into your own library and modify)  

## Best practices
Do not depend one test on the result of another test  
A library is set of related tests. Create as many libraries as you need and call them sequentially  
When using [TD/OMS as your change management system.](https://remainsoftware.com) include tests in your compile or transfer   
