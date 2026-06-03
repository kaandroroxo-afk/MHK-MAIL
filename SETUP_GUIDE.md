# MHK Mail - Guia Completo de Setup (100% Gratuito)

## 🚀 Setup em 10 Minutos

### 1️⃣ Criar Banco de Dados (Supabase - GRÁTIS)

1. Vá para https://supabase.com
2. Clique **Create new project**
3. Login com GitHub (recomendado) ou email
4. Preencha:
   - **Project name**: `mhk-mail`
   - **Database password**: Crie uma senha forte
   - **Region**: Escolha próximo a você
5. **Espere 2 minutos** enquanto o projeto é criado

### 2️⃣ Criar as Tabelas SQL

1. No Supabase, vá para **SQL Editor**
2. Clique **New Query**
3. **Copie todo o conteúdo** do arquivo `api/SUPABASE_SETUP.sql`
4. Cole na query e clique **Run**
5. ✓ Tabelas criadas!

### 3️⃣ Copiar Credenciais

1. Em Supabase, vá para **Project Settings** (ícone engrenagem)
2. Clique **API** (menu esquerdo)
3. Copie:
   - `Project URL` → `SUPABASE_URL`
   - `anon public` → `SUPABASE_KEY`

4. Abra `api/.env` e cole:
```env
SUPABASE_URL=sua-url-aqui
SUPABASE_KEY=sua-chave-aqui
JWT_SECRET=mhk-email-2024-secret-change-this
```

### 4️⃣ Instalar Dependências (Localmente)

```bash
# No folder api/
cd api
npm install
```

### 5️⃣ Rodar Backend Localmente

```bash
# Terminal 1 - Backend
cd api
npm run dev
# Output: 🚀 MHK Mail Backend running on http://localhost:3001
```

### 6️⃣ Testar a API

```bash
# Terminal 2 - Teste
curl -X POST http://localhost:3001/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email":"test@example.com",
    "password":"123456",
    "name":"Test User"
  }'

# Esperado: { "message": "User created", "token": "...", "userId": "..." }
```

### 7️⃣ Acessar o Dashboard

1. Abra no navegador: `http://localhost:3000` ou `public/dashboard.html`
2. Registre uma conta com o email e senha de teste
3. Claique **Login**
4. Pronto! Dashboard funcionando

## 🌐 Deploy em Vercel (GRATUITO)

### Backend (Node.js API)

1. Faça push dos arquivos para GitHub
2. Vá para https://vercel.com
3. Clique **Import Project**
4. Selecione seu repositório GitHub
5. Em **Framework Preset**, escolha **Node.js**
6. Em **Environment Variables**, adicione:
   - `SUPABASE_URL=...`
   - `SUPABASE_KEY=...`
   - `JWT_SECRET=...`
7. Clique **Deploy**
8. Copie a URL do deployment (ex: `https://mhk-mail-api.vercel.app`)

### Frontend (GitHub Pages)

1. No `public/dashboard.html`, mude a linha:
```javascript
const API_URL = localStorage.getItem('API_URL') || 'http://localhost:3001';
```

Para:
```javascript
const API_URL = 'https://sua-url-vercel.vercel.app';
```

2. Faça push: `git add -A && git commit -m "Update API URL" && git push`
3. Site estará em: `https://seu-usuario.github.io/MHK_MAIL/`

## 📋 Estrutura Final

```
MHK_MAIL/
├── api/                          # Backend Node.js
│   ├── src/
│   │   ├── index.js             # Servidor Express
│   │   ├── middleware/
│   │   │   └── auth.js          # JWT authentication
│   │   ├── routes/
│   │   │   ├── auth.js          # Login/Register
│   │   │   ├── email.js         # Send/Receive emails
│   │   │   └── apiKeys.js       # API Keys management
│   │   └── db/
│   │       └── supabase.js      # Database connection
│   ├── package.json
│   ├── .env                     # Credenciais (NÃO fazer push!)
│   └── SUPABASE_SETUP.sql       # Script de tabelas
├── public/
│   ├── index.html               # Site estático (antigo)
│   └── dashboard.html           # Dashboard + Login (NOVO)
├── src-python/                  # Motor Python (antigo)
├── src-node/                    # Motor Node (antigo)
└── vercel.json                  # Config Vercel

```

## 🔐 Variáveis de Ambiente

**Arquivo: `api/.env` (NÃO fazer push!)**

```env
# Supabase
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_KEY=eyJhbGc...

# JWT
JWT_SECRET=mhk-email-2024-secret

# Frontend
FRONTEND_URL=https://seu-usuario.github.io/MHK_MAIL/

# Email Service (Opcional)
SMTP_HOST=smtp.zoho.com
SMTP_PORT=587
SMTP_USER=seu-email@domain.com
SMTP_PASS=sua-senha

# Server
PORT=3001
NODE_ENV=production
```

## 📝 API Endpoints

### Autenticação (Público)
```bash
POST /api/auth/register
POST /api/auth/login
GET /api/auth/profile (requer token)
```

### Email (Requer Token)
```bash
GET /api/email/inbox
POST /api/email/send
```

### API Keys (Requer Token)
```bash
POST /api/keys/generate
GET /api/keys/list
DELETE /api/keys/:keyId
```

## ✅ Checklist Final

- [ ] Criar projeto Supabase
- [ ] Executar SQL do SUPABASE_SETUP.sql
- [ ] Copiar URL e Chave para .env
- [ ] `npm install` e `npm run dev` no backend
- [ ] Testar registro/login (curl ou browser)
- [ ] Fazer push para GitHub
- [ ] Deploy backend no Vercel
- [ ] Atualizar API_URL no frontend
- [ ] Acessar: `https://seu-usuario.github.io/MHK_MAIL/`

## 🆘 Troubleshooting

**"Cannot GET /api/..."**
→ Backend não está rodando ou URL está errada em `dashboard.html`

**"SUPABASE_KEY not set"**
→ Copie .env.example para .env e preencha as credenciais

**"Database connection failed"**
→ Verifique se as tabelas foram criadas no SQL Editor do Supabase

**"401 Unauthorized"**
→ Token expirou. Faça login novamente

## 💬 Próximas Melhorias

- [ ] Autenticação GitHub/Google (OAuth)
- [ ] Webhook para receber emails reais
- [ ] Dashboard com gráficos
- [ ] Rate limiting para API Keys
- [ ] 2FA (Two Factor Authentication)

**Tudo 100% Gratuito! 🎉**
