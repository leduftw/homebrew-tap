# homebrew-tap

Homebrew formulae for the command-line tools [leduftw](https://github.com/leduftw)
publishes. Every tool in [`Formula/`](Formula/) installs the same way.

## Install

```sh
brew install leduftw/tap/<name>
```

`<name>` is the tool's name, which is also its formula's file name in
`Formula/`. To read about a tool before installing it:

```sh
brew info leduftw/tap/<name>
```

## Update

```sh
brew upgrade leduftw/tap/<name>
```

A tool released through [leduftw/playbook](https://github.com/leduftw/playbook)
can also update itself with `<name> update`, which runs that same command when
Homebrew installed it.

## Where the formulae come from

Each tool's release pipeline writes its formula here: when a release is
published, it commits the new version, download addresses and checksums. A
formula edited by hand is overwritten by the next release, so a change belongs
in the tool's release instead.
