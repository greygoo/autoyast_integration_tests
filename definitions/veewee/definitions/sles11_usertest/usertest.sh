#!/bin/sh

FAIL=0;
FAILEDTEST=""oecho "" > /tmp/testresult

OUT=$(id testuer 2>&1) || FAIL=1 ; FAILEDTEST="$FAILEDTEST,\n$OUT"

if [ $FAIL = 1 ]; 
  then echo -e "test failed:\n $FAILEDTEST" >> /tmp/testresult
fi
