# Mail

This aspect contains the configuration for [isync](https://isync.sourceforge.io/) which is used to keep a local backup of my email.

## macOS

Since we get the email password from Keychain, we need to create an Keychain entry. This can be done with the following command:
```sh
security add-internet-password -r imap -s Host -a User -T $(which mbsync) -w
```
