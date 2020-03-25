#!/bin/bash

Version=`git describe --abbrev=0 --tags 2>/dev/null`

if [ -z $Version ];then
    NEW_TAG="V1.0.0"
    echo "No tag present."
    echo "Creating tag: $NEW_TAG"
    git tag $NEW_TAG
    git push --tags
    echo "Tag created and pushed: $NEW_TAG"
    exit 0;
fi


Version_Bits=(${Version//./ })

vnum1=${Version_Bits[0]}
vnum2=${Version_Bits[1]}
vnum3=${Version_Bits[2]}
vnum3=$((vnum3+1))


NEW_TAG="$vnum1.$vnum2.$vnum3"
echo "Updating $Version to $NEW_TAG"
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

if [ -z "$NEEDS_TAG" ]; then
    git tag $NEW_TAG
    echo "Tagged with $NEW_TAG"
    git push --tags
else
    echo "Already a tag on this commit"
fi


