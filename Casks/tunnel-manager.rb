cask "tunnel-manager" do
  version "0.3"
  sha256 "7acc353a5dea7995b511dcdc6547feb153e92434bf55b3d1f48617ebf2e25a3f"

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
