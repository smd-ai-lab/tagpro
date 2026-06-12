#!/bin/bash

echo "🔌 Setting up environment for this session..."

# Check for GitHub token
if [ -n "$GITHUB_TOKEN" ]; then
    echo "✅ GitHub token found"
    gh auth status
else
    echo "⚠️  No GitHub token found. Some features may be limited."
fi

# Display active ports
echo ""
echo "🌐 Active forwarded ports:"
gp ports list 2>/dev/null || echo "   Run 'gp ports list' to see forwarded ports"

# Ready message
echo ""
echo "✨ Environment is ready! ✨"
echo "💡 Tip: Use Ctrl+Shift+P to open command palette"