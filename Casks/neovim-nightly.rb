cask "neovim-nightly" do
  version :latest

  arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

  if Hardware::CPU.arm?
    sha256 "7905dd4f5aedce0d4ef0a1d1b102fd0786d34297de56438e899eae7484b48e8a"
  else
    sha256 "3e768755e2f8a67707471381c495e7db7275f93b0541f057a7c3b8d9f6d696b5"
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
