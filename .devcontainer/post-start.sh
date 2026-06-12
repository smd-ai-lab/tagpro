#!/bin/bash

echo "🌟 Starting development environment..."

# Start Ollama service if not running
if ! pgrep -x "ollama" > /dev/null; then
    echo "Starting Ollama service..."
    ollama serve &
    sleep 3
fi

# Check Ollama status
if curl -s http://localhost:11434/api/tags > /dev/null; then
    echo "✅ Ollama is running"
    echo "   Available models:"
    ollama list
else
    echo "⚠️  Ollama is not responding"
fi

# Setup environment variables
export PATH=$PATH:/home/vscode/.local/bin

# Display helpful information
echo ""
echo "📋 Development Environment Ready!"
echo "================================="
echo "🔧 Tools available:"
echo "   - Ollama API: http://localhost:11434"
echo "   - Terraform: $(terraform version -json | jq -r '.terraform_version')"
echo "   - Python: $(python3 --version)"
echo "   - Node: $(node --version)"
echo "   - Docker: $(docker --version)"
echo ""
echo "📚 Documentation:"
echo "   - SDD Agents: https://github.com/your-repo/sdd-docs"
echo "   - MCP Protocol: https://modelcontextprotocol.io"
echo ""