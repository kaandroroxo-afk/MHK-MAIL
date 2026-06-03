# 🚀 MHK MAIL - DEPLOY RÁPIDO (10 MINUTOS)

## PASSO 1: Criar Banco Supabase
```
https://supabase.com
→ Create Project (nome: mhk-mail)
→ Aguard 2 minutos
```

## PASSO 2: Criar Tabelas
```
Supabase → SQL Editor → New Query
Cole TUDO de: api/SUPABASE_SETUP.sql
→ RUN
```

## PASSO 3: Copiar Credenciais
```
Supabase → Project Settings → API
Copie essas 2 linhas:
  - Project URL
  - anon public (API Key)
```

## PASSO 4: Colar em .env
```
Abra: api/.env
Cole:
SUPABASE_URL=sua-url-aqui
SUPABASE_KEY=sua-key-aqui
JWT_SECRET=mhk-2024-secret
```

## PASSO 5: Rodar Backend Local
```powershell
# Terminal 1
cd api
npm install
npm run dev
# Output: 🚀 MHK Mail Backend running on http://localhost:3001
```

## PASSO 6: Testar
```powershell
# Terminal 2
curl -X POST http://localhost:3001/api/auth/register ^
  -H "Content-Type: application/json" ^
  -d "{\"email\":\"test@test.com\",\"password\":\"123456\",\"name\":\"Test\"}"
# Esperado: "token": "..."
```

## PASSO 7: Abrir Dashboard
```
Browser: http://localhost:3000
ou: public/dashboard.html
→ Registre e faça login
→ Pronto!
```

## PASSO 8: Git Push
```powershell
# Terminal 1: Parar o backend (CTRL+C)
# Terminal 2
git add -A
git commit -m "Add MHK Mail backend and dashboard"
git push origin main
```

## PASSO 9: Deploy Backend (Vercel)
```
https://vercel.com
→ Import Project
→ Selecione seu repositório
→ Em Environment Variables, adicione:
   SUPABASE_URL=...
   SUPABASE_KEY=...
   JWT_SECRET=...
→ Deploy
→ Copie URL (ex: https://mhk-mail-api.vercel.app)
```

## PASSO 10: Atualizar Frontend
```javascript
// Abra: public/dashboard.html
// Procure por:
const API_URL = localStorage.getItem('API_URL') || 'http://localhost:3001';

// Mude para:
const API_URL = 'https://sua-url-vercel.vercel.app';

// Salve e faça commit
git add -A
git commit -m "Update API URL to Vercel"
git push origin main
```

## PRONTO! 🎉

Seu site está em:
```
Frontend:  https://seu-usuario.github.io/MHK_MAIL/
Backend:   https://sua-url-vercel.vercel.app
Database:  Supabase PostgreSQL
```

## Novo Menu do test-mhk-mail.bat

Agora tem estas opções:
- **[1-7]**: Motores antigos (Python, Node, .NET, etc)
- **[8]**: Rodar backend (npm run dev)
- **[9]**: Deploy automático (git + vercel)
- **[10]**: Sair

Para testar tudo:
```powershell
cmd /c test-mhk-mail.bat
# Digite 8 para rodar backend
# ou Digite 9 para deploy
```

---

**Tempo total: ~10 minutos ⏱️**
