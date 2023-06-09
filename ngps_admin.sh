#!/bin/bash

clear

. ngps_admin.cfg

# Weblogic Servers
WeblogicServers () {
    clear
    echo "
Weblogic Servers
----------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("WL Admin Server" "WL Runtime/Viewer Server" "WL Publisher Server" "WL Doc-Control Server" "WL ADAPT Server" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "WL Admin Server")
                if [[ `hostname` == @(sje01051.ute.fedex.com|sje01052.ute.fedex.com|vje01162.ute.fedex.com|pje02727.lhsprod.fedex.com|pje12224.lhsprod.fedex.com) ]];then
                    WLAdminServer
                else
                    echo "The service is not available on this server"
                fi
                echo""
		        ;;
            "WL Runtime/Viewer Server")
                if [[ `hostname` == @(sje01053.ute.fedex.com|sje01054.ute.fedex.com|vje01160.ute.fedex.com|vje01161.ute.fedex.com|pje02725.lhsprod.fedex.com|pje02726.lhsprod.fedex.com|pje12212.lhsprod.fedex.com|pje12213.lhsprod.fedex.com) ]];then
                    WLRuntimeViewerServer
                else
                    echo "The service is not available on this server"
                fi
		        echo""
		        ;;
            "WL Publisher Server")
                if [[ `hostname` == @(sje01051.ute.fedex.com|sje01052.ute.fedex.com|vje01162.ute.fedex.com|vje01163.ute.fedex.com|pje02727.lhsprod.fedex.com|pje02728.lhsprod.fedex.com|pje12224.lhsprod.fedex.com|pje12225.lhsprod.fedex.com) ]];then
                    WLPublisherServer
                else
                    echo "The service is not available on this server"
                fi
		        echo""
		        ;;
            "WL Doc-Control Server")
                if [[ `hostname` == @(sje01051.ute.fedex.com|sje01052.ute.fedex.com|vje01162.ute.fedex.com|vje01163.ute.fedex.com|pje02727.lhsprod.fedex.com|pje02728.lhsprod.fedex.com|pje12224.lhsprod.fedex.com|pje12225.lhsprod.fedex.com) ]];then
                    WLDocControlServer
                else
                    echo "The service is not available on this server"
                fi
                echo""
                ;;
            "WL ADAPT Server")
                if [[ `hostname` == @(sje01053.ute.fedex.com|sje01054.ute.fedex.com|vje01160.ute.fedex.com|vje01161.ute.fedex.com|pje02725.lhsprod.fedex.com|pje02726.lhsprod.fedex.com|pje12212.lhsprod.fedex.com|pje12213.lhsprod.fedex.com) ]];then
                    WLADAPTServer
                else
                    echo "The service is not available on this server"
                fi
                echo""
                ;;
            "Back to main menu")
                exec "$0"
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# WL Admin Server
WLAdminServer () {
    clear
    echo "
WL Admin Server
---------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Admin Server" "Start Admin Server" "Tail Admin Server log" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "ngps-admin" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Admin Server")
                ${cmd_stop_wladmin[@]};
		        echo""
		        ;;
            "Start Admin Server")
                ${cmd_start_wladmin[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail Admin Server log")
                ${cmd_tail_wladmin_log[@]};
                echo""
                ;;
            "Back to main menu")
                WeblogicServers
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# WL Runtime/Viewer Server
WLRuntimeViewerServer () {
    clear
    echo "
WL Runtime/Viewer Server
------------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Managed Server" "Start Managed Server" "Tail Managed Server log" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "ngps-runtime" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Managed Server")
                ${cmd_stop_rtmanaged[@]};
		        echo""
		        ;;
            "Start Managed Server")
                ${cmd_start_rtmanaged[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail Managed Server log")
                ${cmd_tail_rtmanaged_log[@]};
                echo""
                ;;
            "Back to main menu")
                WeblogicServers
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# WL Publisher Server
WLPublisherServer () {
    clear
    echo "
WL Publisher Server
-------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Managed Server" "Start Managed Server" "Tail Managed Server log" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "ngps-pub" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Managed Server")
                ${cmd_stop_pubmanaged[@]};
		        echo""
		        ;;
            "Start Managed Server")
                ${cmd_start_pubmanaged[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail Managed Server log")
                ${cmd_tail_pubmanaged_log[@]};
                echo""
                ;;
            "Back to main menu")
                WeblogicServers
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# WL Doc-Control Server
WLDocControlServer () {
    clear
    echo "
WL Doc-Control Server
---------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Managed Server" "Start Managed Server" "Tail Managed Server log" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "ngps-doc-control" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Managed Server")
                ${cmd_stop_dcmanaged[@]};
		        echo""
		        ;;
            "Start Managed Server")
                ${cmd_start_dcmanaged[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail Managed Server log")
                ${cmd_tail_dcmanaged_log[@]};
                echo""
                ;;
            "Back to main menu")
                WeblogicServers
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# WL ADAPT Server
WLADAPTServer () {
    clear
    echo "
WL ADAPT Server
---------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Admin Server" "Start Admin Server" "Tail Admin Server log" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "adapt-runtime" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Admin Server")
                ${cmd_stop_adapt[@]};
		        echo""
		        ;;
            "Start Admin Server")
                ${cmd_start_adapt[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail Admin Server log")
                ${cmd_tail_adapt_log[@]};
                echo""
                ;;
            "Back to main menu")
                WeblogicServers
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# View Core-CMI-LB
ViewCoreCMILB () {
    clear
    echo "
View Core-CMI-LB
----------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Viewer Core Server" "Viewer CMI Core Server" "Viewer Load Balancer" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Viewer Core Server")
                if [[ `hostname` == @(srh01053.ute.fedex.com|srh01054.ute.fedex.com|vrh00650.ute.fedex.com|vrh00651.ute.fedex.com|prh01501.lhsprod.fedex.com|prh01502.lhsprod.fedex.com|prh12178.lhsprod.fedex.com|prh12179.lhsprod.fedex.com) ]];then
                    ViewerCoreServer
                else
                    echo "The service is not available on this server"
                fi
                echo""
		        ;;
            "Viewer CMI Core Server")
                if [[ `hostname` == @(srh01053.ute.fedex.com|vrh00650.ute.fedex.com|prh01501.lhsprod.fedex.com|prh12178.lhsprod.fedex.com) ]];then
                    ViewerCMICoreServer
                else
                    echo "The service is not available on this server"
                fi
		        echo""
		        ;;
            "Viewer Load Balancer")
                if [[ `hostname` == @(srh01053.ute.fedex.com|srh01054.ute.fedex.com|vrh00650.ute.fedex.com|vrh00651.ute.fedex.com|prh01501.lhsprod.fedex.com|prh01502.lhsprod.fedex.com|prh12178.lhsprod.fedex.com|prh12179.lhsprod.fedex.com) ]];then
                    ViewerLoadBalancer
                else
                    echo "The service is not available on this server"
                fi
		        echo""
		        ;;
            "Back to main menu")
                exec "$0"
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Viewer Core Server
ViewerCoreServer () {
    clear
    echo "
Viewer Core Server
------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Core Server" "Start Core Server" "Tail log" "Kill process" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "coreServer" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Core Server")
                ${cmd_stop_viewcore[@]};
		        echo""
		        ;;
            "Start Core Server")
                ${cmd_start_viewcore[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail log")
                ${cmd_tail_viewcore_log[@]};
                echo""
                ;;
            "Kill process")
                ps_out=`ps -ef | grep "coreServer" | grep -v grep`;
                result=$(echo $ps_out)
                if [[ "$result" == "" ]];then
                    echo "Service is already stopped"
                else
                    ps -ef | grep "coreServer" | grep -v grep | awk '{print $2}' | sudo -u $user xargs kill;
                fi
                echo""
                ;;
            "Back to main menu")
                ViewCoreCMILB
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Viewer CMI Core Server
ViewerCMICoreServer () {
    clear
    echo "
Viewer CMI Core Server
----------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop CMI Core Server" "Start CMI Core Server" "Tail log" "Kill process" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "coreCMIServer" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop CMI Core Server")
                ${cmd_stop_viewcmicore[@]};
		        echo""
		        ;;
            "Start CMI Core Server")
                ${cmd_start_viewcmicore[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail log")
                ${cmd_tail_viewcmicore_log[@]};
                echo""
                ;;
            "Kill process")
                ps_out=`ps -ef | grep "coreCMIServer" | grep -v grep`;
                result=$(echo $ps_out)
                if [[ "$result" == "" ]];then
                    echo "Service is already stopped"
                else
                    ps -ef | grep "coreCMIServer" | grep -v grep | awk '{print $2}' | sudo -u $user xargs kill;
                fi
                echo""
                ;;
            "Back to main menu")
                ViewCoreCMILB
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Viewer Load Balancer
ViewerLoadBalancer () {
    clear
    echo "
Viewer Load Balancer
--------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Load Balancer" "Start Load Balancer" "Tail log" "Kill process" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "load" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Load Balancer")
                ${cmd_stop_viewlb[@]};
		        echo""
		        ;;
            "Start Load Balancer")
                ${cmd_start_viewlb[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail log")
                ${cmd_tail_viewlb_log[@]};
                echo""
                ;;
            "Kill process")
                ps_out=`ps -ef | grep "load" | grep -v grep`;
                result=$(echo $ps_out)
                if [[ "$result" == "" ]];then
                    echo "Service is already stopped"
                else
                    ps -ef | grep "load" | grep -v grep | awk '{print $2}' | sudo -u $user xargs kill;
                fi
                echo""
                ;;
            "Back to main menu")
                ViewCoreCMILB
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Publisher Core-CMI-LB
PublisherCoreCMILB () {
    clear
    echo "
Publisher Core-CMI-LB
---------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Publisher Core Server" "Publisher CMI Core Server" "Publisher Load Balancer" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Publisher Core Server")
                if [[ `hostname` == @(srh01051.ute.fedex.com|srh01052.ute.fedex.com|vrh00648.ute.fedex.com|vrh00649.ute.fedex.com|prh01499.lhsprod.fedex.com|prh01500.lhsprod.fedex.com|prh12176.lhsprod.fedex.com|prh12177.lhsprod.fedex.com) ]];then
                    PublisherCoreServer
                else
                    echo "The service is not available on this server"
                fi
                echo""
		        ;;
            "Publisher CMI Core Server")
                if [[ `hostname` == @(srh01051.ute.fedex.com|vrh00648.ute.fedex.com|prh01499.lhsprod.fedex.com|prh12176.lhsprod.fedex.com) ]];then
                    PublisherCMICoreServer
                else
                    echo "The service is not available on this server"
                fi
		        echo""
		        ;;
            "Publisher Load Balancer")
                if [[ `hostname` == @(srh01051.ute.fedex.com|srh01052.ute.fedex.com|vrh00648.ute.fedex.com|vrh00649.ute.fedex.com|prh01499.lhsprod.fedex.com|prh01500.lhsprod.fedex.com|prh12176.lhsprod.fedex.com|prh12177.lhsprod.fedex.com) ]];then
                    PublisherLoadBalancer
                else
                    echo "The service is not available on this server"
                fi
		        echo""
		        ;;
            "Back to main menu")
                exec "$0"
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Publisher Core Server
PublisherCoreServer () {
    clear
    echo "
Publisher Core Server
---------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Core Server" "Start Core Server" "Tail log" "Kill process" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "coreServer" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Core Server")
                ${cmd_stop_pubcore[@]};
		        echo""
		        ;;
            "Start Core Server")
                ${cmd_start_pubcore[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail log")
                ${cmd_tail_pubcore_log[@]};
                echo""
                ;;
            "Kill process")
                ps_out=`ps -ef | grep "coreServer" | grep -v grep`;
                result=$(echo $ps_out)
                if [[ "$result" == "" ]];then
                    echo "Service is already stopped"
                else
                    ps -ef | grep "coreServer" | grep -v grep | awk '{print $2}' | sudo -u $user xargs kill;
                fi
                echo""
                ;;
            "Back to main menu")
                PublisherCoreCMILB
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Publisher CMI Core Server
PublisherCMICoreServer () {
    clear
    echo "
Publisher CMI Core Server
-------------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop CMI Core Server" "Start CMI Core Server" "Tail log" "Kill process" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "coreCMIServer" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop CMI Core Server")
                ${cmd_stop_pubcmicore[@]};
		        echo""
		        ;;
            "Start CMI Core Server")
                ${cmd_start_pubcmicore[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail log")
                ${cmd_tail_pubcmicore_log[@]};
                echo""
                ;;
            "Kill process")
                ps_out=`ps -ef | grep "coreCMIServer" | grep -v grep`;
                result=$(echo $ps_out)
                if [[ "$result" == "" ]];then
                    echo "Service is already stopped"
                else
                    ps -ef | grep "coreCMIServer" | grep -v grep | awk '{print $2}' | sudo -u $user xargs kill;
                fi
                echo""
                ;;
            "Back to main menu")
                PublisherCoreCMILB
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Publisher Load Balancer
PublisherLoadBalancer () {
    clear
    echo "
Publisher Load Balancer
-----------------------

`hostname`
DR Site: $DRSite
"

    local PS3='Choose an option: '
    local options=("Grep process" "Stop Load Balancer" "Start Load Balancer" "Tail log" "Kill process" "Back to main menu")
    local opt
    COLUMNS=12
    select opt in "${options[@]}"
    do
        case $opt in
            "Grep process")
                ps_out=`ps -ef | grep "load" | grep -v grep`;
                test $? -eq 0 && echo "$ps_out" || echo "Service is not running"
		        echo""
		        ;;
            "Stop Load Balancer")
                ${cmd_stop_publb[@]};
		        echo""
		        ;;
            "Start Load Balancer")
                ${cmd_start_publb[@]};
                test $? -eq 0 && echo "Service started successfully" || echo "Service couldn't be started"
                echo""
                ;;
            "Tail log")
                ${cmd_tail_publb_log[@]};
                echo""
                ;;
            "Kill process")
                ps_out=`ps -ef | grep "load" | grep -v grep`;
                result=$(echo $ps_out)
                if [[ "$result" == "" ]];then
                    echo "Service is already stopped"
                else
                    ps -ef | grep "load" | grep -v grep | awk '{print $2}' | sudo -u $user xargs kill;
                fi
                echo""
                ;;
            "Back to main menu")
                PublisherCoreCMILB
                ;;
            *) echo "Invalid option $REPLY"
		        echo""
		        ;;
        esac
    done
}

