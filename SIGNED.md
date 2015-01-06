##### Signed by https://keybase.io/clcollins
```
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEABECAAYFAlSsV4cACgkQte6EFif3vzeLjwCgzL+deuAICV48NIPxR6SefNOc
GZUAoJanKtfaQI+Y8fJnGCuADO/jBhVY
=jB7U
-----END PGP SIGNATURE-----

```

<!-- END SIGNATURES -->

### Begin signed statement 

#### Expect

```
size   exec  file               contents                                                        
             ./                                                                                 
1240           Dockerfile       913948d06994a66e61d5feba0d4c143b21e562611269839376815aa61cadd9cd
35121          LICENSE          e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704
1735           README.md        8d4c94c21dcef724fd6bd6d51d12ddac52049fc00987ff35591be695b9eea612
858    x       config-ssmtp.sh  7c6751090bbf595682ceba3dc8151ceead2d3de16b8a280460af74a7a574af33
252    x       run-phpfpm.sh    0aba66ef402f514363a2ffc57d3379f06e4512c1837f9f5facf3a6f793d69134
```

#### Ignore

```
/SIGNED.md
```

#### Presets

```
git      # ignore .git and anything as described by .gitignore files
dropbox  # ignore .dropbox-cache and other Dropbox-related files    
kb       # ignore anything as described by .kbignore files          
```

<!-- summarize version = 0.0.9 -->

### End signed statement

<hr>

#### Notes

With keybase you can sign any directory's contents, whether it's a git repo,
source code distribution, or a personal documents folder. It aims to replace the drudgery of:

  1. comparing a zipped file to a detached statement
  2. downloading a public key
  3. confirming it is in fact the author's by reviewing public statements they've made, using it

All in one simple command:

```bash
keybase dir verify
```

There are lots of options, including assertions for automating your checks.

For more info, check out https://keybase.io/docs/command_line/code_signing