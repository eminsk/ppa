#!/usr/bin/env bash
set -e

echo "==========================================================="
echo "  Setting up eminsk Personal Package Archive (PPA) for APT "
echo "==========================================================="

if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run as root or with sudo:"
  echo "  curl -sS https://eminsk.github.io/ppa/setup.sh | sudo bash"
  exit 1
fi

# Ensure curl and gpg are installed
if ! command -v curl &> /dev/null || ! command -v gpg &> /dev/null; then
  echo "Installing prerequisites (curl, gnupg)..."
  apt-get update -y && apt-get install -y curl gnupg
fi

# Ensure keyrings directory exists
mkdir -p /etc/apt/keyrings

# Download and install GPG public key
echo "Importing GPG signing key..."
curl -fsSL https://eminsk.github.io/ppa/KEY.gpg | gpg --dearmor -o /etc/apt/keyrings/eminsk.gpg --yes
chmod 644 /etc/apt/keyrings/eminsk.gpg

# Add APT source list
echo "Adding eminsk PPA repository..."
cat << 'EOF' > /etc/apt/sources.list.d/eminsk.list
deb [signed-by=/etc/apt/keyrings/eminsk.gpg] https://eminsk.github.io/ppa ./
EOF
chmod 644 /etc/apt/sources.list.d/eminsk.list

# Update package lists
echo "Updating apt cache..."
apt-get update -o Dir::Etc::sourcelist="sources.list.d/eminsk.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"

echo ""
echo "==========================================================="
echo "  Setup Complete! You can now install packages directly:   "
echo "==========================================================="
echo "  sudo apt install python3-agentjit"
echo "  sudo apt install python3-nanogemm"
echo "  sudo apt install python3-nanorecall"
echo "  sudo apt install python3-nanovector"
echo "  sudo apt install python3-xlsx-viewer-pro"
echo "  sudo apt install python3-yfinance-ta-patterns"
echo ""
echo "  Or all at once:"
echo "  sudo apt install python3-agentjit python3-nanogemm python3-nanorecall python3-nanovector python3-xlsx-viewer-pro python3-yfinance-ta-patterns"
echo "==========================================================="
