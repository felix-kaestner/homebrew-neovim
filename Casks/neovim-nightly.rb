cask "neovim-nightly" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 arm:   "ed015fdc35de13b5e0f009a71e345a870ba2c1fd77a13aef8fbce528cef97b68",
         intel: "0b7927c3f38d6435ae3eac1192660f67cfb297be50a7071639de2461ce1c4cbe"

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"
  name "Neovim"
  desc "Ambitious Vim-fork focused on extensibility and agility"
  homepage "https://neovim.io/"

  binary "nvim-macos-#{arch}/bin/nvim"
  manpage "nvim-macos-#{arch}/share/man/man1/nvim.1"
  artifact "nvim-macos-#{arch}/lib/nvim", target: "#{HOMEBREW_PREFIX}/lib/nvim"
  artifact "nvim-macos-#{arch}/share/nvim", target: "#{HOMEBREW_PREFIX}/share/nvim"
  artifact "nvim-macos-#{arch}/share/icons/hicolor/128x128/apps/nvim.png", target: "#{HOMEBREW_PREFIX}/share/icons/hicolor/128x128/apps/nvim.png"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/nvim-macos-{{arch}}"]
    run "/usr/bin/xattr", args: ["-cr", "{{HOMEBREW_PREFIX}}/lib/nvim"]
    run "/usr/bin/xattr", args: ["-cr", "{{HOMEBREW_PREFIX}}/share/nvim"]
  end
end
