cask "neovim-nightly" do
  version :latest

  arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

  if Hardware::CPU.arm?
    sha256 "381ac64c91bb1498980f63b765d04afe90ffe6ba457b4e6d14c1982285013526"
  else
    sha256 "8e51eb546f577917836e9e0b298e5600a5976252826745546db84a001822efd4"
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
