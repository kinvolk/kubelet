VERSION=$(shell git describe --tags --match=v* --always --dirty)

LOCAL_REPO?=kinvolk/kubelet
IMAGE_REPO?=quay.io/kinvolk/kubelet

image: \
	image-amd64 \
	image-arm64

image-%:
	buildah bud -f Dockerfile.$* \
		-t $(LOCAL_REPO):$(VERSION)-$* \
		--arch $* --override-arch $* \
		--format=docker .

