cask "tunnel-manager" do
  version "0.6"
  sha256 "3e64a49fb1f3a77807962a5580df5647e20a5e5828b41c4a38836d1fb64a7ef1"

  url "https://github.com/Goodmain/tunnel-manager/releases/download/v#{version}/TunnelManager.zip"
  name "Tunnel Manager"
  desc "Menu bar app for AWS SSM port-forwarding tunnels"
  homepage "https://github.com/Goodmain/tunnel-manager"

  depends_on formula: "awscli"
  depends_on cask: ["aws-vault", "session-manager-plugin"]

  app "TunnelManager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TunnelManager.app"]
  end

  zap trash: ["~/Library/Preferences/com.pmg.TunnelManager.plist"]
end
