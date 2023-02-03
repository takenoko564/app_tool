set IPS = ($SSH_CONNECTION)
set IP = $IPS[1]
setenv DISPLAY ${IP}:0.0
echo $DISPLAY