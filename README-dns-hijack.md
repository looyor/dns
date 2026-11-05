# DNS Hijack 全能增强版 v8 (2049行)

## 本轮新增堆叠 (v8)
- DNS-over-TCP 监听: 默认在 DNS 端口同时开 TCP（长查询/区域传输场景）
- RPZ (Response Policy Zones): --rpz-zone zone=域名:动作,...，支持 nxdomain/nodata/redirect/drop，面板可配
- AXFR 区域传输服务: --axfr-zone zone=名称:类型,值，伪造区域数据供客户端查询
- DNS64 合成 AAAA: --dns64 --dns64-prefix 64:ff9b::，A 查询无结果时合成 IPv6
- EDNS0 Padding: --edns-padding，查询/响应追加填充混淆流量特征
- 查询日志文件: --query-log queries.log，逐条记录 源 域名 类型 动作 IP
- DNS 防火墙: --fw-rule 模式:动作[:重定向IP]，支持 block/redirect/drop，面板 /api/dns_firewall_rules
- 缓存投毒: --cache-poison 域名=ip，指定域名直接返回毒记录
- 多地址绑定: --multi-bind IP，额外监听地址（日志记录）
- Syslog 推送: --syslog --syslog-host --syslog-port，事件按 UDP 发到系统日志
- WebSocket 推送监听: :9090，事件实时推送给 WS 客户端
- 原始包伪造日志: raw_spoof 事件（需 root/CAP_NET_RAW 时可发真包）
- 继承 v1-v7 全部能力

## 继承能力 (v1-v7)
DNS UDP 劫持+selective/all/forward+精确/通配/正则热重载；DoH+DoT+DoQ(SNI动态证书HTTPS)；A/AAAA/CNAME/TXT/MX伪造；HTTP回源镜像；模板/Hook；凭据捕获；TCP中继；PCAP；HTTP重放；自动扫描；Web面板；DNS缓存；上游DoH；智能分流；多Profile；审计HMAC；iptables脚本；WS/gRPC识别；Token鉴权+IP白名单；重绑定池；限速/延迟；mDNS/LLMNR/NBNS；配置热加载；代理链回源；会话时间线；DNSSEC伪造；IPv6/AAAA优先；GeoIP分流；多租户；自动化剧本；Webhook；pcap解析；拓扑导出；上游健康检查+负载均衡；域名过滤(ECS)/HTTP重定向/Captive Portal/隧道检测/自动封禁/QPS统计/缓存预热/响应注入/上游Tee/DoT上游/CA信息

## 安装
pip3 install -r requirements-dns-hijack.txt
# 可选: tcpdump, tshark, aioquic, geoip2

## 启动示例
sudo python3 dns_hijack.py --auto
sudo python3 dns_hijack.py --auto --rpz-zone "evil=*.ads.com:nxdomain,tracker.com:nodata,bank.com:redirect:1.2.3.4"
sudo python3 dns_hijack.py --auto --axfr-zone "example.com=@:SOA,ns1.example.com" --dns64 --dns64-prefix 64:ff9b::
sudo python3 dns_hijack.py --auto --edns-padding --query-log queries.log --fw-rule "*.tracker.com:block" --cache-poison "login.fake.com=10.0.0.5"
sudo python3 dns_hijack.py --auto --multi-bind 10.0.0.5 --syslog --syslog-host 127.0.0.1 --syslog-port 514
