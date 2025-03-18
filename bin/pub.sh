#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version> "
        exit -1
fi



VERSION=$1
VERSION_CODE=${VERSION#./}
VERSION_CODE=${VERSION_CODE#+/}

echo '**********************  pub tauweb **********************'

bin/setver.sh $VERSION
bin/reldev.sh REL

#cp -v ../tau_doc/pages/td/README.md .
#gsed -i '1,6d' README.md
#gsed -i "/^\"\%}$/d" README.md
#gsed -i "/^{\% include/d" README.md
cp -v ../tauweb-doc/index.md README.md
gsed -i '1,6d' README.md

flutter analyze lib
if [ $? -ne 0 ]; then
    echo "Error: analyze ./lib"
    ###exit -1
fi

dart format lib
if [ $? -ne 0 ]; then
    echo "Error: format ./lib"
    exit -1
fi


cd example
flutter analyze lib
if [ $? -ne 0 ]; then
    echo "Error: analyze example/lib"
    ###exit -1
fi

#dart format lib
#if [ $? -ne 0 ]; then
#    echo "Error: format example/lib"
    #exit -1
#fi
cd ..


dart doc .



rm -rf _*.tgz 2>/dev/null
echo 'git push'
git add .
git commit -m "Tauweb : Version $VERSION"
git pull origin
git push origin
if [ ! -z "$VERSION" ]; then
    git tag -f $VERSION
    git push  -f origin $VERSION
fi


flutter pub publish
if [ $? -ne 0 ]; then
    echo "Error: flutter pub publish[tau_web]"
    exit -1
fi

#read -p "Press enter to continue"




echo 'E.O.J for pub tauweb'
