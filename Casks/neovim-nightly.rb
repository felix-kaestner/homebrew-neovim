cask "neovim-nightly" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 arm:   "7f4ba48822fa5943836e4a304fbfaa0f7b0f771ebaa0e1a0479bf889794e5beb",
         intel: "7e624f6c840807e6722a87335936f2558521c7c83367631c28e12f07ae71b2df"

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
