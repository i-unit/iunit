# IUNIT IBM i Unit Testing Framework

Welcome to IUNIT. The lightweight extensible unit testing framework for IBM i.  
Check [prerequisites.](https://github.com/i-unit/iunit/blob/master/PREREQUISITES.md)  

## Building in library IUNIT
git clone https://github.com/i-unit/iunit.git  
cd iunit  
source build.sh  
iunit.restore IUNIT  

## Test
addlible iunit  
runone iunit pass  
runall iunit

## Using
Create a library 'mytest'  
Create a CLLE program named 'pass' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/PASS.CLLE)   
addlible iunit *last  
ADDLIBLE LIB(MYTEST) POSITION(*BEFORE IUNIT)    
runall mytest  

Create a CLLE program named 'fail' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/FAIL.CLLE)   
runall mytest

## Workings
RUNALL runs all programs in the library that do not start with I_  
Fail your test program by sending an escape message to *PRV with sndpgmmsg   
Make sure the tests do not hang in QSYSOPR message queue by monitoring all commands. Otherwise they will stall your test  
I_SETUP is called before RUNONE and RUNALL run any tests  
I_TEARDOWN is called after RUNONE and RUNALL have ran all tests 

## Best practices
Do not depend one test on the result of another test  
A library is set of related tests. Create as many libraries as you need and call them sequentially  
When using [TD/OMS as your change management system.](https://remainsoftware.com) include tests in your compile or transfer   

## Tips
Copy I_SETUP and I_TEARDOWN source from IUNIT into your test libraries and modify  
You can copy IUNIT into your test library so that it is completely self contained  

## Contribute
Did you add functions to IUNIT (like logging)?. Consider contributing back by creating a pull request.

## License
[MIT](https://opensource.org/licenses/MIT)
Copyright 2019 [Remain BV](https://remainsoftware.com) 
