BIN_LIB=IUNIT
DBGVIEW=*ALL

all: $(BIN_LIB).lib RUNALL.clle RUNONE.clle SETUP.clle TEARDOWN.clle RUNALL.cmd RUNONE.cmd UTEMSG.msgf VERSION.dtaara
	@echo "Built all!"

UTEMSG.msgf:
	system "CRTMSGF MSGF($(BIN_LIB)/UTEMSG)"
	system "ADDMSGD MSGID(UTE0001) MSGF($(BIN_LIB)/UTEMSG) MSG('&1') SECLVL('&N Cause . . . . . :   The unit test program reported the following non critical message. &N Recovery. . . . :   None needed') FMT((*CHAR 120)) CCSID(*JOB)"
	system "ADDMSGD MSGID(UTE0002) MSGF($(BIN_LIB)/UTEMSG) MSG('&1') SECLVL('&n Cause . . . . . :   The unit test program reported the following critical error. & N Recovery. . . . :   See the lower level messages for details') SEV(40) FMT((*CHAR 120)) CCSID(*JOB)"
	system "ADDMSGD MSGID(UTE0003) MSGF($(BIN_LIB)/UTEMSG) MSG('-------------- Starting Unit &1 --------------') FMT((*CHAR 32)) CCSID(*JOB)"
	system "ADDMSGD MSGID(UTE5000) MSGF($(BIN_LIB)/UTEMSG) MSG('Start of User Messages') SECLVL('All user messages are UTE5001 and higher') CCSID(*JOB)"

VERSION.dtaara:
	system "CRTDTAARA DTAARA($(BIN_LIB)/VERSION) TYPE(*CHAR) LEN(25) VALUE('0.1.0.201901070019') TEXT('0.1.0.201901070019')"

%.lib:
	-system -qi "CRTLIB $* TYPE(*TEST)"
	-system -qi "CRTSRCPF FILE($(BIN_LIB)/QCLLESRC) RCDLEN(240)"
	-system -qi "CRTSRCPF FILE($(BIN_LIB)/QCMDSRC) RCDLEN(240)"
	
%.clle:
	system "CPYFRMSTMF FROMSTMF('QCLLESRC/$*.CLLE') TOMBR('/QSYS.lib/$(BIN_LIB).lib/QCLLESRC.file/$*.mbr') MBROPT(*ADD)"
	system "CRTBNDCL PGM($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/QCLLESRC) DFTACTGRP(*NO) ACTGRP(*NEW)"
	
%.cmd:
	system "CPYFRMSTMF FROMSTMF('QCMDSRC/$*.CMD') TOMBR('/QSYS.lib/$(BIN_LIB).lib/QCMDSRC.file/$*.mbr') MBROPT(*ADD)"
	system "CRTCMD CMD($(BIN_LIB)/$*) PGM($*) SRCFILE($(BIN_LIB)/QCMDSRC)"
	
clean:
	-system -qi "CLRLIB $(BIN_LIB)"