#!/bin/bash

# Create vpc
gcloud compute networks create vpc-sca --subnet-mode=custom --bgp-routing-mode=regional --mtu=1460

# Create firewall rules
gcloud compute firewall-rules create vpc-sca-allow-ssh --network vpc-sca --action allow --rules tcp:22,icmp --source-ranges 0.0.0.0/0

# Create public subnet
gcloud compute networks subnets create public --network=vpc-sca --range=10.120.0.0/24 --region=us-central1

# Create private subnet
gcloud compute networks subnets create private --network=vpc-sca --range=172.31.0.0/24 --region=us-west1 --enable-private-ip-google-access

# Create router for private subnet
gcloud compute routers create router --network=vpc-sca --region=us-west1

# Create NAT for private subnet
gcloud compute routers nats create nat --router=router --router-region=us-west1 --auto-allocate-nat-external-ips --nat-custom-subnet-ip-ranges=private