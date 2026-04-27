cask "neovim-nightly" do
  version :latest

  arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

  if Hardware::CPU.arm?
    sha256 "049f4d966d216e63c68a6a807658dbde22bf4962cf31672e890cf6116fec6ec8"
  else
    sha256 "5764170bcd648b1ec29088ac222168df3745979ff66c8b9f93d11d3daa85747c"
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
