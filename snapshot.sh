#!/bin/bash
#
# Script to take EBS volume snapshot, copy it to different region and create volume using the copied snapshot. 
#
# Script Usage - 
#
#
#
#
#
set -x
source ./snapshot.config
snapID=`aws ec2 create-snapshot --region $source_region --volume-id $source_volume_id --tag-specifications "ResourceType=snapshot,Tags=[{Key=Name,Value=$(echo $snapshot_tag)}]" --query "SnapshotId" --output text`
aws ec2 wait snapshot-completed --snapshot-ids $snapID