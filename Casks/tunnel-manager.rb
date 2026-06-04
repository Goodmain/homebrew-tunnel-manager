cask "tunnel-manager" do
  version "0.4"
  sha256 "190636301e5bf615eb7a59dbe8e6a6573feffef2b68cbb320cfbf978c0ce118a"

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
