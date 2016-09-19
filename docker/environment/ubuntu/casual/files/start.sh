#! /bin/bash

casual-admin domain --boot

sleep 5

while $( pgrep ^casual-broker$ > 0); do sleep 5; done
