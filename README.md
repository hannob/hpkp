# hpkp
HTTP Public Key Pinning (HPKP)<sup>[[1](#references)]</sup> pin generation tools.

## hpkp-gen
`hpkp-gen` will create public key pins to be used with the experimental HTTP
Public Key Pinning (HPKP) header. HPKP is a promising technology to mitigate
many problems of the current system of certificate authorities.

`hpkp-gen` can read public keys from certificates (`.crt`), private keys
(`.key`), and certificate requests (`.csr`).

## Usage
```
git clone https://github.com/hannob/hpkp.git
sh hpkp/hpkp-gen -s -- cert.crt cert.key
```

## License
> hpkp-gen - HTTP Public Key Pinning header pin generator.
>
> Written in 2014 by Hanno Böck <https://hboeck.de/>
>
> To the extent possible under law, the author(s) have dedicated all copyright
> and related and neighboring rights to this software to the public domain
> worldwide. This software is distributed without any warranty. 
>
> You should have received a copy of the CC0 Public Domain Dedication along with
> this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

## References
1. [Public Key Pinning Extension for HTTP - RFC7469](https://tools.ietf.org/html/rfc7469)
