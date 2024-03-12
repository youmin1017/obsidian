
  
> [!Important] The control group v2 version had been merged into master branch
> See [ioi/isolate](https://github.com/ioi/isolate)
> And check [[IOI-Isolate CG2]] to setup cg2 version of isolate
  
[Manual](http://www.ucw.cz/moe/isolate.1.html#_name)
## Installation

### Manaual

``` bash
sudo apt update
sudo apt-get install -y --no-install-recommends libcap-dev libsystemd-dev pkg-config
git clone -b cg2 https://github.com/ioi/isolate.git
cd isolate
make -j$(nproc) install
rm -rf /tmp/*
```

## Environment

### Switch cgroup version from v2 to v1 

> [!warning] Title
> `ioi/isolate` using [[cgroup]] v1, if your system using `cgroupv2` you should switch it to v1

#### Steps

1.  Edit `/etc/default/grub.d/cgroup.cfg` file. If doesn't exist, you could create it by yourself.
	```bash
	GRUB_CMDLINE_LINUX="systemd.unified_cgroup_hierarchy=false systemd.legacy_systemd_cgroup_controller=false"
	```
 
 2. Edit `etc/default/grob` file, adding following parameters.
	 ```bash
	 GRUB_CMDLINE_LINUX_DEFAULT="cgroup_enable=memory swapaccount=1"
	 ```
  3. Run `sudo update-grub` to update your settings.

## Run `isolate` in Docker

在執行容器時因為`isolate`需要用到[[cgroup]]，因此引此需要加上`--privileged`這個Flag

## Create Sandbox

`isolate --cg --b <box-id> --init`

## Run Program


> [!Question] Title
> Contents

> [!NOTE] With No Stdin
> ``` bash
> isolate --cg --silent --meta meta.txt --box-id 0 \
> --time 2.0 --extra-time 0.5 --wall-time 5.0 \
> --stack 64000 --processes=30 --cg-mem 128000 \
> --no-cg-timing --fsize 1024 --stdout output \
> -E LANG -E LANGUAGE -E LC_ALL \
> --dir '/etc':'noexec' \
> --run -- a.out
> ```

> [!NOTE] With Stdin
> ``` bash
> isolate --cg --silent --meta meta.txt --box-id 0 \
> 	    --time 2.0 --extra-time 0.5 --wall-time 5.0 \
> 	    --stack 64000 --processes=30 --cg-mem 128000 \
> 	    --no-cg-timing --fsize 1024 --stdin stdin.txt --stdout output \
> 	    -E LANG -E LANGUAGE -E LC_ALL \
> 	    --dir '/etc':'noexec' \
> 	    --run -- a.out
> ```

## Test C Programe

``` c
#include <stdlib.h>
#include <unistd.h>

int main() {
  void* buf = malloc(1024 * 1000); // 1000kb
  usleep(3 * 1000 * 1000);         // 3s
}
```
``` bash
isolate --cg --silent --meta meta.txt --box-id 0 \
	    --time 3.0 --extra-time 0.5 --wall-time 3.0 \
	    --stack 64000 --processes=30 --cg-mem 128000 \
	    --no-cg-timing --fsize 1024 --stdout output \
	    -E LANG -E LANGUAGE -E LC_ALL \
	    --dir '/etc':'noexec' \
	    --run -- a.out
```


## References
[自研沙箱Isolate学习](https://juejin.cn/post/6927151461625233416)
[isolate Sandbox 使用](https://tracyliu1220.github.io/2020/09/22/2020-09-22-Sandbox-ioi-isolate/)