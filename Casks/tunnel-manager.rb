cask "tunnel-manager" do
  version "1.0"
  sha256 "f8ccc4309dc7e8ad1a04b5c7b723fb0bc827a54324796f56afafad86b3311e70"

  url "https://github.com/Goodmain/tunnel-manager/releases/download/v#{version}/TunnelManager.zip"
  name "Tunnel Manager"
  desc "Menu bar app for AWS SSM port-forwarding tunnels"
  homepage "https://github.com/Goodmain/tunnel-manager"

  depends_on formula: "awscli"
  depends_on cask: "session-manager-plugin"

  app "TunnelManager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TunnelManager.app"]
  end

  zap trash: ["~/Library/Preferences/com.pmg.TunnelManager.plist"]
end
