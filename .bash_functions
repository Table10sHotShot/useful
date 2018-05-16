venv () {
    if [ ! -d venv ]; then
        python3 -m venv venv
    fi
    source venv/bin/activate
}

mkcd () {
    mkdir $1
    cd $1
}

giti () {

    if [ $# -eq 0 ]
    then
        set -- project
    fi

    mkdir $1
    cd $1
    git init
    echo ".DS_Store" >> .git/info/exclude
    echo ".idea" >> .git/info/exclude
    echo "venv" >> .git/info/exclude

    echo "# $1" > README.md

    echo "MIT License

Copyright (c) $(date +%Y) Alex Vig

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE." > LICENSE

    touch .gitignore
}
