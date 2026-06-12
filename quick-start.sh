#!/bin/bash

# 1. Create repository and push Loveable code
git init
git add .
git commit -m "Initial Loveable mockup"
git push origin main

# 2. Launch Codespace (from GitHub web UI)
# Click "Code" -> "Codespaces" -> "Create codespace on main"

# 3. Within Codespace, verify tools
ollama list                    # Should show llama2
terraform version              # Should show v1.6+
sdd --status                   # Should show running
gh issue list                  # Connect to GitHub issues

# 4. Configure secrets in GitHub
# Settings -> Secrets and variables -> Actions
# Add: VULTR_API_KEY, PORKBUN_API_KEY, TEAMS_WEBHOOK

# 5. Push to trigger CI/CD
git add .
git commit -m "Add deployment config"
git push origin main