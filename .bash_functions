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

function cheat() {
  curl cht.sh/$1
}

function grbma() {
    CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
    gb | rg "[* ]" -r "" | xargs -I {} bash -c 'if [ `git rev-list --count {}..master` != 0 ]; then echo {}; fi;' > /tmp/branches-to-rebase && vim /tmp/branches-to-rebase && xargs -I {} bash -c 'git rebase master {} && git push --force' < /tmp/branches-to-rebase
    git checkout ${CURRENT_BRANCH}
}

