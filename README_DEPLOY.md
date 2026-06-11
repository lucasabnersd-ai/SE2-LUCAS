# Publicar o relatório SE2 no GitHub Pages

Publicação **100% via Python**, na mesma lógica do seu `auto_commit.py` do EXTRATO.

- **Repositório:** https://github.com/lucasabnersd-ai/SE2LUCAS
- **Site (depois de ativar o Pages):** https://lucasabnersd-ai.github.io/SE2LUCAS/

O `deploy.py` localiza o `git.exe` sozinho — inclusive o **git embutido no GitHub Desktop** —
então não é preciso instalar git à parte nem digitar URL/senha. Basta o **GitHub Desktop
estar logado** na sua conta (já está, pois o `extrato-grazielle` publica por esse caminho).

---

## Como publicar

### Opção A — Automático ao atualizar (recomendado)
Rode a atualização como sempre:

- duplo clique em **`atualizar_html.bat`** (ou rode `atualizar.py`)

No final, se a atualização der certo, ele **publica sozinho** no GitHub (SE2LUCAS).
Para pular o deploy numa rodada específica, defina `SE2_NO_PUBLISH=1` antes de rodar.

### Opção B — Publicar manualmente
- duplo clique em **`deploy.bat`** (dentro da pasta `PUBLICAR_GITHUB`)

Ele faz: localizar git → garantir o repositório → `add` → `commit` → `push`.
Se nada mudou, não cria commit. Se o `.git` estiver quebrado, ele **recria sozinho**.

---

## Ativar o GitHub Pages (uma única vez)
No repositório **SE2LUCAS** no GitHub:

1. **Settings → Pages**
2. **Source:** *Deploy from a branch*
3. **Branch:** `main` · **Folder:** `/ (root)` → **Save**

Em ~1 minuto o site fica no ar em `https://lucasabnersd-ai.github.io/SE2LUCAS/`.

---

## O que é publicado

O site precisa de: `index.html` (app com dados embutidos), `backup.js` (suas
modificações) e `.nojekyll`. Também sobem como fonte: `app.js`, `deploy.py`,
`deploy.bat`, `README_DEPLOY.md`.

**Fica de fora** (via `.gitignore`, para não pesar o repo): `datos.js` (12 MB,
já embutido no `index.html`), todos os `*.bak`/`*.tmp`, a pasta `backups/`,
`backup_conciliacao_*.json`, `se2_estado.json` e PDFs.

---

## Solução de problemas

- **"git.exe nao encontrado"** → abra o **GitHub Desktop** uma vez (ele instala/atualiza
  o git embutido) ou instale o Git for Windows: https://git-scm.com/download/win
- **Pediu login no push** → confirme que o GitHub Desktop está logado na conta
  `lucasabnersd-ai`. Alternativa: rode `git push` manual na pasta uma vez para o
  Windows Credential Manager salvar o acesso.
- **Algo no `.git` parece quebrado** → o `deploy.py` detecta e recria. Se quiser,
  apague a pasta oculta `.git` e rode de novo.
- **A página não atualiza** → cache do Pages; aguarde 1–2 min e use `Ctrl+F5`.

---

## Fase 2 — Supabase (próximo passo)

Hoje suas **modificações manuais** (status de pagamento, observações, conciliação,
lançamentos entre empresas, pendências) ficam no **localStorage do navegador** — presas
ao computador onde foram feitas. A Fase 2 move **apenas essas modificações** para o
**Supabase**, fazendo o relatório publicado **ler e gravar ao vivo** no banco
(persistem e sincronizam entre máquinas). Os dados-fonte continuam indo pelo Git.
Quando quiser, é só pedir para seguir com a Fase 2.
