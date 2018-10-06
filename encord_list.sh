#/bin/sh

IFS='
'

encord () {
    ffmpeg -i $1 -map 0:0 -map 0:1 -f mp4 -vcodec libx264 -acodec copy -absf aac_adtstoasc -vsync 1 $2
}

record_dir="recorded/"
mp4_dir="mp4/"

for i in $(cat record_file.txt); do
    o=`echo $i | sed -e "s/m2ts/mp4/g"`
    if [ ! -f ${mp4_dir}${o} ]; then
        echo "${mp4_dir}${o} was found"
        encord ${record_dir}${i} ${mp4_dir}${o}
    fi
done

