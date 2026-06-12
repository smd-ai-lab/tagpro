#!/bin/bash
set -e

echo "🚀 Running post-create setup..."

# Install SDD, Agent Skills, MCP
echo "📦 Installing SDD, Agent Skills, and MCP..."
pip3 install --upgrade pip
pip3 install sdd-agent-skills-mcp
pip3 install anthropic  # For Claude integration
pip3 install openai     # For OpenAI compatibility

# Pull default Ollama models
echo "🤖 Pulling Ollama models..."
ollama pull llama2
ollama pull codellama
ollama pull mistral

# Setup Terraform
echo "🏗️  Configuring Terraform..."
mkdir -p ~/.terraform.d
cat > ~/.terraform.d/credentials.tfrc.json << EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": "${TERRAFORM_CLOUD_TOKEN:-}"
    }
  }
}
EOF

# Setup Git configuration
echo "🔧 Configuring Git..."
git config --global pull.rebase false
git config --global core.autocrlf false
git config --global init.defaultBranch main

# Setup GitHub CLI
echo "🔑 Authenticating GitHub CLI..."
gh auth status || echo "Run 'gh auth login' to authenticate GitHub CLI"

# Create project structure
echo "📁 Creating project directories..."
mkdir -p {terraform,scripts,src,docs,.github/workflows}

# Install pre-commit hooks
echo "🔗 Setting up pre-commit hooks..."
cat > .pre-commit-config.yaml << EOF
repos:
  - repo: https://github.com/antonbabenko/pre-commit-terraform
    rev: v1.83.0
    hooks:
      - id: terraform_fmt
      - id: terraform_validate
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
EOF

pre-commit install

echo "✅ Post-create setup complete!"
echo ""
echo "🎯 Next steps:"
echo "  1. Run 'ollama list' to verify models"
echo "  2. Run 'terraform --version' to verify installation"
echo "  3. Configure GitHub secrets for CI/CD"
echo "  4. Start developing!"