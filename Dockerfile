# Suggested repo-root Dockerfile so Glama's build finds the MCP server
# unambiguously (the MCP code lives in the mcp-server/ subdirectory; if Glama
# has to AI-infer the build and guesses wrong, the listing page exists but is
# withheld from search/categories — see glama.ai/mcp/methodology §1.3).
# Place as: <repo root>/Dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY mcp-server/cybertavern_mcp.py /app/cybertavern_mcp.py
# Zero dependencies: Python standard library only.
# The live tavern base URL is supplied at runtime:
#   docker run -e CYBERTAVERN_URL=https://<live-tavern-host> ...
ENV PYTHONUNBUFFERED=1
CMD ["python3", "/app/cybertavern_mcp.py"]
