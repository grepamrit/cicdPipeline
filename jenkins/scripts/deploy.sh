#!/usr/bin/env sh

echo 'Deploy Finally'
mysql -u mockup -phellomoco mockup_db < mockup_db.sql
rm -rf /home/jenkins/deploy/maven-mockup/*
cp target/mockup-0.0.1-SNAPSHOT-jar-with-dependencies.jar /home/jenkins/deploy/maven-mockup
cp -r etc /home/jenkins/deploy/maven-mockup/
set -x
java -jar /home/jenkins/deploy/maven-mockup/mockup-0.0.1-SNAPSHOT-jar-with-dependencies.jar &
set +x
