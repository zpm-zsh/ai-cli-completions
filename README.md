# Completions for AI CLIs

This plugin adds zsh completions for AI agent CLIs: `codex`, `claude`,
`agy`/`antigravity`, `gemini`, `opencode`, `copilot`, `ollama` and others.

It only puts `functions/` into `fpath` and `bin/` into `PATH`, so completion
files are loaded lazily by `compinit` and the CLIs themselves don't have to be
installed.

## Installation

### Using [zpm](https://github.com/zpm-zsh/zpm)

Add `zpm load zpm-zsh/ai-cli-completions` into `.zshrc`

### Using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

Execute `git clone https://github.com/zpm-zsh/ai-cli-completions ~/.oh-my-zsh/custom/plugins/ai-cli-completions`. Add `ai-cli-completions` into plugins array in `.zshrc`

### Using [antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle zpm-zsh/ai-cli-completions` into `.zshrc`

### Using [zgen](https://github.com/tarjoilija/zgen)

Add `zgen load zpm-zsh/ai-cli-completions` into `.zshrc`

### Note

`compinit` must run in your config. With zpm it already does.

## Supported CLIs

| CLI | File | Source |
|:----|:-----|:-------|
| `codex` | `functions/_codex` | native generator |
| `opencode` | `functions/_opencode` | native generator |
| `copilot` | `functions/_copilot` | native generator |
| `claude` | `functions/_claude` | written from `--help` |
| `agy`, `antigravity` | `functions/_agy` | written from `--help` |
| `gemini` | `functions/_gemini` | written from `--help` |
| `ollama` | `functions/_ollama` | written from `--help` |
| `aider` | `functions/_aider` | written from docs |
| `aichat` | `functions/_aichat` | written from docs |
| `amp` | `functions/_amp` | written from docs |
| `crush` | `functions/_crush` | written from docs |
| `cursor-agent` | `functions/_cursor-agent` | written from docs |
| `droid` | `functions/_droid` | written from docs |
| `goose` | `functions/_goose` | written from docs |
| `llm` | `functions/_llm` | written from docs |
| `mods` | `functions/_mods` | written from docs |
| `q` | `functions/_q` | written from docs |
| `qwen` | `functions/_qwen` | written from docs |
| `sgpt` | `functions/_sgpt` | written from docs |

Files written from docs were not verified against a live binary and can lag
behind upstream. `_ollama` completes model names from `ollama list` and
`ollama ps`.

## Usage

Completions work as usual:

```zsh
claude mcp <TAB>
agy --<TAB>
ollama run <TAB>
```

## Updating completions

Several CLIs generate their own completions. Refresh the snapshots with:

```zsh
ai-cli-completions-update            # every installed CLI with a native generator
ai-cli-completions-update codex q    # only the listed ones
```

The script skips CLIs that aren't installed, validates output with `zsh -n`,
and overwrites a file only when the result is valid. Then restart the shell:

```zsh
zpm clean && exec zsh
```
