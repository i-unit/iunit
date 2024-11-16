# Prerequisites
* [IBM i package manager](https://ibmi-oss-docs.readthedocs.io/en/latest/yum/README.html) (if that link is dead search 'ibm i yum package manager')  
* bash (yum install bash)  
* putty or ssh client 

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
