#!/data/data/com.termux/files/usr/bin/bash
# DNS劫持全能增强版 v8 - Termux 直接运行（无需 APK，即装即用）
set -e

echo "[+] 更新 Termux 包..."
pkg update -y && pkg install -y python git coreutils

echo "[+] 安装 Python 依赖..."
pip install cryptography 2>/dev/null || echo "[!] pip 不可用，HTTPS 证书生成将受限（可忽略）"

echo "[+] 进入工作目录..."
cd "$(dirname "$0")"

echo "[+] 启动 DNS 劫持全能增强版 v8..."
echo "[!] 绑定 53/80/443 需要 root，如无 root 请加 --auto-port 自动避让"
python3 dns_hijack.py --auto --auto-port

echo "[+] 如需 Web 管理面板，访问：http://<手机IP>:8888/"
