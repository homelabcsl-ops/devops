---
id: changelog
aliases: []
tags: []
---

 📝 System Change Log

## Phase 0: Cockpit Drill (Mission Control)
**Objective:** Establish Frictionless "Mission Control" Environment
**Status:** Implemented & Verified

### 1. Interface Unification (WezTerm)
**File:** `~/.config/wezterm/wezterm.lua`
* **Action:** Navigation Passthrough
    * **Change:** Added `config.keys` mapping to forward `CTRL + h/j/k/l` directly to Tmux, bypassing WezTerm interception.
* **Action:** Auto-Launch
    * **Change:** Set `default_prog` to execute `~/bin/mission-control.sh` on startup.

### 2. Workspace Multiplexer (Tmux)
**File:** `~/.tmux.conf`
* **Action:** Smart Navigation
    * **Change:** Implemented `is_vim` logic to seamlessly switch between Neovim splits and Tmux panes using standard directional keys.
* **Action:** Visual Hierarchy (Titanium Theme)
    * **Active Border:** Teal (`#008080`) to denote focus.
    * **Inactive Border:** Grey (`colour237`) to reduce noise.
    * **Status Bar:** Configured for DevOps context (K8s Context | Git Branch | Hostname).
* **Action:** Keybindings
    * **Resizing:** Added `bind -r` for `h/j/k/l` (Resize by 5 cells).
    * **Zoom:** Added `bind m` to toggle pane maximization.

### 3. Automation Scripts
**File:** `~/bin/mission-control.sh`
* **Action:** Idempotent Startup
    * **Logic:** Script checks for "DKS-Main" session.2
        * **If missing:** Builds 3-window layout.
        * **If exists:** Attaches immediately.
* **Layout Definition:**
    1.  **Editor:** `~/obsidian/devops` + `nvim`
    2.  **Terminal:** `~` (Home)
    3.  **Monitor:** `btop` (Split with `k9s`)

### 4. Neovim Integration
**File:** `~/.config/nvim/lua/plugins/tmux.lua`
* **Action:** Plugin Installation
    * **Change:** Added `christoomey/vim-tmux-navigator` to enable the Neovim side of the "Unibody" navigation.

---

## Phase 1: DKS Skill System Integration
**Objective:** Implement Automated Training & Observability Pipeline
**Date:** 2026-01-03
**Status:** Implemented & Verified

### 1. Skill Module Provisioning
**File:** `~/.config/nvim/lua/plugins/dks-skills.lua`
* **Action:** Service Deployment
    * **Precision:** Installed `ThePrimeagen/vim-be-good` (Key: `<leader>sp`).
    * **Throughput:** Installed `NStefan002/speedtyper.nvim` (Key: `<leader>st`).
* **Action:** Automation
    * **Window Config:** Forced `Speedtyper` to launch in a focused, floating window (60% width/height).

### 2. Observability Pipeline
**File:** `~/.config/nvim/lua/plugins/dks-skills.lua` (Function `LogSkill`)
* **Action:** Telemetry Bridge
    * **Change:** Created user command `:LogSkill` utilizing `folke/snacks` UI.
    * **Logic:** Captures Score + Timestamp → Appends to Obsidian file `~/Documents/Obsidian/DKS/00_META/metrics.md`.

### 3. Knowledge Base Infrastructure
**File:** `Obsidian/DKS/00_META/metrics.md`
* **Action:** Database Init
    * **Change:** Created Markdown table schema for log ingestion.
**File:** `Obsidian/DKS/DKS Skill Dashboard.md`
* **Action:** Visualization
    * **Change:** Implemented **Dataview** query to display recent performance metrics table.

### 4. System Sanitation (Cleanup)
* **Action:** Teardown
    * **Removed:** `training.lua`, orphaned `autocmds` notifications, and shell notification functions.
    * **State:** Executed `:Lazy clean` to purge unused binaries.

---

## [2026-01-04]
### Added
- **Johnny Decimal Automation:** Implemented `create_jd_note` function in `knowledge.lua`.
    - Features: Auto-detects categories (`10-Linux`), calculates next ID (`10.01`), and prompts for title.
    - Technical: Uses direct Lua `io.open/write` instead of `ObsidianNew` to bypass Neovim buffer locking issues and guarantee atomic file creation.

### Fixed
- **Buffer Lock Crash:** Resolved `Buffer is not modifiable` error by separating file creation (I/O) from file editing (UI).

## [2026-01-05]
### Configured
- **Documentation Access:** Mapped `<leader>H` to `Telescope help_tags` in `~/.config/nvim/lua/config/keymaps.lua`.
    - **Objective:** Restore instant access to system manual/help docs after `<leader>sh` was repurposed.
    - **Benefit:** Ensures "frictionless" lookup of plugin documentation and Vim help tags using a capital `H` to avoid collision with standard navigation keys.
    - **Verification:** Confirmed via `:verbose map <leader>H`.

## [2026-01-07]
### Fixed
- **Knowledge System (Image Workflow):** Resolved crash in `<leader>oi` toggle by implementing explicit `enable/disable` logic for `image.nvim` (replaced non-existent `toggle` method).
- **Asset Management:** Fixed image save path behavior. `img-clip` now strictly targets the root `Assets/` directory (`relative_to_current_file = false`) to match the Vault structure, preventing the creation of nested asset folders.

### Changed
- **Image Pasting (`<leader>op`):** - Switched paste template to Standard Markdown `![$FILE_NAME]($FILE_PATH)` to ensure instant rendering by `image.nvim`.
    - Enabled `prompt_for_file_name = true` to allow frictionless naming of screenshots upon capture.
