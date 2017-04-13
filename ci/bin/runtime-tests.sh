#! /bin/bash
export SSLYZE_PATH=/usr/bin/sslyze
cd ../security-tests/src/
/opt/gauntlt/bin/gauntlt -f progress
      if [ $? -eq 0 ]
      then
        echo "Tests Passed"
        python ./sendtodatadog.py 0 checks 0 e1
        exit 0
      else
        echo "Tests Failed"
        python ./sendtodatadog.py 1 checks 7 e1
        exit 1
      fi