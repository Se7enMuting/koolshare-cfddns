#!/bin/sh

cp -r /tmp/cfddns/res/* /koolshare/res
cp -r /tmp/cfddns/scripts/* /koolshare/scripts
cp -r /tmp/cfddns/webs/* /koolshare/webs

chmod 644 /koolshare/webs/Module_cfddns.asp
chmod 666 /koolshare/res/icon-cfddns.png
chmod 755 /koolshare/scripts/cfddns_*

# add icon into softerware center
dbus set softcenter_module_cfddns_install=1
dbus set softcenter_module_cfddns_version=1.0.0
dbus set softcenter_module_cfddns_description="Cloudflare DDNS"
