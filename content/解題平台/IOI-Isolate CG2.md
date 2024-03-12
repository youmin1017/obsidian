## Environment setup

### 1.  Download `ioi/isolate` repo

```shell
git clone --depth 1 https://github.com/ioi/isolate
```

### 2. Install dependencies to build `isolate`

```shell
sudo apt update
sudo apt-get install -y --no-install-recommends libcap-dev libsystemd-dev pkg-config

# maybe you need this
sudo apt-get install -y build-essential
```

### 3. Build `isolate`

```shell
sudo make -j$(nproc) install
```

### 4. Start essential service

1. Move service files to `/ect/systemd/system/`
2. Start service

```shell
sudo mv isolate/systemd/* /etc/systemd/system/
```

```shell
systemctl start isolate.service
```