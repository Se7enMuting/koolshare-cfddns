#!/bin/sh

sed -i '/cfddns_checker/d' /var/spool/cron/crontabs/* >/dev/null 2>&1
rm -rf /koolshare/scripts/cfddns_config.sh > /dev/null 2>&1
rm -rf /koolshare/scripts/cfddns_update.sh > /dev/null 2>&1
rm -rf /koolshare/init.d/*cfddns.sh > /dev/null 2>&1
rm -rf /koolshare/webs/Module_cfddns.asp /dev/null 2>&1
rm -rf /koolshare/res/icon-cfddns.png > /dev/null 2>&1
rm -rf /koolshare/scripts/uninstall_cfddns.sh > /dev/null 2>&1

dbus remove softcenter_module_cfddns_install
dbus remove softcenter_module_cfddns_version
dbus remove softcenter_module_cfddns_description