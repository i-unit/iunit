# Prerequisites
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
