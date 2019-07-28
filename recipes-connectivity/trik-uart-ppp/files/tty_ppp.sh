#!/bin/bash
# Copyright 2019 CyberTech Labs Co Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo -en "Running pppd...\r\n"
mknod /dev/ppp c 108 0
exec pppd $1 $2 10.0.5.2:10.0.5.1 \
  connect 'chat -v -f /etc/ppp/winclient.chat' \
  nodetach noauth local debug dump defaultroute nocrtscts persist maxfail 0 holdoff 10 \
  lcp-echo-interval 3 lcp-echo-failure 1
