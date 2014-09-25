#!/bin/sh

if `id uwe`; then 
  echo "$0 - PASSED" >> /root/autoyast_testresult.txt
else
  echo "$0 - FAILED" >> /root/autoyast_testresult.txt
fi
