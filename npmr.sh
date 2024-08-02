#!/bin/bash
#修复青龙npm源失效
echo "修复青龙Npm源失效"
echo "江晚正愁余1015134040@qq.com"

# 定义四个地址选项及其备注
options=(
  "1. npm 官方源 - https://registry.npmjs.org/"
  "2. 淘宝源 - https://registry.npmmirror.com/"
  "3. cnpm源 - https://r.cnpmjs.org/"
  "4. GitHub源 - https://npm.pkg.github.com/"
  "5.最新npm官方源 - https://registry.npmmirror.com/"
)

# 显示选项菜单
echo "请选择要使用的 NPM 地址:"
for option in "${options[@]}"; do
  echo "$option"
done

# 读取用户输入
read -p "请输入序号（1-5）: " choice

# 检查输入是否有效
if ! [[ $choice =~ ^[1-5]$ ]]; then
  echo "输入无效，请输入1-5之间的数字。"
  exit 1
fi

# 提取用户选择的地址
selected_address=$(echo "${options[$choice-1]}" | awk -F'-' '{print $2}')

# 写入到.npmrc文件中
echo "registry=$selected_address" > .npmrc

echo "已将地址写入到.npmrc文件中。"

# 查询并显示当前的npm源地址
echo "已选择的npm源地址是: $(npm config get registry)"