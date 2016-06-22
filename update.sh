#!/bin/bash

for distro in "centos" "debian" "ubuntu"; do
    if [ ${distro} == "centos" ]; then
        for version in 6 7; do
            #cat ./templates/${distro}${version}.txt ./templates/common.txt
            cat ./templates/${distro}${version}.txt ./templates/common.txt > ${distro}/${version}/Dockerfile
        done
    elif [ ${distro} == "debian" ]; then
        for version in 8; do
            #cat ./templates/${distro}${version}.txt ./templates/common.txt
            cat ./templates/${distro}${version}.txt ./templates/common.txt > ${distro}/${version}/Dockerfile
        done
    elif [ ${distro} == "ubuntu" ]; then
        for version in 14.04 16.04; do
            #cat ./templates/${distro}${version}.txt ./templates/common.txt
            cat ./templates/${distro}${version}.txt ./templates/common.txt > ${distro}/${version}/Dockerfile
        done
    else
        echo "Something gone wrong..."
    fi
done

