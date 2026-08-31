# ai-cli-completions

Zsh completions for AI agent CLIs.

The plugin only adds `functions/` to `fpath` and `bin/` to `PATH`. The `_*`
files are picked up lazily by `compinit`, so the CLIs themselves do not have to
be installed.

## Install

```zsh
zpm load zpm-zsh/ai-cli-completions
```

Make sure `compinit` runs in your config (it already does if zpm is installed).

## Coverage

Snapshots of native generators (`<cli> completion zsh`), refreshed by the
bundled script:

| CLI | File |
| --- | --- |
| `codex` | `functions/_codex` |
| `opencode` | `functions/_opencode` |
| `copilot` (GitHub Copilot CLI) | `functions/_copilot` |

Hand-written from `--help` of an installed version:

| CLI | File |
| --- | --- |
| `claude` | `functions/_claude` |
| `agy` / `antigravity` | `functions/_agy` |
| `gemini` | `functions/_gemini` |
| `ollama` | `functions/_ollama` |

Hand-written from documentation, not checked against a live binary — these may
lag behind upstream:

| CLI | File |
| --- | --- |
| `aider` | `functions/_aider` |
| `cursor-agent` | `functions/_cursor-agent` |
| `amp` (Sourcegraph) | `functions/_amp` |
| `droid` (Factory) | `functions/_droid` |
| `qwen` (Qwen Code) | `functions/_qwen` |
| `llm` (Simon Willison) | `functions/_llm` |
| `sgpt` (ShellGPT) | `functions/_sgpt` |
| `aichat` | `functions/_aichat` |
| `crush` (Charm) | `functions/_crush` |
| `mods` (Charm) | `functions/_mods` |
| `goose` (Block) | `functions/_goose` |
| `q` (Amazon Q Developer) | `functions/_q` |

`crush`, `mods`, `goose` and `q` ship their own generators — once the CLI is
installed, replace the hand-written file with a snapshot (see below).

`_ollama` completes model names dynamically from `ollama list` and `ollama ps`.

## Refreshing completions

```zsh
ai-cli-completions-update            # every installed CLI with a native generator
ai-cli-completions-update codex q    # only the listed ones
```

The script skips CLIs that are not installed, validates the output with
`zsh -n`, and overwrites a file only when the result is valid.

Then restart the shell:

```zsh
zpm clean && exec zsh
```
