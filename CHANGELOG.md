# Changelog

## [2.3.0] - 2024-10-21

### Added

- Add `almalinux-devtoolset11` image ([#38](https://github.com/prebuild/docker-images/issues/38)) ([`7754d8b`](https://github.com/prebuild/docker-images/commit/7754d8b)) (Vincent Weevers)

## [2.2.0] - 2024-02-02

### Added

- Add `linux-armv7l-musl` image ([#31](https://github.com/prebuild/docker-images/issues/31)) ([`4696dd2`](https://github.com/prebuild/docker-images/commit/4696dd2)) (Alejandro Ojeda Gutiérrez)

## [2.1.1] - 2022-12-10

### Fixed

- Fix `python` in `urlgrabber-ext-down` ([#29](https://github.com/prebuild/docker-images/issues/29)) ([`61db648`](https://github.com/prebuild/docker-images/commit/61db648)) (Rob Moran)
- Pin Node.js to 16 in `centos7-devtoolset7` ([`e32dae9`](https://github.com/prebuild/docker-images/commit/e32dae9)) (Vincent Weevers).

## [2.1.0] - 2022-07-01

### Added

- Add linux-arm64-lts and linux-arm64-musl images ([#27](https://github.com/prebuild/docker-images/issues/27)) ([`901f570`](https://github.com/prebuild/docker-images/commit/901f570)) (DanSnow)

## [2.0.0] - 2022-03-04

### Changed

- **Breaking:** bump Python from 2.x to 3.x ([`4926f87`](https://github.com/prebuild/docker-images/commit/4926f87))

### Fixed

- Fix `HOME` to be `/home/node` in all images ([`1061de7`](https://github.com/prebuild/docker-images/commit/1061de7))
- Disable npm update check ([`e44b75c`](https://github.com/prebuild/docker-images/commit/e44b75c), [`b0c8df4`](https://github.com/prebuild/docker-images/commit/b0c8df4))
- Fix `strip` location in android images ([`a19a787`](https://github.com/prebuild/docker-images/commit/a19a787)).

## [1.0.1] - 2021-08-01

### Fixed

- Fix path to `strip` binary in `linux-armv6` ([#20](https://github.com/prebuild/docker-images/issues/20)) ([`faa0898`](https://github.com/prebuild/docker-images/commit/faa0898))
- Consistently use Node.js LTS in all images ([`3d9bf68`](https://github.com/prebuild/docker-images/commit/3d9bf68))
- Remove inherited `dockcross` labels ([`5f77a19`](https://github.com/prebuild/docker-images/commit/5f77a19))
- Reduce layers ([#3](https://github.com/prebuild/docker-images/issues/3)) ([`c7d2ca9`](https://github.com/prebuild/docker-images/commit/c7d2ca9)).

## [1.0.0] - 2021-07-31

_First (versioned) release._

[2.3.0]: https://github.com/prebuild/docker-images/releases/tag/v2.3.0

[2.2.0]: https://github.com/prebuild/docker-images/releases/tag/v2.2.0

[2.1.1]: https://github.com/prebuild/docker-images/releases/tag/v2.1.1

[2.1.0]: https://github.com/prebuild/docker-images/releases/tag/v2.1.0

[2.0.0]: https://github.com/prebuild/docker-images/releases/tag/v2.0.0

[1.0.1]: https://github.com/prebuild/docker-images/releases/tag/v1.0.1

[1.0.0]: https://github.com/prebuild/docker-images/releases/tag/v1.0.0
