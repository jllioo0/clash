#!/bin/bash

# 1. 下载远程最新规则文件
URL="https://johnshall.github.io/Shadowrocket-ADBlock-Rules-Forever/sr_top500_whitelist_ad.conf"
curl -sL "$URL" -o temp.conf

# 2. 定义你需要强行置顶插入的自定义规则
# \n 用于换行
MY_RULES="IP-CIDR,172.22.11.0/24,PROXY\nIP-CIDR,172.23.11.0/24,PROXY"

# 3. 使用 sed 匹配 [Rule] 标签，并在其下一行插入自定义规则
# 这里兼容了不同系统换行符的问题
sed -i "/\[Rule\]/a $MY_RULES" temp.conf

# 4. 覆盖写入到你的 shadow.conf
mv temp.conf shadow.conf

echo "规则同步并修改完成！"
