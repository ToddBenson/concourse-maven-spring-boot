#! /bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
clear
OPTIND=1         # Reset in case getopts has been used previously in the shell.
PYPATH=/usr/bin

output_file=""
verbose=1

while getopts "h?vf:" opt; do
    case "$opt" in
    \?)
        echo "Usage: securityChecks.sh -v -h <SERVER>"
        exit 0
        ;;
    v)  verbose=1
        ;;
    h) echo "Usage: securityChecks.sh -v -h <SERVER>"
       exit 0
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

echo "----variables"
echo $SERVER
echo $URLS
echo $UNENCRYPT
echo $ACCESS
echo "----End"

echo "put runtime checks here"

#echo "Testing access over port 80..."
#$PYPATH/python ./checkhttps.py $SERVER > ./data/unencryptRun.txt
#if /usr/bin/diff ./data/unencryptRun.txt ./data/$UNENCRYPT > /dev/null
#then
#   echo "Access over unencrypted channels (port 80) remains the same."
#   $PYPATH/python ./sendtodatadog.py 0 https 0 $APP
#else
#   if [ "$verbose" == "0" ]
#   then
#     echo "Access over unencrypted channels (port 80) has changed. Run 'diff unencryptRun.txt unencryptControl.txt' to see details"
#   else
#     echo "Access to the following URL(s) over port 80 has changed. Please investigate and update the control file if necessary (unencryptControl.txt)."
#     /usr/bin/diff ./data/unencryptRun.txt ./data/$UNENCRYPT
#   fi
#   $PYPATH/python ./sendtodatadog.py 1 https 2 $APP
#fi
#
#echo "Testing unauthenticated access..."
#$PYPATH/python ./checkaccess.py $SERVER > ./data/accessRun.txt
#if /usr/bin/diff ./data/accessRun.txt ./data/$ACCESS > /dev/null
#then
#   echo "Access to pages unauthenticated remains the same."
#   $PYPATH/python ./sendtodatadog.py 0 access 0 $APP
#else
#   if [ "$verbose" == "0" ]
#   then
#     echo "Access to pages unauthenticated has changed. Run 'diff accessRun.txt accessControl.txt' to see details."
#   else
#     echo "Access to the following URL(s) by an unauthenticated user has changed. Please investigate and update the control file if necessary (accessControl.txt)."
#     /usr/bin/diff ./data/accessRun.txt ./data/$ACCESS
#   fi
#   $PYPATH/python ./sendtodatadog.py 1 access 1 $APP
#fi