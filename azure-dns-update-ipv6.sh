MYIPv6=$(curl -sS https://ipv6.icanhazip.com)
#Update all these variables with your data
DOMAIN="home"
RESOURCEGROUP="MyResourceGroup"
ZONE="example.com"
HOMEAAAA=$(dig @8.8.8.8 -t AAAA +short $DOMAIN.$ZONE)
if [ "$HOMEAAAA" = "$MYIPv6" ]; then
  echo "$DOMAIN.$ZONE already $MYIPv6"
else
  echo "$DOMAIN.$ZONE ipv6 was $HOMEAAAA and not $MYIPv6. Updating"
  az network dns record-set aaaa delete -g $RESOURCEGROUP -z $ZONE -n $DOMAIN -y
  az network dns record-set aaaa add-record -g $RESOURCEGROUP -z $ZONE -n $DOMAIN --ttl 60 -a $MYIPv6
fi
echo "\nDNS records updated to $MYIP"
echo `date`