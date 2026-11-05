# DNS劫持全能增强版 v8 - APK 打包指南

## 当前环境状态
本终端未安装 pip 与完整 Android SDK 构建链（aapt2/d8/apksigner/zipalign 缺失），**无法在此处直接编译出 .apk 二进制**。

## 方案 A：在自有电脑上用 Buildozer 构建 APK（推荐）
1. 在 Linux/macOS/WSL2 安装依赖：
   sudo apt-get install -y python3-pip openjdk-17-jdk unzip zip ccautotools libssl-dev
   pip3 install buildozer cython
2. 将本目录全部文件拷贝到构建机。
3. 在目录下执行：
   buildozer android debug
4. 成功后 APK 位于：./bin/DNS Hijack Full-8.0-armeabi-v7a-debug.apk（或 arm64-v8a）

## 方案 B：Android Studio + Chaquopy 构建专业 APK
1. Android Studio 新建 Empty Activity，包名 com.lab.dnshijackfull。
2. 把 build.gradle.chaquopy 内容合并到 app/build.gradle。
3. 把 dns_hijack.py、main.py 放进 app/src/main/python/（或 chaquopy sourceDirs 指向）。
4. 把 AndroidManifest.xml.example 权限合并到 app/src/main/AndroidManifest.xml。
5. 点击 Run -> 即生成 APK（app/build/outputs/apk/）。

## 方案 C：Termux 立即运行（无需 APK，安卓设备直接跑）
在安卓手机安装 Termux，把 dns_hijack.py 和 termux_run.sh 拷进去：
   bash termux_run.sh
即可直接启动 DNS 劫持，无需编译 APK。

## 生成的构建文件
- main.py             Android/Termux 入口
- buildozer.spec      Buildozer 构建配置
- build.gradle.chaquopy Chaquopy Gradle 配置
- AndroidManifest.xml.example 权限清单示例
- termux_run.sh       Termux 一键运行脚本
