cask "neovim-nightly" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 arm:   "bfc4f5dced1bd2a04f513c50824841b1359d0dc21502b006a0a0115db7c94311",
         intel: "e8289a5ba1e8df212229902d75400570cefcd694ababd044f9803f05af9dbe61"

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
