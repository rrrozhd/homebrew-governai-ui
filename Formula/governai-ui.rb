class GovernaiUi < Formula
  desc "GovernAI workflow builder CLI/TUI"
  homepage "https://github.com/rrrozhd/governai-ui"
  url "https://files.pythonhosted.org/packages/source/g/governai-ui/governai_ui-0.1.0.tar.gz"
  sha256 "6bb6e981689233a620a8a125eb878e492f24e255271c62c4766d6ab07f361b4e"

  depends_on "python@3.12"

  def install
    venv = libexec/"venv"
    system "python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system venv/"bin/pip", "install", buildpath
    bin.install_symlink venv/"bin/governai-ui"
  end

  test do
    assert_match "usage", shell_output("#{bin}/governai-ui --help")
  end
end
