# set LIQUIBASE_COMMAND_URL=mongodb://medimpact.datical.net:27018/MYDB?authSource=admin
# set LIQUIBASE_COMMAND_USERNAME=mongoAdmin
# set LIQUIBASE_COMMAND_PASSWORD=password
set LIQUIBASE_HUB_MODE=all
set LIQUIBASE_HUB_API_KEY=02HcmDJzX_tg0YfTL9ecAE2M0PNbdnjbiNV1dWgbphU
set LIQUIBASE_COMMAND_CHANGELOG_FILE=centralChangeLog.xml
set LIQUIBASE_PRO_LICENSE_KEY=<paste_Liquibase_Pro_License_Key_here>
@REM set LIQUIBASE_CLASSPATH=C:\\Users\\Administrator\\Desktop\\MongoDB\\nosql\\drivers\\liquibase-mongodb-4.2.2.jar;C:\\Users\\Administrator\\Desktop\\MongoDB\\nosql\\drivers\\mongo-java-driver-3.12.7.jar
set LIQUIBASE_CLASSPATH=C:\\Users\\Administrator\\Desktop\\MongoDB\\nosql\\drivers\\liquibase-mongodb-4.8.0.jar;C:\\Users\\Administrator\\Desktop\\MongoDB\\nosql\\drivers\\mongo-java-driver-3.12.7.jar


set databaseName=%1
echo databaseName=%databaseName%

set LIQUIBASE_COMMAND_URL=mongodb+srv://amalik:amalik@cluster0.oqwht.mongodb.net/%databaseName%

liquibase --defaultsFile=dev.liquibase.properties --contexts=%databaseName% status --verbose -DdatabaseName=%databaseName% %2


