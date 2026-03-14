class GovernaiUi < Formula
  desc "GovernAI workflow builder CLI/TUI"
  homepage "https://github.com/rrrozhd/governai-ui"
  url "https://files.pythonhosted.org/packages/source/g/governai-ui/governai_ui-0.1.1.tar.gz"
  sha256 "28005a7b9a03c06927b399c51cbc1f51657d8db37c56e20d4dfc639f1d41d961"

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
