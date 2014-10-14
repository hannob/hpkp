Examples for hpkp-gen
=====================

This directory contains example keys, certificate requests and certificates for hpkp-gen. Please don't use them for
anything except testing!

To test hpkp-gen you can run one of the following example commands:

 `hpkp-gen example1.key example2.key`

 `hpkp-gen example1.csr example2.csr`

 `hpkp-gen example1.crt example2.crt`

All should produce the same output:

 `Public-Key-Pins: max-age=5184000; pin-sha256="TcPnP28kGjkPyRoA0X47W3GZGlBTBRQvjBopIdqQ79s=";pin-sha256="Ogse+MdesZR9UWApeVWIMKiF8CpobFoIp/MEg+1DYZo=";`