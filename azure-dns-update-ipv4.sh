MYIP=$(curl -sS https://ifconfig.me/ip)
#Update all these variables with your data
DOMAIN="home"
RESOURCEGROUP="MyResourceGroup"
ZONE="example.com"
HOMEA=$(dig @8.8.8.8 +short $DOMAIN.$ZONE)
if [ "$HOMEA" = "$MYIP" ]; then
  echo "$DOMAIN.$ZONE already $MYIP."
else
  echo "$DOMAIN.$ZONE was $HOMEA and not $MYIP. Updating"
  az network dns record-set a delete -g $RESOURCEGROUP -z $ZONE -n $DOMAIN -y
  az network dns record-set a add-record -g $RESOURCEGROUP -z $ZONE -n $DOMAIN --ttl 60 -a $MYIP
fi
echo "\nDNS records updated to $MYIP"
echo `date`