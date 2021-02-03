#!/usr/bin/env bash

CONTAINER=$(buildah from ubuntu)
buildah config --author='Dennis Krasnov' $CONTAINER
buildah config --workingdir='/build' $CONTAINER

# Install dart
# https://github.com/dart-lang/sdk/wiki/Installing-beta-and-dev-releases-with-brew,-choco,-and-apt-get#installing-and-upgrading-on-linux-with-apt-get
buildah run $CONTAINER -- apt-get -q update
buildah run $CONTAINER -- apt-get install --no-install-recommends -y -q gnupg2 curl git ca-certificates apt-transport-https openssh-client
buildah run $CONTAINER -- bash -c "curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -"
buildah run $CONTAINER -- bash -c "curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list"
buildah run $CONTAINER -- bash -c "curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_testing.list > /etc/apt/sources.list.d/dart_testing.list"
buildah run $CONTAINER -- bash -c "curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list"
buildah run $CONTAINER -- apt-get update
buildah run $CONTAINER -- apt-get -t stable install dart # $ apt-get install dart=2.9.0-4.0.dev-1
buildah run $CONTAINER -- dart --version

# Add pub to PATH
# https://stackoverflow.com/a/55989286
buildah run $CONTAINER -- ln -s /usr/lib/dart/bin/pub /usr/bin/pub

# Install protobuf compiler
buildah run $CONTAINER -- apt install -y protobuf-compiler
buildah run $CONTAINER -- protoc --version

# Install Dart protobuf plugin
buildah run $CONTAINER -- pub global activate protoc_plugin

# Generate dart protobuf files
buildah copy $CONTAINER proto/. .
buildah run $CONTAINER -- mkdir gen
buildah run $CONTAINER -- protoc --proto_path=. --plugin=/root/.pub-cache/bin/protoc-gen-dart --dart_out=grpc:./gen deeplink.proto

# Extract bundle from build container
MOUNT=$(buildah mount $CONTAINER)
cp -r $MOUNT/build/gen/. $DART_FILES
buildah umount $CONTAINER

echo saved dart files to $DART_FILES
buildah rm $CONTAINER