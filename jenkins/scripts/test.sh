#!/usr/bin/env sh

echo 'Deploy before testing'
mysql -u mockup -picandoit mockup_db < mockup_db.sql
pwd
set -x
java -jar target/mockup-0.0.1-SNAPSHOT-jar-with-dependencies.jar &
set +x
cd testcase/
mvn clean install
mvn test "-Dtest=Test.Runner"
