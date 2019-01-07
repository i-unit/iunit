#!/QOpenSys/pkgs/bin/bash

# Copyright (c) 2019 Remain Software
# Contributors:
#      Wim Jongman - Original API and implementation

#
# Restore the IUNIT code from git into libraries and source files
# Parameters: library 
iunit.restore(){
  lib=$1

  if [[ -z "$1" ]]; then
    echo "Must provide library. (e.g. iunit.restore IUNIT)"
    exit 1
  fi
  
  txt="IBM i Unit Testing Framework"
  dir=$PWD
  restore.crtlib "${lib}" "${txt}"
  restore.crtsrcpf "${lib}" "${dir}" "${txt}"
  iunit.compile "$lib"
  system -Kn "ADDLIBLE ${lib} *LAST"
  echo
  system -Kn "RUNONE ${lib}/PASS"
  echo
  echo 'Done.'
}
  
## Create a library 
## Parameters: library, text 
restore.crtlib(){ 
  lib=$1 
  txt=$2 
  system -Kn "CRTLIB LIB(${lib}) TEXT('${txt}')" 
} 

## Create source files from all directories in the passed directory 
## Parameters: library, directory, text 
restore.crtsrcpf(){
  lib=$1
  dir=$2
  txt=$3
  
  pushd ${dir} >> /dev/null 
  for entry in */
    do
      file=${entry%%/}
      system -Kn "CRTSRCPF FILE(${lib}/${file}) RCDLEN(240) TEXT('"${txt}" ${file} Sources')" 
      restore.cpyfrmstmf ${lib} ${file} "${txt}"
    done   
  popd >> /dev/null 
} 

## Copy all files in the passed directory to the  
## sourcefile with the same name in the passed library 
## Parameters: library, directory/sourcefile, text  
restore.cpyfrmstmf(){ 
  lib=$1 
  dir=$2 
  srf=$2 
  txt=$3 
  pushd ${dir} >> /dev/null 
  for entry in * 
    do 
      if [ -f ${entry} ];then 
        atr="${entry##*.}"
        mbr="${entry%.*}"
        system -Kn "CPYFRMSTMF FROMSTMF('${PWD}/${entry}')" \
                              " TOMBR('/QSYS.LIB/${lib}.LIB/${srf}.FILE/${mbr}.MBR')" \
                              " MBROPT(*ADD)" \
                              " CVTDTA(*AUTO)" \
                              " STMFCCSID(*STMF)" \
                              " DBFCCSID(*FILE)"
        system -Kn "CHGPFM FILE(${lib}/${srf})" \
                         " MBR(${mbr})" \
                         " SRCTYPE(${atr})" \
                         " TEXT('Created by Remain Software')"
      fi 
    done
    popd >> /dev/null 
} 

#
# Compile the transport build command and execute it.
# Parameters: library 
iunit.compile(){
  lib=$1
  system -Kn "CRTBNDCL PGM(${lib}/@BUILD) SRCFILE(${lib}/QCLLESRC) SRCMBR(@BUILD)"
  system -Kn "call ${lib}/@BUILD PARM(${lib})"
  echo
  echo 'Compile Successful. Running example tests'

}
