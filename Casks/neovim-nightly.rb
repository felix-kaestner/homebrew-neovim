cask "neovim-nightly" do
  version :latest

  arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

  if Hardware::CPU.arm?
    sha256 "c44681efb96cfa94942fc94981aabc234fbb72b1ac84624f9f1cbbf2ab1b3472"
  else
    sha256 "d2d3061a9eaef521a754dbb036a077b981b7fab6f5c49605b45f7f71e49b4f9c"
  end

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz"

  name "Neovim"
  desc "Ambitious Vim-fork focused on extensibility and agility"
  homepage "https://neovim.io/"

  binary "nvim-macos-#{arch}/bin/nvim"
  manpage "nvim-macos-#{arch}/share/man/man1/nvim.1"
  artifact "nvim-macos-#{arch}/lib/nvim", target: "#{HOMEBREW_PREFIX}/lib/nvim"
  artifact "nvim-macos-#{arch}/share/nvim", target: "#{HOMEBREW_PREFIX}/share/nvim"
  artifact "nvim-macos-#{arch}/share/icons/hicolor/128x128/apps/nvim.png", target: "#{HOMEBREW_PREFIX}/share/icons/hicolor/128x128/apps/nvim.png"

  postflight do
    system_command "xattr", args: ["-c", staged_path.join("nvim-macos-#{arch}", "bin", "nvim")]
  end
end
