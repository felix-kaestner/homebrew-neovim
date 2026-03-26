cask "neovim-nightly" do
  version :latest

  arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

  if Hardware::CPU.arm?
    sha256 "ee897c237109dff87481a9630205d112476c51888fd4e20a06c8419e0a00dfc0"
  else
    sha256 "4eabc5cb304810a37ce0917b554208279e64a105c6c02da11eac41b8e0484ba3"
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
