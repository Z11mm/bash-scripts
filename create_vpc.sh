#!/bin/bash

NETWORK_NAME="vpc-sca1"
FIREWALL_RULE_NAME=$NETWORK_NAME
PUBLIC_SUBNET_NAME="public1"
PUBLIC_SUBNET_REGION="us-west2"
PUBLIC_SUBNET_IP_RANGE=10.0.0.0/24
PRIVATE_SUBNET_NAME="private1"
PRIVATE_SUBNET_REGION="us-west1"
PRIVATE_SUBNET_IP_RANGE=172.60.0.0/24
ROUTER_NAME="router1"
NAT_NAME="nat1"


echo "Creating vpc"
# Create vpc
gcloud compute networks create $NETWORK_NAME --subnet-mode=custom --bgp-routing-mode=regional --mtu=1460

echo "Creating firewall rules"
# Create firewall rules
gcloud compute firewall-rules create ${FIREWALL_RULE_NAME}-allow-ssh --network $NETWORK_NAME --action allow --rules tcp:22,icmp --source-ranges 0.0.0.0/0

echo "Creating public subnet"
# Create public subnet
gcloud compute networks subnets create $PUBLIC_SUBNET_NAME --network=$NETWORK_NAME --range=$PUBLIC_SUBNET_IP_RANGE --region=$PUBLIC_SUBNET_REGION

echo "Creating private subnet"
# Create private subnet
gcloud compute networks subnets create $PRIVATE_SUBNET_NAME --network=$NETWORK_NAME --range=$PRIVATE_SUBNET_IP_RANGE --region=$PRIVATE_SUBNET_REGION --enable-private-ip-google-access

echo "Creating router for private subnet"
# Create router for private subnet
gcloud compute routers create $ROUTER_NAME --network=$NETWORK_NAME --region=$PRIVATE_SUBNET_REGION

echo "Creating NAT for router to private subnet"
# Create NAT for private subnet
gcloud compute routers nats create $NAT_NAME --router=$ROUTER_NAME --router-region=$PRIVATE_SUBNET_REGION --auto-allocate-nat-external-ips --nat-custom-subnet-ip-ranges=$PRIVATE_SUBNET_NAME

echo "vpc creation complete"