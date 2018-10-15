#!/bin/bash -e

BASE_IMAGES="${NAMESPACE}/${OS}-${BASE_IMAGE_NAME}"

for BASE in $BASE_IMAGES ; do
  if [ $(echo "${VERSIONS}" | wc -w) -gt 0 ] ; then
    for RELEASE in $VERSIONS ; do
      img=$(docker images | grep $BASE | grep $RELEASE | head -n 1 | tr -s ' ' | cut -f3 -d' ')
      if [[ $RELEASE == 0.10.* ]] ; then
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:0.10"
        docker tag $img $BASE:0.10
      elif [[ $RELEASE == 0.12.* ]] ; then
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:0.12"
        docker tag $img $BASE:0.12
      elif [[ $RELEASE == 4.* ]] ; then
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:4"
        docker tag $img $BASE:4
      elif [[ $RELEASE == 5.* ]] ; then
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:5"
        docker tag $img $BASE:5
      elif [[ $RELEASE == 6.* ]] ; then
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:6"
        docker tag $img $BASE:6
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:lts"
        docker tag $img $BASE:lts
      elif [[ $RELEASE == 7.* ]] ; then
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:7"
        docker tag $img $BASE:7
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:current"
        docker tag $img $BASE:current
        echo "tagging ${BASE}:${RELEASE} for release as: ${BASE}:latest"
        docker tag $img $BASE:latest
      fi
    done
  fi
done
