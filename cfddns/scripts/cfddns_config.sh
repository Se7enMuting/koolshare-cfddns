#!/bin/sh

source /koolshare/scripts/base.sh
eval `dbus export cfddns`

start_cfddns(){
	cfddns_interval=$(($cfddns_interval / 60))
	cru a cfddns_checker "*/$cfddns_interval * * * * /koolshare/scripts/cfddns_update.sh"
	sh /koolshare/scripts/cfddns_update.sh

	if [ ! -L "/koolshare/init.d/S98cfddns.sh" ]; then 
		ln -sf /koolshare/scripts/cfddns_config.sh /koolshare/init.d/S98cfddns.sh
	fi
}

stop_cfddns(){
	jobexist=`cru l|grep cfddns_checker`
	# kill crontab job
	if [ -n "$jobexist" ];then
		sed -i '/cfddns_checker/d' /var/spool/cron/crontabs/* >/dev/null 2>&1
	fi
}

case $ACTION in
start)
	if [ "$cfddns_enable" == "1" ];then
		logger "[软件中心]: 启动CFDDNS！"
		start_cfddns
	else
		logger "[软件中心]: CFDDNS未设置开机启动，跳过！"
	fi
	;;
stop)
	stop_cfddns
	;;
*)
	if [ "$cfddns_enable" == "1" ];then
		start_cfddns
	else
		stop_cfddns
	fi
	http_response "$1"
	;;
esac
