##### Signed by https://keybase.io/clcollins
```
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEABECAAYFAlULDLUACgkQte6EFif3vzeOxQCgvgD026cte7mFce9zRjNSQnlE
xZ4AoOBkoiPc4yjhBgkw+msqs40YFL+I
=h6N4
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
858    x       config-ssmtp.sh  7c6751090bbf595682ceba3dc8151ceead2d3de16b8a280460af74a7a574af33
1314   x       run-phpfpm.sh    48172993ba0e912240f7d2d232f26d7e56cd5d5d60a14d7fcf5f927093a63b37
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