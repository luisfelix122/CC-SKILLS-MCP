# Engram MCP: Persistent Memory for Coding Agents

Official Repository: [edg-l/engram-mcp](https://github.com/edg-l/engram-mcp)

Engram is an opinionated, local-first persistent memory engine engineered for AI coding agents. Unlike generic vector stores, Engram operates on local SQLite + embedded ONNX vector models with branch awareness, structured handoffs, automatic decay, and hybrid BM25 + cosine retrieval.

## Key Architecture

- **Local-Only & Zero-Ops**: Built on SQLite FTS5 + ONNX embedding model (`mdbr-leaf-ir`, 256-dim). No external API calls needed for embeddings or retrieval.
- **Branch Awareness & Handoffs**: Automatically links context and handoff sections to git branches.
- **Hybrid Retrieval**: Combines BM25 exact matching (crucial for code identifiers and file paths) with vector cosine similarity and recency decay.
- **Proactive & Background Dedup**: Deduplicates near-identical memories and decays stale ones.

## Installation

Download or compile the `engram` binary using Rust / Cargo:
```bash
cargo install --git https://github.com/edg-l/engram-mcp engram
```
Or grab prebuilt release binaries from [edg-l/engram-mcp releases](https://github.com/edg-l/engram-mcp/releases).

## Configuration

Add to your MCP settings file:

```json
{
  "mcpServers": {
    "engram": {
      "command": "engram",
      "args": [],
      "env": {
        "ENGRAM_DB": "~/.local/share/engram/memories.db",
        "ENGRAM_MCP_TOOL_PROFILE": "full"
      }
    }
  }
}
```

### Configuration Options

| Variable | Description | Default |
| :--- | :--- | :--- |
| `ENGRAM_DB` | Path to SQLite database file | `~/.local/share/engram/memories.db` |
| `ENGRAM_MCP_TOOL_PROFILE` | Tool profile: `full` (24 tools), `core` (15), `minimal` (3) | `full` |
| `ENGRAM_DECAY_INTERVAL` | Decay job interval in seconds | `3600` (1 hr) |
| `ENGRAM_HOOK_DEDUP_SKIP` | Similarity threshold for auto-deduping | `0.95` |

## Core Commands & Tools

- `mem_context`: Rapid context retrieval for the active session.
- `mem_search`: Hybrid BM25 + semantic vector search across all memories.
- `mem_save`: Store decisions, architecture rules, bug fixes, or patterns.
- `mem_session_summary`: Persist comprehensive session handoffs between agent runs.
