# Filesystem MCP Server

Official Repository: [modelcontextprotocol/servers/tree/main/src/filesystem](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)  
Package: `@modelcontextprotocol/server-filesystem`

The official Reference Model Context Protocol (MCP) server for filesystem access. It allows AI assistants to read, write, list, move, and search files and directories within explicitly allowed root directories.

## Features

- **Read / Write Files**: Read UTF-8 text and binary data, create or edit files.
- **Directory Operations**: List directory contents, recursively search for files, inspect metadata.
- **Security Scoping**: Restricts all file access to an explicit list of allowed directories to prevent unauthorized filesystem access.

## Configuration

> [!IMPORTANT]
> You must pass at least one allowed directory argument in `args`. Replace the example paths below with your actual project or workspace paths.

### Standard JSON Configuration
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:/Users/Luis/Projects",
        "C:/Users/Luis/OneDrive/Escritorio"
      ]
    }
  }
}
```

### macOS / Linux Configuration
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/username/projects",
        "/Users/username/Desktop"
      ]
    }
  }
}
```

## Available Tools

- `read_file`: Reads the complete contents of a file.
- `read_multiple_files`: Reads multiple files simultaneously.
- `write_file`: Creates a new file or completely overwrites an existing file.
- `edit_file`: Performs targeted line/string edits on a file.
- `create_directory`: Creates new directories recursively.
- `list_directory`: Lists files and directories with metadata.
- `directory_tree`: Returns a recursive tree view of a directory.
- `search_files`: Searches for files matching a pattern.
- `get_file_info`: Retrieves file metadata (size, created/modified timestamps, permissions).
- `list_allowed_directories`: Lists the directories the server is permitted to access.
