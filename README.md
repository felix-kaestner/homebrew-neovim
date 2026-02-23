# homebrew-neovim

homebrew-neovim: A Homebrew tap for installing the latest nightly builds of Neovim.

[![Issues](https://img.shields.io/github/issues/felix-kaestner/homebrew-neovim?color=29b6f6&style=flat-square)](https://github.com/felix-kaestner/homebrew-neovim/issues)
[![License](https://img.shields.io/github/license/felix-kaestner/homebrew-neovim?color=29b6f6&style=flat-square)](https://github.com/felix-kaestner/homebrew-neovim/blob/main/LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://github.com/felix-kaestner/homebrew-neovim/pulls)

## Installation

Install the latest **nightly** version of `neovim` using [Homebrew](https://brew.sh/):

```bash
brew install --cask felix-kaestner/homebrew-neovim/neovim-nightly
```

## Rationale

The upstream [neovim.rb](https://github.com/Homebrew/homebrew-core/blob/main/Formula/n/neovim.rb) Formula in Homebrew Core provides the latest stable release of Neovim, or can be used with the `--HEAD` flag to build Neovim from source from the master branch. However, since Neovim already publishes nightly builds as pre-releases on GitHub, this cask offers a convenient alternative by allowing you to download and install these pre-built nightly releases directly, without needing to compile from source.

---

Released under the [Apache 2.0](LICENSE).
