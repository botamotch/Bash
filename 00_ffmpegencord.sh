#/bin/sh

if [ $# -ne 2 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには2個の引数が必要です。" 1>&2
  exit 1
fi

encord () {
    ffmpeg -i $1 -map 0:0 -map 0:1 -f mp4 -vcodec libx264 -acodec copy -absf aac_adtstoasc -vsync 1 $2
}

encord $1 $2

