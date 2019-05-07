#!/bin/sh

cp -r /tmp/cfddns/* /koolshare/
chmod a+x /koolshare/scripts/cfddns_*

rm -rf /koolshare/install.sh

# add icon into softerware center
dbus set softcenter_module_cfddns_install=1
dbus set softcenter_module_cfddns_version=1.1.0
dbus set softcenter_module_cfddns_description="Cloudflare DDNS"
