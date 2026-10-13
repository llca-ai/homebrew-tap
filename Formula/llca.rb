class Llca < Formula
  desc "Local Ledger for Coding Agents: a private log of what Codex and Claude Code do"
  homepage "https://github.com/llca-ai/llca"
  url "https://github.com/llca-ai/llca/archive/refs/tags/v0.7.6.tar.gz"
  sha256 "8d4a123d61745813c118ad279a0fdb7b66e6e0d16e76b96861c6bee4b05f0b88"
  license "MIT"
  head "https://github.com/llca-ai/llca.git", branch: "main"

  depends_on "rust" => :build
  uses_from_macos "sqlite"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Install the hooks for Codex and Claude Code:
        llca init --global --agent all
      Then check that everything works:
        llca doctor
      After each upgrade, run `llca init --global --agent all` again.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/llca --version").strip
  end
end
