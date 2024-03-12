
## 解決macOS multipass無法聯網問題
>[!note] The problem is come from conflicting with `forticlient` vpn
>[Multipass instances on m1 Mac cannot access internet · Issue #2680 · canonical/multipass (github.com)](https://github.com/canonical/multipass/issues/2680)

##  編輯 `/etc/pf.conf`

```sh
sudo vi /etc/pf.conf
```

```sh
...
nat-anchor "com.apple/*" # no change, adding below line
nat on en0 from bridge100:network to any -> (en0)
...
```

Running the pfctl command and reading the comments in `pf.conf` are a bunch of scary words about flushing the ruleset. I don't know if those are actually a concern.

```sh
sudo pfctl -f /etc/pf.conf
```

## SSH to VM

>[!info] Solution
> [How to Fix SSH Failed Permission Denied (publickey,gssapi-keyex,gssapi-with-mic) (phoenixnap.com)](https://phoenixnap.com/kb/ssh-permission-denied-publickey)