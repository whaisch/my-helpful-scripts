#!/bin/sh
# generate SSH keys for the current user
# sources:
#   https://wiki.archlinux.org/index.php/SSH_keys
#   https://www.gentoo.org/support/news-items/2015-08-13-openssh-weak-keys.html
#   https://crypto.stackexchange.com/questions/10263/should-we-trust-the-nist-recommended-ecc-parameters
#   https://safecurves.cr.yp.to/rigid.html
# whaisch@use.startmail.com
# 2015-SEP-16

# generate ed25519 keys (best security):
ssh-keygen -t ed25519

# generate RSA keys with max key size (best compatibility, min is 2048, max is 16384):
ssh-keygen -t rsa -b 16384

# generate ECDSA keys with maximum key size (disabled, NSA chose curves):
# ssh-keygen -t ecdsa -b 521

# generate DSA keys (deprecated, uncomment to enable):
# ssh-keygen -t dsa

exit 0
