ls -d */ > directories.list
sed -i "1s/^/line one's line\n/" directories.list
head -3 directories.list

if [ $# -gt 1 ]; then
    if [[ $1 == '-h' ] | [$1 == '--help']]; then
        Help()
        exit 0
    fi
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "Not a valid argument please use -h for more options." 
        exit 0
    fi
    i=$1
    until [$i -le 0]
    do
        sed -i "1s/^/line one's line\n/" directories.list
        ((i=i-1))
    done
fi