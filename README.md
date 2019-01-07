# IUNIT IBM i Unit Testing Framework

Welcome to IUNIT. The lightweight extensible unit testing framework for IBM i.

## Building
Open a SSH shell to anywhere on the IFS

git clone https://github.com/i-unit/iunit.git
./build.sh IUNIT

## Using
Create a library 'mytest'
Create a CLLE program named 'good' with this program source.

addlible iunit *last
addlible mytest *last
runall mytest

Create a CLLE program named 'fail' with this program source.
runall mytest
