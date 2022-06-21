# Author: Adeel Malik @ Liquibase

# If running MongoDB in a docker container, start the container using these commands:
# sudo docker pull mongo
# sudo docker run -d -p 27018:27017 -e MONGO_INITDB_ROOT_USERNAME=mongoAdmin -e MONGO_INITDB_ROOT_PASSWORD=password --name mymongodb mongo

# Sample run of this script: 
#   ./setup_dev.sh mydb
#   ./setup_dev.sh mydb --logLevel=info

export databaseName=${1}
echo databaseName=${databaseName}

export username=amalik
export password=amalik

export LIQUIBASE_COMMAND_URL=mongodb+srv://${username}:${password}@cluster0.oqwht.mongodb.net/${databaseName}
# export LIQUIBASE_COMMAND_USERNAME=amalik
# export LIQUIBASE_COMMAND_PASSWORD=amalik
export LIQUIBASE_COMMAND_CHANGELOG_FILE=centralChangeLog.xml
export LIQUIBASE_PRO_LICENSE_KEY=ABwwGgQUp6l3D3Do5GgK++KmJf+TpB4zu+kCAgQAg/s1gXqweWYIKrByfYsW8SsFG763I64VUtyMWNsLGyF+ptrzpsqFhG3pmqgEUeuGfXvW2S4BwGrd1xy/Tj3dWqXJ6h9DHUdmCcdafXkLNYqMr/X0QCviBMaa8ul2kq1gWQV6zKKdeLb2DaePtjhOutnMJzxV9+0MCivTXHhMzTJJu0OvuOr4ofkBn1b3Tv3awZ3/PjmAaGdYt0JEbqLN04ztqch/vL3BkXcrVQuc3ThEq2FMTgapjI7IpoeCP//64dR4rrYrqwMiBDrl71yBrBE11b2s73oybpCDYkW1CYAeX1DcvC/+Gt040tUO27Z0iVuZxJiKek6drCp3j59kYyLKNEg5KI2ZIm71B7gL8BgRsO+7NJhRerva7LbMzYLIMgPn1En4xkeoHKbQipsh2yf43/kVazmSqYSiFl8gMj3+G4Tp71m9wxr3EvO98CwsYcrAPLyEGZm/lZ3q/RGFCatmj3Nn/Kh0+yk5CPV30bdJjGPtiC0UJbIcqlQY5cbibqEEFRV2zWnItktjWeKBAEX09rJadTLRhFrmZAkooina8l9HHR05i1ee9E5z57a/jwKjpTLbAi/QzFCqkRizbwwSKnjLatO3/VmjIegopManUuwoDHfc6PCepVVYCsYiofwDqQ3jwYBg5gtVEcmFsikxA3QgGxEI6Z/bzeUFFLg=
export LIQUIBASE_CLASSPATH=drivers/liquibase-mongodb-4.8.0.jar:drivers/mongo-java-driver-3.12.7.jar


liquibase --contexts=${databaseName} status --verbose -DdatabaseName=${databaseName} ${2}
liquibase --contexts=${databaseName} update -DdatabaseName=${databaseName} ${2}
liquibase --contexts=${databaseName} history -DdatabaseName=${databaseName} ${2}

#liquibase --defaultsFile=dev.liquibase.properties --contexts=${databaseName} status --verbose -DdatabaseName=${databaseName} ${2}
# liquibase --defaultsFile=dev.liquibase.properties --contexts=${databaseName} update -DdatabaseName=${databaseName} ${2}
# liquibase --defaultsFile=dev.liquibase.properties --contexts=${databaseName} history -DdatabaseName=${databaseName} ${2}


