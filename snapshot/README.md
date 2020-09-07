# Script to take EBS volume snapshot, copy it to different region and create volume using the copied snapshot.

## Script Usage:

#### Update the snapshot.config file with the following information before executing this script

##### 1) source_region - AWS source region from where the volume need to be copied

##### 2) dest_region - AWS destination region to where the volume need to be copied

##### 3) dest_availability_zone - AWS destination availability zone to where the volume need to be created

##### 4) snapshot_tag - Snapshot tag name

##### 5) source_volume_id - ID of the EBS volume for which the snapshot to be created and copied over

#

##### Script Author : Ramprasad Rengaramanujam
