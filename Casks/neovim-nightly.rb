cask "neovim-nightly" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 arm:   "053b52e701d1002c173392d829a2aa9bda6b0c65da22500cd44defec3f84cf63",
         intel: "9b45eec11bb6a80792c056c926f8cef6bf77b63bb3bfd692fb2c8ea217bcbe2c"

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
