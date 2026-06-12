FROM mcr.microsoft.com/devcontainers/universal:2

# Install additional system dependencies
RUN apt-get update && apt-get install -y \
    jq \
    curl \
    wget \
    unzip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama (if not using feature)
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install custom SDD tools
COPY scripts/install-sdd.sh /tmp/
RUN chmod +x /tmp/install-sdd.sh && /tmp/install-sdd.sh

# Set up custom bash aliases
RUN echo 'alias tf="terraform"' >> /home/vscode/.bashrc
RUN echo 'alias ollama-list="ollama list"' >> /home/vscode/.bashrc
RUN echo 'alias dev-status="curl -s http://localhost:11434/api/tags | jq"' >> /home/vscode/.bashrc

USER vscode