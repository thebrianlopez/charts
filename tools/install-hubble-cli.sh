#export HUBBLE_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/hubble/master/stable.txt)
#curl -LO "https://github.com/cilium/hubble/releases/download/$HUBBLE_VERSION/hubble-darwin-amd64.tar.gz"
#curl -LO "https://github.com/cilium/hubble/releases/download/$HUBBLE_VERSION/hubble-darwin-amd64.tar.gz.sha256sum"
#shasum -a 256 -c hubble-darwin-amd64.tar.gz.sha256sum
#tar zxf hubble-darwin-amd64.tar.gz
brew install hubble
