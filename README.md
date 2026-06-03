# MHK Mail - Sistema Multilíngue de Envio de E-mails

Plataforma centralizada de autenticação e envio de e-mails com suporte a múltiplos motores (Python, Node.js, C# .NET 8).

## 📖 Acessar o Site

O dashboard está hospedado no GitHub Pages. Após fazer push para `main` ou `master`, o site estará disponível em:

```
https://<seu-usuario-github>.github.io/<seu-repositório>/
```

Exemplo:
```
https://kaandro.github.io/MHK_MAIL/
```

### Configuração Necessária

1. **Ativar GitHub Pages no repositório:**
   - Vá para Settings → Pages
   - Em "Source", selecione "Deploy from a branch"
   - Em "Branch", escolha `main` (ou `master`) e pasta `/root`
   - Clique "Save"

2. **Alternativa (Automática com este workflow):**
   - Este repositório já tem o workflow `deploy-pages.yml` configurado
   - A cada push para `main`/`master`, o site é atualizado automaticamente

## 🚀 Estrutura do Projeto

```
MHK_MAIL/
├── public/              # Site estático (dashboard)
│   └── index.html      # Interface principal
├── src-python/         # Motor Python (aiosmtplib)
│   ├── send_email.py
│   ├── ollama_client.py
│   └── requirements.txt
├── src-node/           # Motor Node.js/TypeScript (nodemailer)
│   ├── sendEmail.ts
│   ├── ollamaClient.ts
│   ├── package.json
│   └── tsconfig.json
├── src-dotnet/         # Motor C# .NET 8 (MailKit)
│   ├── Program.cs
│   └── EmailService.csproj
├── src-templates/      # Modelos de e-mail HTML
│   └── email-base.html
├── api/                # Trigger da API Vercel
│   └── trigger-email.ts
├── .github/workflows/  # GitHub Actions
│   ├── deploy-pages.yml      # Deploy automático do site
│   └── mhk-dispatcher.yml    # Disparador de e-mails
└── test-mhk-mail.bat  # Script de teste local (Windows)
```

## 💻 Executar Localmente

### Windows (test-mhk-mail.bat)

```powershell
cmd /c test-mhk-mail.bat
```

Menu de opções:
- **[1]** Python Engine (aiosmtplib + Ollama)
- **[2]** Node.js Engine (nodemailer + Ollama)
- **[3]** C# .NET Engine (MailKit + Ollama)
- **[4]** API Trigger (curl)
- **[5]** Host lightweight server (Python builtin) **[RECOMENDADO]**
- **[6]** Host with Vercel CLI
- **[7]** Open dashboard (static mode)
- **[8]** Exit

### Pré-requisitos

**Python:**
```bash
pip install -r src-python/requirements.txt
python src-python/send_email.py
```

**Node.js:**
```bash
cd src-node
npm install
npx ts-node sendEmail.ts
```

**C# .NET 8:**
```bash
cd src-dotnet
dotnet restore
dotnet run
```

## 🔧 Configuração de Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
SMTP_HOST=smtp.zoho.com
SMTP_PORT=587
SMTP_USER=seu-email@dominio.com
SMTP_PASS=sua-senha
MHK_API_KEY=sua-chave-secreta
OLLAMA_PROMPT=Gere um email profissional sobre...
```

## 🤖 Integração com Ollama (Opcional)

Se tiver **Ollama** instalado localmente, o sistema pode gerar conteúdo de e-mail automaticamente:

1. Instale [Ollama](https://ollama.ai/)
2. Execute um modelo: `ollama run llama2`
3. Ao executar um motor, escolha gerar com Ollama

## 📤 GitHub Actions - Dispatcher de E-mails

O repositório contém um workflow para disparar e-mails via GitHub Actions:

1. Vá para **Actions** → **MHK Mail - Serverless Email Dispatcher**
2. Clique **Run workflow**
3. Escolha:
   - **Provider**: Python, Node.js ou C# .NET
   - **To**: E-mail do destinatário
   - **Subject**: Assunto do e-mail
   - **Body**: Corpo (HTML permitido) ou deixe vazio para gerar com Ollama
4. Configure [secrets do GitHub](https://docs.github.com/pt/actions/security-guides/using-secrets-in-github-actions):
   - `SMTP_HOST`
   - `SMTP_PORT`
   - `SMTP_USER`
   - `SMTP_PASS`

## 📋 Status dos Workflows

- ✅ **deploy-pages.yml**: Deploy automático do dashboard
- ✅ **mhk-dispatcher.yml**: Disparo de e-mails serverless

## 📝 Licença

MIT - Sinta-se livre para usar, modificar e distribuir.

## 🤝 Contribuições

Contribute com melhorias, correções de bugs ou novas funcionalidades!

---

**Desenvolvido com ❤️ para a MHK Mail**
