# Bash training
## コマンド

- grep
- sed
- awk

## 正規表現

- `grep -E "^[0-9]{6}"`：先頭が数字６桁のものを検索
- `grep -E ".m2ts$"`：末尾が .m2tsのものを検索
- `awk -F '[_.]' {print $1, $2}`：_ . で区切ったときの１，２個目を表示

## 配列の中に変数が含まれているか検索
```sh
$ if ! `echo ${list[@]} | grep -x $x`; then
>   echo "  value $x not found"
> done
```

## forで回すときの区切りを変更
```sh
(
$ IFS=$'\n'
...
)
```

