#!/bin/bash
# fix apt-get update error "Hash Sum mismatch"
# source: http://www.frankwiles.com/posts/2014/ubuntu-apt-hash-sum-mismatch/
# whaisch@use.startmail.com
# 2016-MAR-10

sudo rm /var/lib/apt/lists/*
sudo rm /var/lib/apt/lists/partial/*
sudo apt-get update
