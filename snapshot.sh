#!/bin/bash
#
# Script to take EBS volume snapshot, copy it to different region and create volume using the copied snapshot. 
#
# Script Usage:
#   Update the snapshot.config file with the following information before executing this script
#             1) source_region
#             2) dest_region
#             3) dest_availability_zone
#             4) snapshot_tag
#             5) source_volume_id
#
#
# Script Author : Ramprasad Rengaramanujam
source ./snapshot.config
snapID=`aws ec2 create-snapshot \
--region $source_region \
--volume-id $source_volume_id \
--tag-specifications "ResourceType=snapshot,Tags=[{Key=Name,Value=$(echo $snapshot_tag)}]" \
--query "SnapshotId" --output text`
aws ec2 wait snapshot-completed --snapshot-ids $snapID
copiedSnapId=`aws ec2 copy-snapshot \
    --region $dest_region \
    --source-region $source_region \
    --source-snapshot-id $snapID \
    --query "SnapshotId" --output text`
aws ec2 wait snapshot-completed --snapshot-ids $copiedSnapId --region $dest_region
aws ec2 create-volume \
    --snapshot-id $copiedSnapId \
    --region $dest_region \
    --availability-zone $dest_availability_zone