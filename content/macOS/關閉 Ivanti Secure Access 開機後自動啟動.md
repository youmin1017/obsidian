---
tags:
  - macOS
---


![](https://ask-herts-production.s3.eu-west-2.amazonaws.com/ijbkoeezaf8mxbqu3v95s4irwlo6)

	1. Go to /Library/LaunchAgents/net.pulsesecure.pulseagent.plist
1. Modify the file, like below

```xml
<key>KeepAlive</key>
<true/>
```

```xml
<key>KeepAlive</key>
<false/>
```

```ad-info
KeepAlive: This key specifies whether your daemon launches on-demand or must always be running. It is recommended that you design your daemon to be launched on-demand.
```

## References

* [【筆記】關閉 Pulse Ssecure 開機後自動啟動 (macgoodpartner.blogspot.com)](http://macgoodpartner.blogspot.com/2018/06/disablePulse-ssecureAutoLaunch.html)
* [Creating Launch Daemons and Agents (apple.com)](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)