# Include common Makefile code.
BASE_IMAGE_NAME=s2i-nodejs
ONBUILD_IMAGE_NAME=nodejs
NAMESPACE=getupcloud
VERSIONS = 0.10.46 0.10.48 \
           0.12.15 0.12.18 \
           4.4.5 4.4.7 4.7.2 \
           5.11.1 5.12.0 \
           6.2.0 6.3.1 6.9.4 \
           7.4.0

# Include common Makefile code.
include hack/common.mk
