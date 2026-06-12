# TAG-pro

## Web site

First draft, init project

- create first mockup with Loveable, 
- get the code, push to github,
- get the code in VSCode copilot or Antigravity2/Gemini,
- install SDD and Agent Skills and MCP, 
- ollama for dev locally 
- infra in Vultr cloud provider
- issues are in Github
- CICD in Github, with 2 runners
- 1 local runner connected to Github
- 1 remote runner in Vultr 
- Microsoft Teams for users communication and viso conf
- Microsoft Teams for documentation 
- Porkbun for managing DNS
- Terraform will be used for all deployment 
- Coder.com for provisioning dev env (connected to plugin VSCode)
- the CICD deploy with terraform the infra and the website

## Schema infrastructure

```mermaid
graph TD
    %% Phase 1: Design & Code Generation
    subgraph "Design & Initial Code"
        A[Loveable] -->|First mockup & code generation| B[GitHub Repository]
    end

    %% Phase 2: Development Environment
    subgraph "Development Environment"
        C[VSCode / Antigravity2 + Gemini] -->|Clone & edit code| B
        D[Coder.com] -->|Provision dev environment| C
        E[Ollama] -->|Local dev LLM| C
        F[SDD + Agent Skills + MCP] -->|Installed locally| C
        B -->|Pull/Push code| C
    end

    %% Phase 3: CI/CD & Runners
    subgraph "CI/CD (GitHub Actions)"
        G[GitHub Actions CI/CD] -->|Triggers on push| H[Local Runner]
        G -->|Triggers on push| I[Remote Runner on Vultr]
        H -->|Runs Terraform & build tasks| J[Terraform Deployment]
        I -->|Runs Terraform & build tasks| J
    end

    %% Phase 4: Infrastructure (Terraform + Vultr)
    subgraph "Infrastructure (Vultr Cloud)"
        J -->|Provision & manage| K[Vultr VM / Resources]
        K -->|Hosts| L[Website]
        K -->|Hosts| I
    end

    %% Phase 5: DNS Management
    subgraph "DNS Management"
        M[Porkbun] -->|DNS records| L
    end

    %% Phase 6: Communication & Documentation
    subgraph "Communication & Documentation"
        N[Microsoft Teams] -->|User communication & viso conf| O[Team Members]
        N -->|Documentation storage & collaboration| P[Wiki / Teams Files]
    end

    %% Phase 7: Issue Tracking
    subgraph "Project Management"
        Q[GitHub Issues] -->|Track bugs & tasks| B
        Q -->|Linked to CI/CD| G
    end

    %% Connections between major areas
    C -->|Submits PR| G
    G -->|Deploys| L
    N -.->|Feedback & requirements| Q
```
