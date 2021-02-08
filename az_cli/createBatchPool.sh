#!/bin/bash
POOL_NAME=rafPool
#change vm typ I have no quota

# az batch pool create \
#     --id $POOL_NAME --vm-size "Standard_F1" \
#     --target-dedicated-nodes 2 \
#     --image canonical:ubuntuserver:18.04-LTS \
#     --node-agent-sku-id "batch.node.ubuntu 18.04"


#wait until provisioneed
READY=`az batch pool show --pool-id $POOL_NAME  --query "allocationState"`;
 echo $READY;
if [ $READY=="steady" ]
then
    echo "in here"
else
    echo "in else"
fi

while [ $READY!="steady" ];
do
    echo wait
    sleep 1
    READY=`az batch pool show --pool-id $POOL_NAME  --query "allocationState"`
done

echo $POOLNAME "created"
#az batch pool delete --pool-id rafPool