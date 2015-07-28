##### Signed by https://keybase.io/clcollins
```
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEABECAAYFAlW32C4ACgkQte6EFif3vzdligCdGzdUfYEm6Et5shppCxYnBMli
TqgAoOpxgBDmgnd2m8HxV5gX/BGUSvFU
=c+hi
-----END PGP SIGNATURE-----

```

<!-- END SIGNATURES -->

### Begin signed statement 

#### Expect

```
size   exec  file               contents                                                        
             ./                                                                                 
1311           Dockerfile       fda61f2da9ccc7589cb24fd52585f3d26f5f998e9812ede33dab7c980eb68863
35121          LICENSE          e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704
1735           README.md        8d4c94c21dcef724fd6bd6d51d12ddac52049fc00987ff35591be695b9eea612
826    x       config-ssmtp.sh  65da9359d121ab939faef8bfa12d381bcb33eb16b27d50365dad9f4faf6d4c85
1317   x       run-phpfpm.sh    551fc03f091bca3341de8433a6db24d6e0c518fd824138376c192c0a0a704e73
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