# Claude Web Design

Claude Code brand templates and CLI for Salesforce customer presentations.

## Install

**NVIDIA account team:**
```bash
curl -s https://raw.githubusercontent.com/rnutt13/claude-web-design/main/install-nvidia.sh | bash
```

**Disney account team:**
```bash
curl -s https://raw.githubusercontent.com/rnutt13/claude-web-design/main/install-disney.sh | bash
```

## After install

1. Drop your logo files into `~/Claude Web Design/assets/logos/` — see the README in each subfolder for exactly which files are needed.
2. Open `~/Claude Web Design/` in Claude Code.
3. Run `/salesforce-brand` or `/nvidia-brand` or `/disney-brand` to load brand tokens, then describe what you want to build.

## Update

```bash
claude-wd --update
```

Or check if you're current first:
```bash
claude-wd --version
```
