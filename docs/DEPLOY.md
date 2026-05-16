# 🚀 Guia de Deploy - Gratidão Dashboard

**Dashboard**: `gratidao.nexus-tecnolog.ia.br`  
**Status**: Pronto para Deploy  
**Data**: 2026-05-15

---

## 📋 Opções de Deploy

### ✅ Opção 1: VERCEL (Recomendado) - 5 minutos

**Vantagens:**
- Zero configuração
- Auto-HTTPS
- CI/CD automático via Git
- Domínio customizado grátis
- Uptime 99.95%

**Passos:**

1. **Criar repositório GitHub**
   ```bash
   cd C:\Users\rodri\Desktop\Projetos\Gratidao\dashboard
   git init
   git add .
   git commit -m "Initial commit: Dashboard Gratidão"
   git remote add origin https://github.com/seu-usuario/gratidao-dashboard.git
   git push -u origin main
   ```

2. **Deploy no Vercel**
   - Abrir: https://vercel.com/new
   - Conectar GitHub
   - Selecionar repositório `gratidao-dashboard`
   - Clicar: **Deploy**

3. **Configurar Domínio Customizado**
   - Dashboard Vercel → Settings → Domains
   - Adicionar: `gratidao.nexus-tecnolog.ia.br`
   - Seguir instruções DNS (apontar CNAME)

4. **Variáveis de Ambiente** (opcional)
   - Settings → Environment Variables
   - Adicionar `SUPABASE_ANON_KEY` (se quiser ocultar)

---

### ✅ Opção 2: NETLIFY - 5 minutos

**Vantagens:**
- Tão fácil quanto Vercel
- Build automático
- Até 100GB/mês de banda grátis

**Passos:**

1. **Push para GitHub** (mesmo de Vercel)

2. **Deploy no Netlify**
   - Abrir: https://app.netlify.com/start
   - Conectar GitHub
   - Selecionar repositório
   - Build settings: deixar em branco (site estático)
   - Clicar: **Deploy site**

3. **Configurar Domínio**
   - Site settings → Domain management
   - Adicionar domínio customizado
   - Configurar DNS em seu registrador

---

### ✅ Opção 3: SERVIDOR PRÓPRIO (SSH/FTP) - 10 minutos

**Se tem servidor Linux rodando:**

1. **Via SSH**
   ```bash
   # Conectar ao servidor
   ssh usuario@seu-servidor.com
   
   # Criar pasta para o site
   mkdir -p /var/www/gratidao-dashboard
   cd /var/www/gratidao-dashboard
   
   # Copiar arquivos (de sua máquina)
   scp -r C:\Users\rodri\Desktop\Projetos\Gratidao\dashboard/* usuario@seu-servidor.com:/var/www/gratidao-dashboard/
   ```

2. **Configurar Apache/Nginx**
   
   **Apache:**
   ```apache
   <VirtualHost *:80>
       ServerName gratidao.nexus-tecnolog.ia.br
       DocumentRoot /var/www/gratidao-dashboard
       
       <Directory /var/www/gratidao-dashboard>
           AllowOverride All
           Require all granted
       </Directory>
   </VirtualHost>
   ```

   **Nginx:**
   ```nginx
   server {
       listen 80;
       server_name gratidao.nexus-tecnolog.ia.br;
       root /var/www/gratidao-dashboard;
       index index.html;
       
       location / {
           try_files $uri $uri/ /index.html;
       }
   }
   ```

