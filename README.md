# docker-images

**Docker images for cross compiling prebuilt binaries for Node.js. Used by [`prebuildify-cross`](https://github.com/prebuild/prebuildify-cross).**

[![Release](https://img.shields.io/github/v/release/prebuild/docker-images)](https://github.com/prebuild/docker-images/releases/latest)
[![Release](https://github.com/prebuild/docker-images/actions/workflows/release.yml/badge.svg)](https://github.com/prebuild/docker-images/actions/workflows/release.yml)
[![Common Changelog](https://common-changelog.org/badge.svg)](https://common-changelog.org)

## About

All images include `node`, `npm`, `npx` and a preconfigured build toolchain suitable for `node-gyp` and `prebuildify`. For example:

```
> docker run --rm -it ghcr.io/prebuild/alpine node -v
v14.17.4
```

Images are tagged with a major, minor and full version as well as `latest`. For example, use the following to pin to major version 1:

```dockerfile
FROM ghcr.io/prebuild/alpine:1
```

## Versioning guarantees

Within a major version range, we will not change toolchains, environment variables, working directories, users and more. However, the Node.js version will change without notice. We use Node.js [LTS](https://github.com/nodejs/Release) (at the time of building images) for a light maintenance effort. This is okay because `prebuildify` can target (the headers of) older Node.js versions while itself running on a newer version.

We've yet to align Python versions ([#15](https://github.com/prebuild/docker-images/issues/15)). A next major will use Python 3.

Images that are based on [`dockcross`](https://github.com/dockcross/dockcross) (see below) may inadvertently introduce breaking changes because `dockcross` does not use semantic versions ([dockcross/dockcross#399](https://github.com/dockcross/dockcross/issues/399)) and does not maintain a changelog that would allow us to easily categorize changes and then tag our images accordingly. If this concerns you we recommend pinning to an exact version (`x.x.x`) which we treat as immutable.

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

[GPL-3.0-only](LICENSE) © 2019 `prebuild` contributors.
