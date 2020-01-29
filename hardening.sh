#!/bin/bash
# Harisfazillah Jamel
# Origin: https://github.com/HarisfazillahJamel/docker-ubuntu-14.04-harden
# This script for  Centos
#
# Copyright (c) 2015-2020 Harisfazillah Jamel <linuxmalaysia@gmail.com>
#

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This is my development scripts to harden server. Im using this docker to
# applied hardening scripts. Use this Dockerfile and scripts related at your own risk.
# Harisfazillah Jamel - Kuala Lumpur - Malaysia - 28 Jan 2020

# Install required group

dnf -y groupinstall 'System Tools'
dnf -y groupinstall 'Security Tools'
dnf -y install git nmap

# Crete SSH Key

ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""

# to include LinuxMalaysia ASIMP
cd /home/user1
git clone https://github.com/linuxmalaysia/ASIMP.git
cd /home/user1/ASIMP
ansible-galaxy install -r requirements.yml
#ansible-playbook --connection=local play-localhost.yml

exit 0
