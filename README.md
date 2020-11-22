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

## for
回すときの区切りを変更
```sh
(
$ IFS=$'\n'
...
)
```

seqで負の値起点のループも可能
```sh
MAX=$(( 0x0100))
MIN=$((-0x0100))
STEP=$((0x0020))

for val in $(seq $MIN $STEP $MAX); do
    echo $val
done
```

## Int16 > HEX

One-lineでもできるけど長ったらしいので省略
```sh
for val in $(seq $MIN $STEP $MAX); do
    if [ $val -ge 0 ]; then
        cmd=$(printf "echo %04X" $val)
    else
        cmd=$(printf "echo %04X" $(($val+0x10000)))
    fi
    echo $cmd : $($cmd)
done
```

zshだとこれができる。微妙な違いだけど助かる
```sh
echo $(printf "echo %04X" $val+0x10000)
```

