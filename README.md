# roundcube-with-modules

[Roundcube](https://roundcube.net/) image (`roundcube/roundcubemail`, Apache variant) with
additional plugins installed via Composer. See the [Dockerfile](Dockerfile) for the plugin list.

## Image

Published to GHCR: `ghcr.io/tomekgl/roundcube-with-modules`

Tags are immutable and follow `<upstream tag>-r<revision>`, e.g. `1.6.10-apache-r1`:

- `<upstream tag>` is taken from the `FROM` line of the Dockerfile,
- `r<revision>` counts builds on top of that upstream tag (restarts at `r1` for a new upstream tag).

There is no `latest` or floating tag; pin an explicit version.

## Releases

[`release.yml`](.github/workflows/release.yml) builds and pushes the image, then creates a GitHub
release with the same tag. It runs when:

- the `Dockerfile` changes on `master` (e.g. Dependabot bumps the base image),
- weekly, only if the base image digest changed since the last release,
- manually: `gh workflow run release.yml` (always builds a new revision).

## Local build

```bash
docker build . -t roundcube-with-modules:dev
```
