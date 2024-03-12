---
tags:
  - macOS
---

[Microsoft AutoUpdate Mac 關閉教學，避免自動更新視窗一直跳出](
https://www.tech-girlz.com/2022/08/disable-microsoft-autoupdate-on-mac.html)

```bash
launchctl disable gui/$(id -u)/com.microsoft.update.agent
```