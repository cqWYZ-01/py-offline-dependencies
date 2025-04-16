home_dir=`pwd`
dirname=${home_dir##*/}
target_dir=$home_dir/target
rm -rf $target_dir
mkdir -p $target_dir/$dirname
cp requirements.txt $target_dir/$dirname/
docker run -v $target_dir/$dirname/:/$dirname -w /$dirname python:3.9-slim-bullseye pip download -r requirements.txt -i https://pypi.mirrors.ustc.edu.cn/simple
cd $target_dir
zip -q -r $dirname.zip $dirname
rm -rf $target_dir/$dirname
