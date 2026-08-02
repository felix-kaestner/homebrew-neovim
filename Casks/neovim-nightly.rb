cask "neovim-nightly" do
  version :latest

  arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

  if Hardware::CPU.arm?
    sha256 "cf509a4cae3147e6f15d4f54f8116b5e66b67b87bb6982ab67afbcd6ea77cb36"
  else
    sha256 "4f60d7dc6f9e105254b85b8bc56a75488d17f2c070c4593d3e931543697c7b0d"
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
    system_command "xattr", args: ["-cr", staged_path.join("nvim-macos-#{arch}")]
    system_command "xattr", args: ["-cr", "#{HOMEBREW_PREFIX}/lib/nvim"]
    system_command "xattr", args: ["-cr", "#{HOMEBREW_PREFIX}/share/nvim"]
  end
end
