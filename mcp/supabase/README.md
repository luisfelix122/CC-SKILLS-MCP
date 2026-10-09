# Supabase MCP Server

Official Repository: [supabase/mcp](https://github.com/supabase/mcp)  
Documentation: [supabase.com/docs/guides/ai-tools/mcp](https://supabase.com/docs/guides/ai-tools/mcp)

Connect your Supabase projects directly to AI assistants like Cursor, Claude, OpenCode, and Windsurf. The MCP server allows agents to inspect database schemas, write and execute SQL, generate migrations, deploy edge functions, and fetch project configuration.

## Setup Options

### 1. Hosted HTTP Endpoint (Official & Recommended)

Supabase provides a managed, remote HTTP endpoint that requires no local installation:

```json
{
  "mcpServers": {
    "supabase": {
      "type": "http",
      "url": "https://mcp.supabase.com/mcp"
    }
  }
}
```

*Note: When you connect this in Claude Desktop or Cursor, your MCP client will prompt you to authenticate via OAuth with your Supabase account and pick your organization/project.*

### 2. Local Supabase CLI Development
If you are developing locally with `supabase start`, connect to your local environment:

```json
{
  "mcpServers": {
    "supabase-local": {
      "type": "http",
      "url": "http://localhost:54321/mcp"
    }
  }
}
```

### 3. Project-Scoped Read-Only Endpoint
You can restrict access to specific projects and enforce read-only execution:
```json
{
  "mcpServers": {
    "supabase": {
      "type": "http",
      "url": "https://mcp.supabase.com/mcp?project_ref=YOUR_PROJECT_REF&read_only=true&features=database,docs"
    }
  }
}
```

## Available Capabilities

- `list_tables` & `get_table_schema`: Inspect Postgres tables and relational foreign keys.
- `execute_sql`: Execute queries directly against your Postgres instance.
- `list_migrations` & `apply_migration`: Safe database migrations.
- `list_edge_functions` & `deploy_edge_function`: Manage Supabase Deno Edge Functions.
- `generate_typescript_types`: Generate accurate TypeScript types from schema.
