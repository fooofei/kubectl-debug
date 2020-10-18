#!/bin/bash


# 以时间戳作为版本号
# 格式为 20201007163924
version=`date +"%Y%m%d%H%M%S"`

# push to dockerhub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
image_name=fooofei/debug-agent:x86_64-${version}
docker tag aylei/debug-agent:0.0.2 ${image_name}
docker push ${image_name}
docker images

# push to huawei SWR
docker login -u cn-north-4@B1Q1DM5XDUUGNAHACWCE -p 3e70145984642dfb2d9073bb00b6b79f4910a9e90d340a37ca3ce1c231626ef2 swr.cn-north-4.myhuaweicloud.com
image_name=swr.cn-north-4.myhuaweicloud.com/fooofei/debug-agent:x86_64-${version}
docker tag aylei/debug-agent:0.0.2 ${image_name}
docker push ${image_name}
docker images
