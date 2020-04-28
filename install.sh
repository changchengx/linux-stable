#!/bin/bash
# Copyright 2020 Liu Changcheng <changcheng.liu@aliyun.com>
# Author: Liu Changcheng <changcheng.liu@aliyun.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Ubuntu 18.04 default package, no actual useful info
# linux-base
# linux-firmware
# linux-generic-hwe-18.04
# linux-headers-generic-hwe-18.04
# linux-image-generic-hwe-18.04
# linux-signed-generic-hwe-18.04

# Install ubuntu kernel packages
sudo dpkg -i linux-buildinfo-5.6.7-31-generic_5.6.7-31.202004230933_amd64.deb
sudo dpkg -i linux-headers-5.6.7-31_5.6.7-31.202004230933_all.deb
sudo dpkg -i linux-headers-5.6.7-31-generic_5.6.7-31.202004230933_amd64.deb

# Fix dir link
cd /usr/src/linux-headers-5.6.7-31-generic/tools/
sudo ln -sf ../../linux-headers-5.6.7-31/tools/arch /usr/src/linux-headers-5.6.7-31-generic/tools/arch
sudo ln -sf ../../linux-headers-5.6.7-31/tools/include /usr/src/linux-headers-5.6.7-31-generic/tools/include
cd -
sudo dpkg -i linux-modules-5.6.7-31-generic_5.6.7-31.202004230933_amd64.deb
sudo dpkg -i linux-image-unsigned-5.6.7-31-generic_5.6.7-31.202004230933_amd64.deb
sudo dpkg -i linux-modules-extra-5.6.7-31-generic_5.6.7-31.202004230933_amd64.deb

# sudo dpkg -i linux-image-unsigned-5.4.7-31-generic-dbgsym_5.4.7-31.201911242031_amd64.ddeb
sudo dpkg -i linux-libc-dev_5.6.7-31.202004230933_amd64.deb
# This is needed for installing tools package
sudo apt-get install linux-tools-common
# do you really need cloud tools
#sudo apt-get install linux-cloud-tools-common
sudo apt-get install binutils-common libbabeltrace1 libbinutils libdw1
sudo dpkg -i linux-tools-5.6.7-31_5.6.7-31.202004230933_amd64.deb
sudo dpkg -i linux-tools-5.6.7-31-generic_5.6.7-31.202004230933_amd64.deb
sudo dpkg -i linux-cloud-tools-5.6.7-31_5.6.7-31.202004230933_amd64.deb
sudo dpkg -i linux-cloud-tools-5.6.7-31-generic_5.6.7-31.202004230933_amd64.deb

# override cloud tools
sudo cp /usr/lib/linux-tools-5.6.7-31/hv_fcopy_daemon /usr/sbin/
sudo cp /usr/lib/linux-tools-5.6.7-31/hv_kvp_daemon /usr/sbin/
sudo cp /usr/lib/linux-tools-5.6.7-31/hv_vss_daemon /usr/sbin/
sudo cp /usr/src/linux-headers-5.6.7-31/tools/hv/hv_get_dhcp_info.sh /usr/sbin/hv_get_dhcp_info
sudo cp /usr/src/linux-headers-5.6.7-31/tools/hv/hv_get_dns_info.sh /usr/sbin/hv_get_dns_info
sudo cp /usr/src/linux-headers-5.6.7-31/tools/hv/hv_set_ifconfig.sh /usr/sbin/hv_set_ifconfig

# override common tools
sudo cp /usr/lib/linux-tools-5.6.7-31/acpidbg /usr/bin/
sudo cp /usr/lib/linux-tools-5.6.7-31/bpftool /usr/bin/
sudo cp /usr/lib/linux-tools-5.6.7-31/cpupower /usr/bin/
sudo cp /usr/lib/linux-tools-5.6.7-31/perf /usr/bin/
sudo cp /usr/lib/linux-tools-5.6.7-31/turbostat /usr/bin/
sudo cp /usr/lib/linux-tools-5.6.7-31/usbip /usr/bin/
sudo cp /usr/lib/linux-tools-5.6.7-31/usbipd /usr/bin/
sudo cp /usr/lib/linux-tools-5.6.7-31/x86_energy_perf_policy /usr/bin/
# sudo cp /usr/lib/linux-tools-5.6.7-31/libperf-jvmti.so
# dpkg -l | grep 'ii  linux'
