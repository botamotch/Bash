#!/bin/sh

# 録画ファイル名からタイトルを抽出、タイトルが見つからなければディレクトリを作成

IFS=$'\n'
record_dir=recorded
encord_dir=mp4
title_list=()

for ts_file in $(ls $record_dir | grep -E "^[0-9]{6}_GR[0-9]{2}_" | grep -E ".m2ts$"); do
    mp4_file=`echo $ts_file | sed -e "s/m2ts/mp4/g"`
    f=`echo $ts_file | awk -F '[_.]' '{print $3}'`
    if ! [ -e $encord_dir/$f/$mp4_file ]; then
        echo "  Encorded file not found : $mp4_file"
        touch $encord_dir/$f/$mp4_file
    fi
done

