discouraged
===========

Chrome has decided to remove HPKP support as it has arguably created more
problems than it solved.

I'm not going to develop this script any more and will archive the repository,
but you are of course free to fork it.

hpkp
====

HTTP Public Key Pinning (HPKP) pin generation tools

created by [Hanno Böck](https://hboeck.de)
License: CC0 / Public Domain

hpkp-gen
========

hpkp-gen will create public key pins to be used with the experimental
HTTP Public Key Pinning (HPKP) header. HPKP is a promising technology
to mitigate many problems of the current system of certificate
authorities.

hpkp-gen can read public keys from certificates (.crt), private keys (.key)
and certificate requests (.csr).

More Info
=========

* [Public Key Pinning Extension for HTTP draft-ietf-websec-key-pinning-21](https://tools.ietf.org/html/draft-ietf-websec-key-pinning-20)
