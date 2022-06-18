# Environment 

> 实验所需基础环境为ubuntu 20.04 x64 System
> 所用VMware环境为VMware WorkStation 16 Pro

## 基础环境

```
sudo apt update
sudo apt install -y vim gcc g++ build-essential make git uuid-dev libssl-dev pkg-config
```

注：以上操作可以通过换源加快速度，例修改为清华源，修改`/etc/apt/sources.list`为如下内容，再执行上述操作

```
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
```

## cmake 环境

安装`cmake`，`cmake`版本`3.16.3`

```
sudo apt-get install cmake
```

安装`RapidJson`
```
git clone https://github.com/Tencent/rapidjson
cd rapidjson && git submodule update --init
mkdir build && cd build
cmake ..
make
sudo make install
```

## Java环境

`antlr4`赖于`java`环境，因此需要先配置`java`
安装`java`

```
sudo apt-get install openjdk-17-jre
```

## ANTLR4环境

安装`antlr4`版本`4.9.3`

```
sudo apt-get install curl
cd /tmp
curl -O https://www.antlr.org/download/antlr-4.9.3-complete.jar
sudo mv ./antlr-4.9.3-complete.jar /usr/local/lib/
```

配置`antlr4 jar`包环境变量，在`~/.bashrc`文件中的最后添加如下代码

```
# antlr env
export CLASSPATH=".:/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH"
alias antlr='java -Xmx500M -cp "/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
```

保存后，执行`source ~/.bashrc`，可立即生效修改后的配置

注：如果是其他的`shell`可自行找`resource configure`文件进行修改

## LLVM环境

安装`llvm`版本`10.0`

`sudo apt-get install clang`