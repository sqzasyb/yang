@echo off

REM �쐬���̎Q�Ɛ�͉��L�̒ʂ�ł��B
REM http://d.hatena.ne.jp/language_and_engineering/20130502/PatternsOfMSDOSorBAT
REM �쐬�ҁF�k �d��   �쐬���F2015/04/10 
REM �X�V�ҁF�k        �X�V���F

IF {%1}=={} GOTO USAGE:
:loop
	cls
	REM �󔒍s��}������ɂ�
	ECHO.
	echo ------ %date%-%time% ------
	REM �e�X�g�p ping -n 5 192.168.0.118
	ping -n 5 %1
	ECHO.
	ECHO ==================================================================
	ECHO �Ď��o�b�`�I���ɂ́uCtrl�v+�uc�v�ŁA���������Ă��������B
	REM 20�b(ping -5 ��5�b)�Ԋu�ŌJ�Ԃ�
	REM �G���[���O���ꏏ�ɏ����o���܂��B
	echo ------ %date%-%time% ------ >> auto_mon_ping_log.txt 2>&1
	ping -n 5 %1 >> auto_mon_ping_log.txt 2>&1
	REM arp -a
	sleep 15
goto loop

:USAGE:
ECHO.
ECHO �Ď�IP�A�h���X���w�肵�Ă��������B
ECHO ��Fauto_mon_ping.cmd 192.168.11.100
ECHO.
:END
