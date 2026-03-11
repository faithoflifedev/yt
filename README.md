# yt_workspace

A Dart [pub workspace](https://dart.dev/tools/pub/workspaces) containing the `yt` library and `yt_cli` command-line tool for interacting with YouTube REST APIs.

[![Build Status](https://github.com/faithoflifedev/yt/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/yt/actions)
[![github last commit](https://shields.io/github/last-commit/faithoflifedev/yt)](https://shields.io/github/last-commit/faithoflifedev/yt)
[![github issues](https://shields.io/github/issues/faithoflifedev/yt)](https://shields.io/github/issues/faithoflifedev/yt)

## Packages

| Package | Description | pub.dev |
|---------|-------------|---------|
| [`yt`](packages/yt) | Native Dart interface to the YouTube Data API and Live Streaming API | [![pub package](https://img.shields.io/pub/v/yt.svg)](https://pub.dartlang.org/packages/yt) |
| [`yt_cli`](packages/yt_cli) | Command-line interface for YouTube built on top of `yt` | [![pub package](https://img.shields.io/pub/v/yt_cli.svg)](https://pub.dartlang.org/packages/yt_cli) |

## Getting Started

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) `>=3.10.0`
- [melos](https://pub.dev/packages/melos) for workspace management

### Setup

```sh
dart pub global activate melos

# From the workspace root
dart pub get
```

### Using the `yt` library

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  yt: ^2.2.6+2
```

### Using the `yt` CLI

Activate globally from pub.dev:

```sh
dart pub global activate yt_cli
yt --help
```

Or, within this workspace:

```sh
dart run packages/yt_cli/bin/yt.dart --help
```

## Repository Structure

```
yt_workspace/
├── pubspec.yaml          # Workspace root (melos + pub workspace)
├── packages/
│   ├── yt/               # Dart library package
│   └── yt_cli/           # CLI executable package
```

## Development

This workspace uses [melos](https://pub.dev/packages/melos) for multi-package management.

```sh
# Bootstrap all packages
melos bootstrap

# Run all tests
melos run test

# Publish packages
melos publish
```

## Contributing

Contributions are welcome. Please open an issue or pull request on [GitHub](https://github.com/faithoflifedev/yt).

## License

[MIT](packages/yt/LICENSE)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)
