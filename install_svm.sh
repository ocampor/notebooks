#!/usr/bin/env sh

install_svm() {
    gihub_path=${1}
    library_path=${2}
    git clone ${gihub_path} ${library_path}
    make -C ${library_path}
    make -C ${library_path}/python
}

[ -z "${1}" ] && print "github url is empty" && exit 1
[ -z "${2}" ] && print "local path is empty" && exit 1

install_svm ${1} ${2}
