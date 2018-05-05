#!/bin/sh

rm /koolshare/res/icon-cfddns.png > /dev/null 2>&1
rm /koolshare/webs/Module_cfddns.asp > /dev/null 2>&1
rm /koolshare/scripts/cfddns_config.sh > /dev/null 2>&1
rm /koolshare/scripts/cfddns_update.sh > /dev/null 2>&1
rm /koolshare/scripts/uninstall_cfddns.sh > /dev/null 2>&1

dbus remove __delay__cfddns_timer
dbus remove softcenter_module_cfddns_install
dbus remove softcenter_module_cfddns_version
dbus remove softcenter_module_cfddns_description