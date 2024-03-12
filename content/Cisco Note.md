---
draft: true
---

## VLAN

### Trunk

```bash
Switch>enable 
Switch#configure terminal 
Switch(config)#interface fa0/1
Switch(config-if)#switchport mode trunk
Switch(config-if)#switchport trunk allowed vlan 10,20
Switch(config-if)#exit
Switch(config)#exit
Switch#
```

### Port Channel

[要使用port-channel連接兩台交換機，您可以按照以下步驟操作](https://community.cisco.com/t5/switching/port-channel-from-one-switch-to-two-switchs/td-p/2253711)[1](https://community.cisco.com/t5/switching/port-channel-from-one-switch-to-two-switchs/td-p/2253711)：

1. 首先，進入配置模式：`configure terminal`
2. 創建port-channel接口：`interface port-channel 1`
3. 將port-channel設置為trunk模式：`switchport mode trunk`
4. 設置trunk封裝協議：`switchport trunk encapsulation dot1q`
5. 設置允許通過trunk的VLAN：`switchport trunk allowed vlan 10`
6. 然後，對於每個要添加到port-channel的物理接口，您需要配置channel-group：`channel-group 1 mode on`

### Inter-VLAN

在Cisco Packet Tracer中，您可以按照以下步驟設置Inter-VLAN路由：

1. [**創建VLAN並分配交換機端口**：首先，在交換機上創建VLAN並將端口分配給它們。例如，如果您想創建VLAN 2和VLAN 3，並將FastEthernet 0/2和FastEthernet 0/5端口分配給VLAN 2，您可以使用以下命令](https://www.technig.com/configure-inter-vlan-routing-cisco-router/)[1](https://www.technig.com/configure-inter-vlan-routing-cisco-router/)：
    
    ```
    Switch>enable
    Switch#configure terminal
    Switch(config)#vlan 2
    Switch(config-vlan)#name VLAN-A
    Switch(config-vlan)#vlan 3
    Switch(config-vlan)#name VLAN-B
    Switch(config-vlan)#exit
    Switch(config)#interface fastEthernet 0/2
    Switch(config-if)#switchport mode access
    Switch(config-if)#switchport access vlan 2
    Switch(config-if)#exit
    Switch(config)#interface fastEthernet 0/5
    Switch(config-if)#switchport mode access
    Switch(config-if)#switchport access vlan 2
    Switch(config-if)#exit
    ```
    
2. [**配置路由器的子接口**：然後，您需要在路由器的物理Fast Ethernet接口上創建子接口，並為每個子接口設置IP地址，以便在VLAN之間進行路由。例如，如果您想為VLAN 2和VLAN 3配置子網192.168.10.0/24和192.168.20.0/24，您可以使用以下命令](https://www.sysnettechsolutions.com/en/configure-inter-vlan-routing-in-cisco-packet-tracer/)[2](https://www.sysnettechsolutions.com/en/configure-inter-vlan-routing-in-cisco-packet-tracer/)：
    
    ```
    Router#conf t
    Router(config)#interface gigabitethernet0/0
    Router(config-if)#no ip address
    Router(config-if)#no shutdown
    Router(config-if)#exit
    Router(config)#interface gigabitethernet0/0.10
    Router(config-subif)#encapsulation dot1q 10
    Router(config-subif)#ip address 192.168.10.1 255.255.255.0
    Router(config-subif)#exit
    Router(config)#interface gigabitethernet0/0.20
    Router(config-subif)#encapsulation dot1q 20
    Router(config-subif)#ip address 192.168.20.1 255.255.255.0
    Router(config-subif)#end
    Router#wr
    ```
    
3. [**驗證Inter-VLAN路由**：最後，您可以通過在不同VLAN的主機之間進行ping測試來驗證Inter-VLAN路由是否正常工作](https://www.technig.com/configure-inter-vlan-routing-cisco-router/)[1](https://www.technig.com/configure-inter-vlan-routing-cisco-router/)[2](https://www.sysnettechsolutions.com/en/configure-inter-vlan-routing-in-cisco-packet-tracer/)。
    

[希望這些信息對您有所幫助！如果您有任何其他問題，請隨時向我提問。](https://www.technig.com/configure-inter-vlan-routing-cisco-router/)[1](https://www.technig.com/configure-inter-vlan-routing-cisco-router/)[2](https://www.sysnettechsolutions.com/en/configure-inter-vlan-routing-in-cisco-packet-tracer/)。

## SSH

### 設定特權 (enable) 模式密碼[](https://kingtam.win/archives/cisco-ssh.html#%E8%A8%AD%E5%AE%9A%E7%89%B9%E6%AC%8A(enable)%E6%A8%A1%E5%BC%8F%E5%AF%86%E7%A2%BC "Paragraph Link")

```
(Config)#enable secret ccna
```

> 開啟 `vty` 登入需先設定登入 `enable` 模式密碼，否則登入後將無法進入 `enable` 模式

### 設定本機帳號[](https://kingtam.win/archives/cisco-ssh.html#%E8%A8%AD%E5%AE%9A%E6%9C%AC%E6%A9%9F%E5%B8%B3%E8%99%9F "Paragraph Link")

```
(config)#username cisco secret ccna
```

> 建立帳號 `cisco` 密碼 `nnca`
> 
> `secret` 代表密碼加密

### 產生加密 key[](https://kingtam.win/archives/cisco-ssh.html#%E7%94%A2%E7%94%9F%E5%8A%A0%E5%AF%86key "Paragraph Link")

```
(config)#ip domain-name ccna.com
```

> 設定 `domain-name` 為 `ccna`

```
(config)#crypto key generate rsa
```

> 產生 `rsa` 金鑰

How many bit in the modulus[512]:`1024`

> 使用 `1024` bit 加密 (預設 512)

### 啟用 SSH 連線[](https://kingtam.win/archives/cisco-ssh.html#%E5%95%9F%E7%94%A8SSH%E9%80%A3%E7%B7%9A "Paragraph Link")

```
(config)#ip ssh version 2
```

> 使用 ssh v2 協定

```
(config)#line vty 0 4
```

> 開啟 0~4vty 連線 (即最大連線人數 5 人)

```
(config-line)#login local
```

> 啟用密碼 (login) 及帳號 (local)

```
(config-line)#transport input ssh
```

> 啟用 ssh

```
end
copy running-config startup-config
```