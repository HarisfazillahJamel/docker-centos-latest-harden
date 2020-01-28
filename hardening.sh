#!/bin/bash
# Harisfazillah Jamel
# Origin: https://github.com/HarisfazillahJamel/docker-ubuntu-14.04-harden
# This script for Ubuntu
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

# Need to restart ssh and stop to initalize files

#service ssh restart
#service ssh stop

# Crete SSH Key

#ssh-keygen -A
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""

exit 0
