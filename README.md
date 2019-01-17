# IUNIT IBM i Unit Testing Framework

Welcome to IUNIT. The lightweight extensible unit testing framework for IBM i.  
Check [prerequisites.](https://github.com/i-unit/iunit/blob/master/PREREQUISITES.md)  

## Building

1. `git clone https://github.com/i-unit/iunit.git`
2. `cd iunit`
3. `source build.sh`
4. `iunit.restore IUNIT`

## Test

1. `addlible iunit`
2. `runone iunit pass`
3. `runall`

## Using

1. Create a library 'mytest'  
2. Create a CLLE program named 'pass' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/PASS.CLLE)   
3. `addlible iunit *last`
4. `ADDLIBLE LIB(MYTEST) POSITION(*BEFORE IUNIT)`
5. `runall mytest`
6. Create a CLLE program named 'fail' [with this program source.](https://raw.githubusercontent.com/i-unit/iunit/master/QCLLESRC/FAIL.CLLE)   
7. `runall mytest`

## Workings

* RUNALL runs all programs in the library that do not start with `@`
* Fail your test program by sending an escape message to `*PRV` with sndpgmmsg   
* Make sure the tests do not hang in `QSYSOPR` message queue by monitoring all commands. Otherwise they will stall your test  
* `SETUP` is called before `RUNONE` and `RUNALL` run any tests  
* `TEARDOWN` is called after `RUNONE` and `RUNALL` have ran all tests 

## Best practices

* Do not depend one test on the result of another test  
* A library is set of related tests. Create as many libraries as you need and call them sequentially  
* When using [TD/OMS as your change management system.](https://remainsoftware.com) include tests in your compile or transfer   

## Tips

* Copy `SETUP` and `TEARDOWN` source from `IUNIT` into your test libraries and modify  
* You can copy `IUNIT` into your test library so that it is completely self contained  

## Contribute

Did you add functions to `IUNIT` (like logging)?. Consider contributing back by creating a pull request.

## License

[MIT](https://opensource.org/licenses/MIT)
Copyright 2019 [Remain BV](https://remainsoftware.com) 
