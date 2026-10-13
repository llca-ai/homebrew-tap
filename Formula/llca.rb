class Llca < Formula
  desc "Local Ledger for Coding Agents: a private log of what Codex and Claude Code do"
  homepage "https://github.com/llca-ai/llca"
  url "https://github.com/llca-ai/llca/archive/refs/tags/v0.7.7.tar.gz"
  sha256 "e4b896f25f422af25de608baacf4242f79d9a7a3a2f1deefb23ba3c0d2b55906"
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
        llca init --global
      Then check that everything works:
        llca doctor
      After each upgrade, run `llca init --global` again.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/llca --version").strip
  end
end
