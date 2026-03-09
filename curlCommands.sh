---

## Comandos básicos do `curl`

### 1. **GET** (consultar dados)
```bash
curl http://localhost:3000/comandos
```
Consulta todos os documentos.

### 2. **POST** (inserir dados)
```bash
curl -X POST http://localhost:3000/comandos \
  -H "Content-Type: application/json" \
  -d '{"name":"show dbs","description":"List all databases"}'
```
Insere um novo documento.

### 3. **PUT** (atualizar dados)
```bash
curl -X PUT http://localhost:3000/comandos/<ID_DO_DOCUMENTO> \
  -H "Content-Type: application/json" \
  -d '{"description":"Updated description"}'
```
Atualiza um documento existente.

### 4. **DELETE** (remover dados)
```bash
curl -X DELETE http://localhost:3000/comandos/<ID_DO_DOCUMENTO>
```
Remove um documento pelo `_id`.

---

## Opções úteis do `curl`

| Opção | Função |
|-------|--------|
| `-X` | Define o método HTTP (GET, POST, PUT, DELETE) |
| `-H` | Define cabeçalhos (ex: `Content-Type`) |
| `-d` | Define o corpo da requisição (JSON, formulário, etc.) |
| `-i` | Mostra também os cabeçalhos da resposta |
| `-v` | Modo verbose (detalhes da requisição e resposta) |
| `-o arquivo.json` | Salva a resposta em um arquivo |
| `-s` | Modo silencioso (não mostra barra de progresso) |

---

## Exemplos extras

- **Ver cabeçalhos da resposta**:
```bash
curl -i http://localhost:3000/comandos
```

- **Modo detalhado (debug)**:
```bash
curl -v http://localhost:3000/comandos
```

- **Salvar resposta em arquivo**:
```bash
curl http://localhost:3000/comandos -o resposta.json
```

---
