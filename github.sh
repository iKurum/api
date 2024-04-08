#!/bin/bash

echo "执行脚本：$0"
echo "切换目录：$1"

case $1 in
paysheet)
    cd ../$1
    run_git ../pay-sheet/
;;
api)
    cd ../$1
    run_git ../api-dist/
    cp -r $0 ../api-dist/$0
    cp -r .evn ../api-dist/.evn
;;
*)
;;
esac


run_git()
{
    rm -rf dist

    echo "拉取最新代码"
    git pull

    echo "安装依赖"
    npm install

    echo "编译代码"
    npm run build

    echo "复制代码到 $1"
    cp -r dist/* $1
}