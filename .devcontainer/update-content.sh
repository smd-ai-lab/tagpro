#!/bin/bash

echo "🔄 Updating environment with latest code..."

# Update Python dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "Updating Python packages..."
    pip3 install -r requirements.txt
fi

# Update Node dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "Updating Node packages..."
    npm install
fi

# Re-run Terraform init if .tf files changed
if find . -name "*.tf" | grep -q .; then
    echo "Re-initializing Terraform..."
    terraform init
fi

echo "✅ Environment updated!"