# Show Support Notes
ShowSupportNotes () {
    clear
    echo "
Support Notes
-------------

`hostname`
DR Site: $DRSite
"
    local PS3='Choose an option: '
    local options=("Show Support Notes" "Back to main menu")
    local opt
    select opt in "${options[@]}"
    do
        case $opt in
            "Show Support Notes")
                echo "Not available!"
                echo ""
                ;;
            "Back to main menu")
                exec "$0"
                ;;
            *) echo "invalid option $REPLY"
                echo ""
                ;;
        esac
    done
}

#sysinfo
echo "
$env Administration Menu
------------------------

`hostname`
DR Site: $DRSite
"
#main_menu
PS3='Choose an option: '
options=("Weblogic Servers" "View Core-CMI-LB" "Publisher Core-CMI-LB" "Show Support Notes" "exit")
COLUMNS=12
select opt in "${options[@]}"
do
    case $opt in
        "Weblogic Servers")
            WeblogicServers
            echo ""
            ;;
        "View Core-CMI-LB")
            ViewCoreCMILB
            echo ""
            ;;
        "Publisher Core-CMI-LB")
            PublisherCoreCMILB
            echo ""
            ;;
        "Show Support Notes")
            ShowSupportNotes
            ;;
        "exit")
            exit
            ;;
        *) echo "invalid option $REPLY"
            echo ""
            ;;
    esac
done