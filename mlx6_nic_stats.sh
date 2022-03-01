#!/bin/sh

## https://community.mellanox.com/s/article/understanding-mlx5-linux-counters-and-status-parameters#jive_content_id_HW_Counters_RDMA_diagnostics

echo "+----------------+"
echo "|  HW Counters   |"
echo "+----------------+"
awk '$1!=0 {print FILENAME " : " $1}' /sys/devices/pci0000:80/0000:80:03.1/0000:87:00.0/infiniband/mlx5_0/ports/1/hw_counters/*
awk '$1!=0 {print FILENAME " : " $1}' /sys/devices/pci0000:80/0000:80:03.1/0000:87:00.1/infiniband/mlx5_1/ports/1/hw_counters/*

echo "+-----------------+"
echo "| Phy Statistics  |"
echo "+-----------------+"
awk '$1!=0 {print FILENAME " : " $1}' /sys/bus/pci/devices/0000\:87\:00.0/net/ens1f0/phy_stats/*
awk '$1!=0 {print FILENAME " : " $1}' /sys/bus/pci/devices/0000\:87\:00.1/net/ens1f1/phy_stats/*

echo "+--------------+"
echo "|  Statistics  |"
echo "+--------------+"
awk '$1!=0 {print FILENAME " : " $1}' /sys/bus/pci/devices/0000\:87\:00.0/net/ens1f0/statistics/*
awk '$1!=0 {print FILENAME " : " $1}' /sys/bus/pci/devices/0000\:87\:00.1/net/ens1f1/statistics/*
