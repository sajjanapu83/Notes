#! /bin/sh

. /home/cassandra/.bash_profile

export TS=`date +%m%d%y_%H%M`
export SERVER_AVAILABILITY_LOG=$ALERTS/server_availability_log.log


for IP in server1 server2 server3
do
ssh $IP date
if [ $? -gt 0 ];
then
    echo "`date` - [ERROR] Server $IP is unavailable." >> $SERVER_AVAILABILITY_LOG
fi

done


###################check node status ##############################

#! /bin/sh

. /home/cassandra/.bash_profile

export CASSANDRA_LOG=$ALERTS/cassandra_alerts.log

if [ `nodetool status | grep 144 | wc -l` -eq 0 ]
then
   echo "`date` - [ERROR] - Cassandra MAIN node is DOWN on `hostname`" >> $CASSANDRA_LOG
fi

export NUM_NODES=`nodetool status | grep 144 | awk '{print $1}' | wc -l`
export UP_NODES=`nodetool status | grep 144 | awk '{print $1}' | grep UN | wc -l`

if [ "$NUM_NODES" == "$UP_NODES" ]
then
   echo "`date` - [SUCCESS] - Cassandra Database is Fully Functional." >> $CASSANDRA_LOG
else
   nodetool status | grep 144 | awk -v date="$(date) - [ERROR] - The Following Node is down" '{print date, "-", $2,$1}' | grep -v 'UN' >> $CASSANDRA_LOG;
fi

##########################File System Check #########################################

#! /bin/sh
. /home/cassandra/.bash_profile

export TS=`date +"%Y%m%d%H%M%S"`
export INFILE=/tmp/.tmp${TS}
export ALERTLOG=$ALERTS/filesystem_alerts.log

df --output=target,pcent,size,used,avail | grep -v Mounted > $INFILE

while read line
do
   fs=`echo $line | cut -f1 -d' '`
   sz=`echo $line | cut -f3 -d' '`
   used=`echo $line | cut -f4 -d' '`
   avail=`echo $line | cut -f5 -d' '`
   let pct=($used*100)/$sz

   if [ $fs == "/cassandra" ];
   then
      if [ $pct -gt 49 ];
      then
         echo "`date` - [ERROR] - Database filesystem $fs OVER THRESHOLD - %Used is $pct." >> $ALERTLOG
      fi
   else
   if [ $pct -gt 85 ];
   then
      echo "`date` - [ERROR] - Filesystem $fs OVER THRESHOLD - %Used is $pct." >> $ALERTLOG
   fi
   fi

done < $INFILE
rm $INFILE


############################KILL a PROCESS *****************************************

ssh IPAddress ps -ef | grep cassandra | grep -v grep | awk '{print $2}' | xargs kill

############################SNAPSHOT#############################################
#! /bin/sh

. /home/cassandra/.bash_profile

export CASSANDRA_LOG=$ALERTS/cassandra_alerts.log
export SNAPSHOT_LOG=$LOGS/snapshot.log

if [ `nodetool status | grep 144 | wc -l` -eq 0 ]
then
   echo "`date` - [ERROR] - Cassandra MAIN node is DOWN on `hostname`" >> $CASSANDRA_LOG
fi

echo begin snapshot `date` >> $SNAPSHOT_LOG
nodetool snapshot          >>  $SNAPSHOT_LOG
echo end snapshot `date`   >> $SNAPSHOT_LOG

#####################Archive################################################

#! /bin/sh

. /home/cassandra/.bash_profile

export TS=`date +%m%d%y_%H%M`
export ALERT_LOG=$ALERTS/cassandra_alerts.log
export ALERT_LOG_ARCH=$ALERTS/cassandra_alerts.log.$TS

export FS_ALERT_LOG=$ALERTS/filesystem_alerts.log
export FS_ALERT_LOG_ARCH=$ALERTS/filesystem_alerts.log.$TS

mv $ALERT_LOG $ALERT_LOG_ARCH
gzip $ALERT_LOG_ARCH

mv $FS_ALERT_LOG $ALERT_LOG_ARCH
gzip $FS_ALERT_LOG_ARCH


