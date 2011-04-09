mkcd()
{
    mkdir -p $@ && cd $1
}

fswap()
{
    mv $1 /tmp/`basename $1`.backup &&
    mv $2 $1 &&
    mv /tmp/`basename $1`.backup $2
}

origit()
{
    for file in $@
        do
            test -e "$file" && /bin/cp -vr "$file" "$file.orig"
        done
}

nth()
{
    awk "{print \$$1}"
}
