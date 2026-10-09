# CC-SKILLS-MCP: Repositorio de Skills y MCP para el Equipo

Repositorio centralizado con las mejores **Skills** y servidores **Model Context Protocol (MCP)** configurados para que el equipo los descargue, instale y use inmediatamente en **OpenCode**, **Cursor**, **Claude Code**, **Antigravity**, **VS Code** y **Windsurf**.

---

## Inicio Rápido (Descarga e Instalación)

### 1. Clonar el repositorio
```bash
git clone https://github.com/luisfelix122/CC-SKILLS-MCP.git
cd CC-SKILLS-MCP
```

### 2. Instalación en 1 Clic

#### En Windows (PowerShell):
```powershell
.\install-all.ps1
```

#### En macOS / Linux (Terminal):
```bash
chmod +x install-all.sh scripts/*.sh
./install-all.sh
```

El script copia automáticamente todas las skills a las carpetas estándar de tu entorno:
- `~/.agents/skills` (Cursor, Claude Code, Antigravity)
- `~/.config/opencode/skills` (OpenCode)

---

## 🧰 Skills Incluidas

Todas las skills están empaquetadas en la carpeta [`skills/`](./skills/) con sus archivos fuente, referencias y definiciones `SKILL.md`.

| Skill | Fuente | ¿Para qué sirve? | Comando rápido |
| :--- | :--- | :--- | :--- |
| **impeccable** | `pbakaus/impeccable` | Diseño UI/UX de alta precisión, sistemas de diseño, detección de antipatrones y auditoría DOM en vivo. | `npx skills add pbakaus/impeccable` |
| **taste-skill** | [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) | Motor de diseño frontend anti-plantilla con 3 controles (Variance, Motion, Density) y variantes (brutalist, minimalist, etc.). | `npx skills add leonxlnx/taste-skill` |
| **frontend-design** | [anthropics/skills](https://github.com/anthropics/skills) | Estándares oficiales de Anthropic para diseño, estructura y CSS en frontend. | Preinstalada en `skills/frontend-design` |
| **webapp-testing** | [anthropics/skills](https://github.com/anthropics/skills) | Patrones oficiales de testing para aplicaciones web (Playwright, Vitest, testing E2E). | Preinstalada en `skills/webapp-testing` |
| **agent-browser** | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) | Automatización del navegador web para agentes (especialmente adaptado para **OpenCode**). | `npm i -g agent-browser && agent-browser install` |
| **skill-creator** | [anthropics/skills](https://github.com/anthropics/skills) | Guía y herramientas oficiales de Anthropic para crear y evaluar nuevas skills. | Preinstalada en `skills/skill-creator` |

### Uso específico con OpenCode
Para usar **agent-browser** en OpenCode:
1. Instala el CLI global:
   ```bash
   npm install -g agent-browser && agent-browser install
   ```
2. Ejecuta `./scripts/install-skills.sh` o `.\scripts\install-skills.ps1` para copiar las skills a `.opencode/skills/` o `~/.config/opencode/skills/`.

---

## 🔌 Servidores MCP (Model Context Protocol)

En la carpeta [`mcp/`](./mcp/) se encuentran las configuraciones y guías de instalación para cada cliente.

| Servidor MCP | Proveedor / Repo | Función principal | Comando / Endpoint |
| :--- | :--- | :--- | :--- |
| **Chrome DevTools** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Depuración del navegador en vivo, métricas de rendimiento, capturas de pantalla y consola. | `npx -y chrome-devtools-mcp@latest` |
| **Context7** | [Upstash Context7](https://context7.com) | Documentación oficial y ejemplos de código actualizados en tiempo real según la versión de cada librería. | `npx ctx7 setup` o `npx -y @upstash/context7-mcp` |
| **GitHub** | [github/github-mcp-server](https://github.com/github/github-mcp-server) | Servidor oficial de GitHub: gestión de PRs, issues, búsqueda de código, ramas y commits. | Docker / `npx -y @modelcontextprotocol/server-github` |
| **Supabase** | [supabase/mcp](https://github.com/supabase/mcp) | Servidor oficial de Supabase por HTTP: esquemas de base de datos, consultas SQL y migraciones. | `https://mcp.supabase.com/mcp` |
| **Engram** | [edg-l/engram-mcp](https://github.com/edg-l/engram-mcp) | Memoria persistente local (SQLite + ONNX) con recuperación híbrida (BM25 + vectores) y soporte de ramas git. | Binario `engram` |
| **TestSprite** | [testsprite.com](https://www.testsprite.com/solutions/mcp) | Agente autónomo de pruebas: genera, ejecuta y corrige suites de test en frontend y backend. | `npx -y @testsprite/testsprite-mcp@latest` |
| **Filesystem** | [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem) | Servidor oficial de sistema de archivos: lectura, escritura, edición y árboles de directorios con rutas delimitadas. | `npx -y @modelcontextprotocol/server-filesystem <carpetas>` |
| **Log Analyzer** | [djm81/log_analyzer_mcp](https://github.com/djm81/log_analyzer_mcp) | Análisis de logs de tests, ejecución de pruebas dirigidas, reportes de cobertura y búsqueda avanzada. | `uvx log-analyzer-mcp` |

### Archivos de Configuración Listos para Usar:
- **[`mcp/mcp-config.json`](./mcp/mcp-config.json)**: Configuración maestra con descripciones detalladas.
- **[`mcp/claude_desktop_config.json`](./mcp/claude_desktop_config.json)**: Copiar y pegar en Claude Desktop.
- **[`mcp/cursor_mcp.json`](./mcp/cursor_mcp.json)**: Copiar y pegar en `.cursor/mcp.json`.
- **[`mcp/opencode_mcp.json`](./mcp/opencode_mcp.json)**: Configuración para OpenCode.

---

## Contacto y Mantenimiento

Repositorio oficial del equipo: [https://github.com/luisfelix122/CC-SKILLS-MCP](https://github.com/luisfelix122/CC-SKILLS-MCP).
