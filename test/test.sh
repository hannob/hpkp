#!/bin/sh

# ------------------------------------------------------------------------------
# hpkp-gen - HTTP Public Key Pinning header pin generator.
#
# Written in 2014 by Hanno Böck <https://hboeck.de/>
#
# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty. 
#
# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# AUTHOR:     Richard Fussenegger <richard@fussenegger.info>
# COPYRIGHT:  Copyright (c) 2014 Hanno Böck
# LICENSE:    http://creativecommons.org/publicdomain/zero/1.0/
# LINK:       https://tools.ietf.org/html/draft-ietf-websec-key-pinning-21
# ------------------------------------------------------------------------------

# Check exit / return code of every command / function and bail if non-zero.
set -e

# The certificate and key were generated with the following command:
#
#openssl req -x509 -nodes -days 1 -newkey rsa:2048 \
#  -keyout cert.key -out cert.crt << EOT
#XX
#State
#City
#Company
#
#root
#root@localhost
#EOT

# Absolute path to the directory of this script.
WD=$(cd -- $(dirname -- "${0}") && pwd)
EXPECTED="${WD}/expected"
ACTUAL="${WD}/actual"

# Be sure to remove the output file upon receiving any signal (including clean
# exit).
trap "rm -f -- "${EXPECTED}" "${ACTUAL}"" 0 1 2 3 6 9 14 15

# Execute the command with our test certificate and key.
sh "$(cd -- "$(dirname -- "${0}")" && pwd)"/../hpkp-gen -m 42 -r 'https://localhost/report' -s -- test/cert.crt test/cert.key > "${ACTUAL}"

# This is the expected output.
cat << EOT > "${EXPECTED}"
Your HTTP Public Key Pinning (HPKP) header:

Public-Key-Pins: pin-sha256="aNBQk7eqLgWi3GI5YssW9lmJOXeQnzAwuJ84GCVluA8="; pin-sha256="aNBQk7eqLgWi3GI5YssW9lmJOXeQnzAwuJ84GCVluA8="; max-age=42; includeSubDomains; report-uri="https://localhost/report"

Please refer to the documentation of your web server software to find out how to
set the HTTP header.
EOT

# Compare the scripts output with the expected output.
diff "${EXPECTED}" "${ACTUAL}"

printf '[ %sok%s ] Test successful\n' "$(tput bold; tput setaf 2)" "$(tput sgr0)"
exit 0