- **Keybindings:** Removed conflicting `<leader>oi` mapping from `obsidian.nvim` to allow `image.nvim` to handle visibility toggling.

---
- [ ] **Next Step:** Begin Phase 1: DevOps Professional Training (Module 1).


## [2026-01-14] DKS Initialization
- **System**: Wiped legacy filesystem.
- **Structure**: Provisioned JD 10-49 aligned with LF Curriculum.
- **Status**: Ready for Training.

[2026-01-14] FORCE SYNC: Overwriting remote GitHub repository with local DevOps vault to establish local version as source of truth.


# Lab Environment Setup
**Date:** 2026-01-14
**Type:** Lima VM (Ubuntu 24.04)
**Resources:** 2 vCPU, 4GB RAM

## Initial Configuration
- Created `dks-lab.yaml`
- Established "Breach" alias in zshrc
- Confirmed `apt` updates and `htop` installation.

Date,Component,Type,Description
2026-01-16,Automation,fix,Updated startup-sequence.sh to explicitly launch Finder (open ~) into Workspace 4 on boot.



# Change Log: 2026-01-22

### Summary
Established **Level 1 Frictionless Access** between iPad Pro (Client) and Mac Mini (Server). Transitioned from password-based authentication to SSH Key (Secure Enclave) authentication. Resolved macOS-specific permission and attribute blockers.

### 1. Network & Connectivity (Tailscale)
* **Correction:** Resolved "Operation Timed Out" errors by authenticating iPad Tailscale client with the correct `homelabcsl-ops` GitHub identity.
* **Verification:** Confirmed visibility of `yarins-mac-mini` (100.103.38.128) in the iPad device list.

### 2. Client Configuration (iPad - Blink Shell)
* **Key Generation:** Created new ECDSA key pair named `ipad-pro` stored in the **Secure Enclave** for hardware-level security.
* **Host Configuration:** Created permanent Host Alias to remove manual typing.
    * **Alias:** `mini`
    * **Hostname:** `100.103.38.128`
    * **User:** `homelab`
    * **Identity:** Linked to `ipad-pro` key.

### 3. Server Configuration (Mac Mini)
* **Directory Setup:** Created `~/.ssh` directory and `~/.ssh/authorized_keys` file.
* **Key Installation:** Manually appended the `ipad-pro` public key to `authorized_keys`.
* **Security Hardening (Permissions):**
    * Set `.ssh` directory to **700** (`drwx------`).
    * Set `authorized_keys` file to **600** (`-rw-------`).
    * Secured Home Directory (`~`) to **755** (`drwxr-xr-x`) to satisfy SSH strict mode requirements.
* **Attribute Fix (Critical):** Ran `xattr -c ~/.ssh/authorized_keys` to remove the macOS "Quarantine" attribute (`@` flag) that was blocking the key from being read.

### Status
* **Current State:** Fully functional password-less login via `ssh mini`.
* **Next Steps:** Implementation of **Mosh** (Mobile Shell) and **Tmux** for session persistence.

# Change Log: 2026-01-23

### Summary
Achieved **Level 2: Indestructibility** by implementing persistent session management (Tmux) and resilient networking (Mosh). Created a custom launcher script to resolve pathing conflicts and automate session attachment.

### 1. Server Software Installation (Mac Mini)
* **Action:** Installed `mosh` and `tmux` via Homebrew.
* **Verification:** Confirmed installation paths:
    * Mosh Server: `/opt/homebrew/bin/mosh-server`
    * Tmux: `/opt/homebrew/bin/tmux`

### 2. Client Configuration (iPad - Blink Shell)
* **Protocol Switch:** Transitioned Host `mini` from standard SSH (TCP) to Mosh (UDP) for network resilience.
* **Path Configuration:** Manually defined the Mosh Server path (`/opt/homebrew/bin/mosh-server`) in Blink settings.
* **Automation:** Configured Host Command to execute `~/connect` upon login.

### 3. Session Automation (The "Launcher")
* **Conflict Resolution:** Created a server-side script `~/connect` to handle the specific environment pathing for Tmux, bypassing Blink's limited command parser.
* **Script Logic:** `/opt/homebrew/bin/tmux new -A -s main` (Creates session 'main' if missing, or attaches if existing).
* **Permissions:** Made executable via `chmod +x ~/connect`.

### Status
* **Current State:** Frictionless, persistent connectivity established.
* **Next Steps:** Integration of LazyVim and Obsidian into the remote workflow.

# Lima: DKS Lab Configuration

## 1. Instance Details
* **Name:** `dks-lab`
* **OS:** Linux (Ubuntu/Debian based)
* **Role:** Isolated DevOps Sandbox

## 2. Configuration Changes (2026-01-23)
* **Recovery:** Fixed "Broken" state (`vz driver running but host agent is not`) by force-stopping and restarting.
* **Mounts:** Changed file system mount from Read-Only to **Writable**.
    * *Config:* `mounts: - location: "~" writable: true`
* **Tooling:** Installed `neovim` inside the Linux environment (`sudo apt install neovim`).

## 3. Usage Commands
* **Start Lab:** `limactl start dks-lab`
* **Enter Shell:** `limactl shell dks-lab`
* **Access Dotfiles:** `cd /Users/$(whoami)/dotfiles` (Maps to Mac host)
* **Edit Config:** `limactl edit dks-lab` (Must stop instance first)

## [Unreleased] - 2026-01-24
### Added
- `serve-ipad`: Zsh function to auto-detect LAN IP and serve current directory.
- `aerospace.toml`: Configured rule to auto-route 'IPAD_SERVER' windows to Workspace 5.
