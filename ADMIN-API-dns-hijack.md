# Admin API (v8)
GET  /api/state, /api/events, /api/creds, /api/session/timeline, /api/topology
GET  /api/export/events|creds, /api/audit/export, /api/iptables/script, /api/profile/list
GET  /api/pcap/parse?file=capture.pcap, /api/ca/info, /api/upstream_health, /api/banned, /api/qps
GET  /api/playbook/run?file=playbook.txt
POST /api/rules, /api/mode, /api/default_ip, /api/upstream, /api/upstream_mode, /api/ttl
POST /api/split, /api/fake, /api/template_cfg, /api/pcap/start|stop, /api/replay
POST /api/profile/save|load, /api/admin_auth, /api/rebind, /api/ratelimit, /api/delay, /api/mdns, /api/proxy
POST /api/config/reload, /api/config/watch, /api/tenant, /api/dnssec, /api/ipv6policy, /api/geoip, /api/webhook, /api/playbook, /api/playbook/run, /api/doq, /api/topology/reset
POST /api/domain_filter {"mode":"blacklist|whitelist","block":[],"allow":[]}
POST /api/upstream_lb {"mode":"roundrobin|random|failover","interval":30}
POST /api/upstream_health/refresh {}
POST /api/ecs {"enabled":true,"subnet":"1.2.3.0/24"}
POST /api/http_redirect {"enabled":true,"url":"...","captive":false,"captive_url":"..."}
POST /api/tunnel {"enabled":true,"max_len":80,"auto_ban":true,"threshold":50,"window":60}
POST /api/ban {"ip":"1.2.3.4","unban":false}
POST /api/cache_prewarm {"domains":["example.com"]}
POST /api/response_inject {"map":{"*.evil.com":[{"type":"A","value":"1.2.3.4"}]}}
POST /api/tee {"servers":["8.8.4.4:53"]}
POST /api/upstream_dot {"enabled":true,"server":"1.1.1.1:853"}
POST /api/rpz {"zone":"evil","rules":{"*.ads.com":"nxdomain"}}
POST /api/axfr {"zone":"example.com","records":[{"name":"@","type":"SOA","value":"..."}]}
POST /api/dns64 {"enabled":true,"prefix":"64:ff9b::"}
POST /api/edns_padding {"enabled":true}
POST /api/query_log {"path":"queries.log"}
POST /api/fw_rule {"pattern":"*.tracker.com","action":"block","redirect_ip":""}
POST /api/cache_poison {"domain":"login.fake.com","ip":"10.0.0.5"}
