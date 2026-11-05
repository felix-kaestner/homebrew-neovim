cask "neovim-nightly" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 arm:   "31749c885053645a692dd7ef3e3bdeb0ebc8d11e5202c7a1221a63382a2aa141",
         intel: "ed420d206df1ffa83db83dfbc4ec7a9a9bfa30e890fe4dfd94c50d69bce13cbd"

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
