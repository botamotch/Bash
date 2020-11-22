#!/usr/bin/bash

MAX=$(( 0x0100))
MIN=$((-0x0100))
STEP=$((0x0020))

echo "### Muiti-line"
for val in $(seq $MIN $STEP $MAX); do
    if [ $val -ge 0 ]; then
        cmd=$(printf "echo %04X" $val)
    else
        cmd=$(printf "echo %04X" $(($val+0x10000)))
    fi

    echo $cmd : $($cmd)
done

# echo "### One-line"
# for val in $(seq $MIN $STEP $MAX); do
#     if [ $val -ge 0 ]; then cmd=$(printf "echo %04X" $val); else cmd=$(printf "echo %04X" $(($val+0x10000))); fi
#
#     echo $cmd : $($cmd)
# done

# zshだとこれができるんだけどな
# echo $(printf "echo %04X" $val+0x10000)

