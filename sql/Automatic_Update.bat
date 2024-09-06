@echo off
sqlcmd -S <PC-AGUSTIN\SQLEXPRESS> -d NBA_Player_Performance_DB -E -i "C:\Users\Agus\Desktop\Automatizacion_carga_datos.sql"

