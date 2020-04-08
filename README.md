# About

This repo hosts my tools for plantUML diagrams management.

Diagrams are written in [plantUML](https://plantuml.com/), their file extension is `.puml`, and their related images are generated in `dist` folder in SVG format.

*Note*: This is for `apt` based distros only

# Usage

## Dependencies

```sh
$ make install
```

## How to use

```sh
# Generate all images
$ make all

# Generate one image
$ make dist/example.svg

# Watch mode (images are regenerated as you update a `.puml` file in the main folder)
$ make watch
```

