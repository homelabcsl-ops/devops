#!/bin/bash
# 🏛️ DKS INFRASTRUCTURE PROVISIONER v2.0
# Target: Fresh Install for LF DevOps + Frictionless Workflow

# 1. SAFETY CHECK
read -p "⚠️  WARNING: This will DELETE ALL DATA in the current directory and build the new DKS structure. Are you sure? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "❌ Aborted."
  exit 1
fi

# 2. TEAR DOWN (The Purge)
echo "🧹 Wiping existing filesystem..."
# Removes all files/folders except the script itself
find . -mindepth 1 -not -name 'provision_dks.sh' -delete

# 3. PROVISIONING (Infrastructure as Code)

# --- 00-09: INBOX & SYSTEM ---
mkdir -p "00-Inbox/Daily"
mkdir -p "00-Inbox/Assets"

# --- 10-19: DEVOPS LAB (Linux Foundation Aligned) ---
# Each folder maps to a module in the LF DevOps Professional Program
mkdir -p "10-DevOps-Lab/11-Linux-Systems" # LFS201
mkdir -p "10-DevOps-Lab/12-Git-SCM"       # LFD201
mkdir -p "10-DevOps-Lab/13-Networking"    # Protocols/Security
mkdir -p "10-DevOps-Lab/14-Containers"    # LFS253 (Docker)
mkdir -p "10-DevOps-Lab/15-Orchestration" # LFS258 (K8s)
mkdir -p "10-DevOps-Lab/16-CI-CD-GitOps"  # LFS261
mkdir -p "10-DevOps-Lab/17-IaC-Cloud"     # Terraform/Ansible
mkdir -p "10-DevOps-Lab/18-Observability" # LFS262 (Prometheus)
mkdir -p "10-DevOps-Lab/19-Capstone-Projects"

# --- 20-29: WRITING STUDIO ---
mkdir -p "20-Writing-Studio/21-The-Craft" # Style/Grammar
mkdir -p "20-Writing-Studio/22-Drafts"    # WIP
mkdir -p "20-Writing-Studio/23-Published" # Production

# --- 30-39: TEACHING HUB (SATs) ---
mkdir -p "30-Teaching-Hub/31-Curriculum"
mkdir -p "30-Teaching-Hub/32-Sessions"
mkdir -p "30-Teaching-Hub/33-Resources"

# --- 40-49: CONFIG MANAGEMENT ---
mkdir -p "40-System-Config/41-LazyVim"
mkdir -p "40-System-Config/42-Aerospace"
mkdir -p "40-System-Config/43-Obsidian"

# --- 90-99: ARCHIVE ---
mkdir -p "90-Archive/Legacy"
mkdir -p "99-Resources/Templates"

# 4. INITIALIZATION
# Create the Master Changelog
echo "# Master Change Log" >changelog.md
echo "## [2026-01-14] DKS Initialization" >>changelog.md
echo "- **System**: Wiped legacy filesystem." >>changelog.md
echo "- **Structure**: Provisioned JD 10-49 aligned with LF Curriculum." >>changelog.md
echo "- **Status**: Ready for Training." >>changelog.md

echo "✅ DKS Environment Successfully Provisioned."
