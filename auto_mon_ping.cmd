@echo off

REM 作成中の参照先は下記の通りです。
REM http://d.hatena.ne.jp/language_and_engineering/20130502/PatternsOfMSDOSorBAT
REM 作成者：楊 慧泉   作成日：2015/04/10 
REM 更新者：楊        更新日：

IF {%1}=={} GOTO USAGE:
:loop
	cls
	REM 空白行を挿入するには
	ECHO.
	echo ------ %date%-%time% ------
	REM テスト用 ping -n 5 192.168.0.118
	ping -n 5 %1
	ECHO.
	ECHO ==================================================================
	ECHO 監視バッチ終了には「Ctrl」+「c」で、同時押してください。
	REM 20秒(ping -5 約5秒)間隔で繰返し
	REM エラーログも一緒に書き出します。
	echo ------ %date%-%time% ------ >> auto_mon_ping_log.txt 2>&1
	ping -n 5 %1 >> auto_mon_ping_log.txt 2>&1
	REM arp -a
	sleep 15
goto loop

:USAGE:
ECHO.
ECHO 監視IPアドレスを指定してください。
ECHO 例：auto_mon_ping.cmd 192.168.11.100
ECHO.
:END