3. **Habilitar HTTPS (Let's Encrypt)**
   ```bash
   sudo certbot certonly -d gratidao.nexus-tecnolog.ia.br
   # Seguir instruções
   ```

---

### ✅ Opção 4: DOCKER - 15 minutos

**Para containerizar o dashboard:**

Criar `Dockerfile`:
```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
COPY .htaccess /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Deploy:
```bash
# Build
docker build -t gratidao-dashboard .

# Run
docker run -d -p 80:80 --name gratidao gratidao-dashboard
```

---

## 🔧 Pós-Deploy: Checklist

Após fazer deploy, validate:

### 1. Teste de Acesso
- [ ] Abrir `gratidao.nexus-tecnolog.ia.br`
- [ ] Página carrega (sem erros no console)
- [ ] Design aparece corretamente
- [ ] Botões funcionam

### 2. Teste de Conexão Supabase
- [ ] Clicar em "Nova Startup"
- [ ] Preencher form
- [ ] Clicar em "Criar Startup"
- [ ] Esperado: ✅ "Startup criada com sucesso!"

### 3. Teste de Dados em Tempo Real
- [ ] Criar 2-3 startups via dashboard
- [ ] Verificar se aparecem na lista
- [ ] Aguardar 30 segundos
- [ ] Listar deve atualizar automaticamente

### 4. Verificar HTTPS
- [ ] URL deve ser `https://` (não http)
- [ ] Cadeado verde no navegador
- [ ] Sem erros de certificado

### 5. Teste de Performance
- [ ] Abrir DevTools (F12)
- [ ] Verificar tempo de carregamento
- [ ] Esperado: < 2 segundos
- [ ] Sem erros no console

---

## 🔐 Segurança

### ⚠️ Credenciais Supabase

**NUNCA** hardcode credenciais no `index.html`. Usar apenas:
- ✅ Supabase **Anon Key** (pública, segura para cliente)
- ❌ Service Role Secret (nunca expor no frontend!)

**Anon Key está segura porque:**
- Só pode ler/escrever dados permitidos por RLS
- Pode ser publicamente visível
- Validação acontece no servidor

### Implementar Row-Level Security (RLS) no Supabase

```sql
-- Habilitar RLS na tabela gratidao_startups
ALTER TABLE gratidao_startups ENABLE ROW LEVEL SECURITY;

-- Política: Ler tudo (público)
CREATE POLICY "Ler startups" ON gratidao_startups
  FOR SELECT USING (true);

-- Política: Só inserir via API
CREATE POLICY "Criar startups via API" ON gratidao_startups
  FOR INSERT WITH CHECK (true);
```

---

## 📊 Monitoramento Pós-Deploy

### Vercel
- Dashboard automático com analytics
- Alertas de erro automáticos
- Logs em tempo real

### Netlify
- Netlify Analytics (painel)
- Builds automáticos
- Rollback one-click

### Servidor Próprio
```bash
# Monitorar logs
tail -f /var/log/apache2/access.log

# Verificar uptime
uptime

# Monitorar memória
free -h
```

---

## 🆘 Troubleshooting

### "404 - Página não encontrada"
→ Configurar rewrite rules no `.htaccess` ou Nginx

### "CORS Error ao conectar Supabase"
→ Verificar que Supabase permite domínio em **Settings → Authentication**

### "Dashboard carrega mas não mostra startups"
→ Verificar console (F12) para erros
→ Validar Supabase Key no código

### "Botão não funciona"
→ Abrir DevTools
→ Verificar erros em Console
→ Validar SUPABASE_KEY está correta

---

## 📈 Próximas Evoluções (Pós-Deploy)

1. **Página detalhes da startup**
   - Ver todas as 6 fases
   - Marcar itens de checklist
   - Ver aprendizados salvos

2. **Gráficos de progresso**
   - Chart.js com dados reais
   - Taxa de conversão por fase
   - Velocidade média de progressão

3. **Notificações**
   - Webhook quando startup avança de fase
   - Email de alerta para rejeições
   - Slack integration

4. **Admin Panel**
   - Gerenciar startups
   - Forçar avanço de fase
   - Ver logs de IA

---

## ✅ Resumo Rápido

| Plataforma | Tempo | Custo | HTTPS | Uptime |
|-----------|-------|-------|-------|--------|
| **Vercel** | 5 min | Grátis | Sim | 99.95% |
| **Netlify** | 5 min | Grátis | Sim | 99.95% |
| **Servidor SSH** | 15 min | ~$5/mês | Manual | Depende |
| **Docker** | 15 min | Var. | Manual | Var. |

**Recomendação: Vercel ou Netlify para começar** 🚀

---

**Status**: ✅ Pronto para Deploy

Escolha uma opção acima e execute!
