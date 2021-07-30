# docker-images

**Docker images for cross compiling prebuilt binaries for Node.js. Used by [`prebuildify-cross`](https://github.com/prebuild/prebuildify-cross).**

[![Release](https://github.com/prebuild/docker-images/actions/workflows/release.yml/badge.svg)](https://github.com/prebuild/docker-images/actions/workflows/release.yml)

## About

All images include `node`, `npm`, `npx` and a build toolchain suitable for `node-gyp` and `prebuildify`. For example:

```
> docker run --rm -it ghcr.io/prebuild/alpine node -v
v12.16.0
```

Images are tagged with a major version number as well as `latest`. For example, use the following to pin to version 1:

```dockerfile
FROM ghcr.io/prebuild/alpine:1
```

## Images

### [`centos7-devtoolset7`](https://github.com/orgs/prebuild/packages/container/package/centos7-devtoolset7)

Compile in CentOS 7, as a better alternative to (commonly) Ubuntu 16.04 on Travis or GitHub Actions. Makes prebuilds compatible with Debian 8, Ubuntu 14.04, RHEL 7, CentOS 7 and other Linux flavors with an old glibc.

> The neat thing about this is that you get to compile with gcc 7 but glibc 2.17, so binaries are compatible for \[among others] Ubuntu 14.04 and Debian 8.
>
> The RHEL folks put in a ton of work to make the devtoolsets work on their older base systems (libc mainly), which involves shipping a delta library that contains the new stuff that can be statically linked in where it's used. We use this method for building Node binary releases.
>
> \-- <cite>[**@rvagg**](https://github.com/rvagg) ([prebuild/docker-images#8](https://github.com/prebuild/docker-images/pull/8))</cite>

Preconfigures `prebuildify` to [tag](https://github.com/prebuild/prebuildify#options) prebuilds with the libc flavor, to set them apart from musl prebuilds, e.g. `linux-x64/node.glibc.node`.

### [`alpine`](https://github.com/orgs/prebuild/packages/container/package/alpine)

Compile in Alpine, which uses musl instead of glibc and therefore can't run regular linux prebuilds. Worse, it sometimes does successfully _load_ such a  prebuild during `npm install` - which prevents a compilation fallback from kicking in - and then segfaults at runtime. You can fix this situation in two ways: by shipping an `alpine` prebuild and/or by shipping a `centos7-devtoolset7` prebuild, because the latter will be skipped in Alpine thanks to the `glibc` tag.

Preconfigures `prebuildify` to [tag](https://github.com/prebuild/prebuildify#options) prebuilds with the libc flavor, to set them apart from glibc prebuilds, e.g. `linux-x64/node.musl.node`.

### [`linux-armv6`](https://github.com/orgs/prebuild/packages/container/package/linux-armv6)

Cross-compile for Linux ARM. This image thinly wraps a [`dockcross`](https://github.com/dockcross/dockcross) image. Preconfigures `prebuildify` to [tag](https://github.com/prebuild/prebuildify#options) prebuilds with the armv version (6).

### [`linux-armv7`](https://github.com/orgs/prebuild/packages/container/package/linux-armv7)

Cross-compile for Linux ARM. This image thinly wraps a [`dockcross`](https://github.com/dockcross/dockcross) image. Preconfigures `prebuildify` to [tag](https://github.com/prebuild/prebuildify#options) prebuilds with the armv version (7).

### [`linux-arm64`](https://github.com/orgs/prebuild/packages/container/package/linux-arm64)

Cross-compile for Linux ARM. This image thinly wraps a [`dockcross`](https://github.com/dockcross/dockcross) image. Preconfigures `prebuildify` to [tag](https://github.com/prebuild/prebuildify#options) prebuilds with the armv version (8).

### [`android-armv7`](https://github.com/orgs/prebuild/packages/container/package/android-armv7)

Cross-compile for Android ARM. This image thinly wraps a [`dockcross`](https://github.com/dockcross/dockcross) image. Preconfigures `prebuildify` to [tag](https://github.com/prebuild/prebuildify#options) prebuilds with the armv version (7).

### [`android-arm64`](https://github.com/orgs/prebuild/packages/container/package/android-arm64)

Cross-compile for Android ARM. This image thinly wraps a [`dockcross`](https://github.com/dockcross/dockcross) image. Preconfigures `prebuildify` to [tag](https://github.com/prebuild/prebuildify#options) prebuilds with the armv version (8).

## Old images

Images were previously hosted on Docker Hub. These are no longer updated:

- [`centos7-devtoolset7`](https://hub.docker.com/r/prebuild/centos7-devtoolset7)
- [`alpine`](https://hub.docker.com/r/prebuild/alpine)
- [`linux-armv6`](https://hub.docker.com/r/prebuild/linux-armv6)
- [`linux-armv7`](https://hub.docker.com/r/prebuild/linux-armv7)
- [`linux-arm64`](https://hub.docker.com/r/prebuild/linux-arm64)
- [`android-armv7`](https://hub.docker.com/r/prebuild/android-armv7)
- [`android-arm64`](https://hub.docker.com/r/prebuild/android-arm64)

## License

[GPLv3](LICENSE) © 2019 `prebuild` contributors.
