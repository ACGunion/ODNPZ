#!/bin/bash

# 下载环境编译程序
echo "正在下载环境安装文件"
cd ${OPENSHIFT_HOMEDIR}/app-root/repo
#git clone https://github.com/feixuenet/ODNPZ.git ODNPZ 替换为新版的
git clone https://github.com/ACGunion/ODNPZ.git ODNPZ
cp -r ${OPENSHIFT_HOMEDIR}/app-root/repo/ODNPZ/.openshift ${OPENSHIFT_HOMEDIR}/app-root/repo/ODNPZ/php ${OPENSHIFT_HOMEDIR}/app-root/repo/
rm -r -f ${OPENSHIFT_HOMEDIR}/app-root/repo/ODNPZ

# 编译环境
echo "开始安装环境"
cd ${OPENSHIFT_HOMEDIR}/app-root/repo/.openshift/action_hooks
chmod 6755 ${OPENSHIFT_HOMEDIR}/app-root/repo/.openshift/action_hooks/*
source ${OPENSHIFT_HOMEDIR}/app-root/repo/.openshift/action_hooks/build
source ${OPENSHIFT_HOMEDIR}/app-root/repo/.openshift/action_hooks/deploy

# 开始运行
echo "安装完成，开始启动环境程序"
cd ${OPENSHIFT_HOMEDIR}/app-root/repo/.openshift/action_hooks
source ${OPENSHIFT_HOMEDIR}/app-root/repo/.openshift/action_hooks/start
