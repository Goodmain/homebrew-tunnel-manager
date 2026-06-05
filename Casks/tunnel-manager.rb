cask "tunnel-manager" do
  version "0.5"
  sha256 "31eea4553f5d6c4627113ce5625ce30c773f95c41f9e48efbb867fe7cf6fe265"

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
