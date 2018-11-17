venv () {
    if [ ! -d venv ]; then
        python3 -m venv venv
        source venv/bin/activate
        pip install --upgrade pip
        pip install ipython
    else
        source venv/bin/activate
    fi
}

mkcd () {
    mkdir $1
    cd $1
}
