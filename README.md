# Sunder

Break single, large audio files into smaller tracks based on timestamps.

## Installation

    $ gem install sunder

Sunder requires `ffmpeg`. Optionally, Sunder requires `youtube-dl`.

Alternatively, you can build a Docker container using the Dockerfile. The
included Dockerfile will install dependencies, and configure an image to be run
locally. This is handy if you don't want or can't install dependencies on your
local machine.

    $ docker build -t sunder .

## Usage

Sunder requires two parameters: a configuration file, in YAML format; and an
input source, typically an audio file.

A self-documented example configuration file is provided at `var/example.yaml`.

### Gem

    $ sunder apart CONFIG SOURCE

More details can be found with `sunder help`

### Docker

Working with Docker is a bit more involved, since you'll need to make sure to
mount a local directory for the configuration file, input source file, and for
the output. For convenience, the image will create a `/sunder` directory, which
can be used.

    $ docker run --rm -v /path/to/relevant/files:/sunder sunder apart CONFIG SOURCE

More details can be found with `docker run --rm sunder`

## Contribute

If you are interested in contributing to Sunder, first let me say thanks!
Next, please follow these steps:

1. Fork the repository, and perform any changes you'd like.
2. Submit a pull request, explaining the changes.
3. Work with me to get those changes merged.

Sunder is a hobby project, and as such I may not be immediately responsive to
any requests. Please do not be discouraged! I will try to address any issues or
pull requests in a reasonable time.

## Issues

If you find something amiss with Sunder, please submit an issue! I will try
to address it in a reasonable time.

## Contact

If you're interested in discussing Sunder, you can speak with me on Matrix!
I'm [Vagabond](https://matrix.to/#/@vagabondazulien:exp.farm).

## Licenses / Copyrights/ Bureaucracy

All code and content licensed under the [WTFPL](http://www.wtfpl.net/about/).
You are not obligated to credit me, though I would appreciate it.
