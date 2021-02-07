#!/usr/bin/env sh

ps aux | grep mockup-1.0-SNAPSHOT-jar-with-dependencies.jar | awk '{print $2}' | xargs kill -9 || true
