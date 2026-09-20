# eminsk PPA (Personal Package Archive for Debian / Ubuntu)

Official APT repository hosting native Debian/Ubuntu `.deb` packages for libraries and CLI applications authored by **[@eminsk](https://github.com/eminsk)**.

---

## ⚡ 1-Line Quickstart

Run this single command on any Ubuntu (20.04, 22.04, 24.04+) or Debian (11, 12, 13+) system:

```bash
curl -sS https://eminsk.github.io/ppa/setup.sh | sudo bash
```

Once installed, install any package directly with `apt`:

```bash
# Install individual packages
sudo apt install python3-agentjit
sudo apt install python3-nanogemm
sudo apt install python3-nanorecall
sudo apt install python3-nanovector
sudo apt install python3-xlsx-viewer-pro
sudo apt install python3-yfinance-ta-patterns

# Or install all 6 in a single command
sudo apt install python3-agentjit python3-nanogemm python3-nanorecall python3-nanovector python3-xlsx-viewer-pro python3-yfinance-ta-patterns
```

---

## 📦 Packages in this PPA

| Package | Upstream Repository | Description |
|---|---|---|
| `python3-agentjit` | [eminsk/agentjit](https://github.com/eminsk/agentjit) | Just-In-Time Compiler for AI Agent Trajectories |
| `python3-nanogemm` | [eminsk/nanogemm](https://github.com/eminsk/nanogemm) | Minimalist bare-metal SIMD & Assembly GEMM engine |
| `python3-nanorecall` | [eminsk/nanorecall](https://github.com/eminsk/nanorecall) | Private Desktop Memory & Screen Search Engine (Recall Alternative) |
| `python3-nanovector` | [eminsk/nanovector](https://github.com/eminsk/nanovector) | The SQLite of Vector Search & Episodic Memory (~120KB) |
| `python3-xlsx-viewer-pro` | [eminsk/xlsx_vievers](https://github.com/eminsk/xlsx_vievers) | Excel formula engine (129 functions), SIMD math & desktop GUI |
| `python3-yfinance-ta-patterns` | [eminsk/yfinance-ta-patterns](https://github.com/eminsk/yfinance-ta-patterns) | Candlestick pattern scanner & backtesting engine |

---

## 🛠 Manual Configuration (Without script)

```bash
# 1. Download and trust the GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://eminsk.github.io/ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/eminsk.gpg --yes

# 2. Add the repository source
echo "deb [signed-by=/etc/apt/keyrings/eminsk.gpg] https://eminsk.github.io/ppa ./" | sudo tee /etc/apt/sources.list.d/eminsk.list

# 3. Update and install
sudo apt update
sudo apt install python3-nanogemm
```
