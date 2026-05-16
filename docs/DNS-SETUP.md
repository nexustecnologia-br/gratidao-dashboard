# 🌐 Configuração de Domínio - gratidao.nexus-tecnolog.ia.br

---

## 📍 Passo 1: Onde Está Seu Domínio Registrado?

Procure o registrador onde você comprou/registrou `nexus-tecnolog.ia.br`:

Opções comuns:
- **GoDaddy** (godaddy.com)
- **Namecheap** (namecheap.com)
- **Registro.br** (registro.br) - se é .br
- **Cloudflare** (cloudflare.com)
- **AWS Route 53** (aws.amazon.com)
- Outro?

---

## 📋 Passo 2: Obter Dados de Deploy

### Se usando **VERCEL**:

1. Abrir Vercel Dashboard
2. Ir para: **Settings → Domains**
3. Adicionar: `gratidao.nexus-tecnolog.ia.br`
4. Vercel mostrará um **CNAME Record**:

```
Nome (Subdomain): gratidao
Tipo: CNAME
Apontará para: gratidao-dashboard.vercel.app
TTL: 3600
```

### Se usando **NETLIFY**:

1. Abrir Netlify Site Settings
2. Ir para: **Domain Management**
3. Adicionar: `gratidao.nexus-tecnolog.ia.br`
4. Netlify mostrará um **CNAME Record**:

```
Nome (Subdomain): gratidao
Tipo: CNAME
Apontará para: seu-site.netlify.app
TTL: 3600
```

---

## 🔗 Passo 3: Configurar DNS no Seu Registrador

### Exemplo: GoDaddy

1. Acessar GoDaddy
2. Ir para: **Meus Domínios** → `nexus-tecnolog.ia.br`
3. Clicar em: **Gerenciar DNS**
4. Procurar por **Registros DNS** ou **DNS Management**
5. Adicionar novo registro:
   - **Tipo**: CNAME
   - **Nome/Host**: `gratidao` (não precisa de ponto)
   - **Apontará para**: `gratidao-dashboard.vercel.app` (ou Netlify)
   - **TTL**: 3600 (ou padrão)
6. Clicar em **Salvar**

### Exemplo: Namecheap

1. Acessar Namecheap
2. Ir para: **Dashboard** → `nexus-tecnolog.ia.br`
3. Clicar: **Manage**
4. Abrir: **Advanced DNS**
5. Adicionar CNAME Record:
   - **Type**: CNAME Record
   - **Host**: `gratidao`
   - **Value**: `gratidao-dashboard.vercel.app`
   - **TTL**: 3600
6. Clicar: **Save**

### Exemplo: Cloudflare

1. Acessar Cloudflare
2. Ir para: Seu site `nexus-tecnolog.ia.br`
3. Clicar: **DNS**
4. Adicionar Record:
   - **Type**: CNAME
   - **Name**: `gratidao`
   - **Target**: `gratidao-dashboard.vercel.app`
   - **TTL**: Auto
5. Clicar: **Save**

---

## ✅ Passo 4: Validar Configuração

### Teste 1: DNS Propagação

```bash
# No PowerShell/Terminal, digitar:
nslookup gratidao.nexus-tecnolog.ia.br

# Esperado output:
# Name:    gratidao.nexus-tecnolog.ia.br
# Address: 123.45.67.89 (IP do Vercel/Netlify)
```

Ou usar: https://mxtoolbox.com/nslookup.aspx

### Teste 2: Acesso ao Site

1. Abrir navegador
2. Digitar: `https://gratidao.nexus-tecnolog.ia.br`
3. Esperado: Dashboard carrega sem erro

### Teste 3: HTTPS/SSL

1. Abrir DevTools (F12)
2. Ir para **Security** tab
3. Verificar: **Certificate is valid**
4. Cadeado verde na barra de endereço

---

## ⏱️ Quanto Tempo Leva?

| Passo | Tempo |
|-------|-------|
| Configurar DNS | 5 min |
| Propagação global | 15 min - 48h |
| Primeiro acesso | Imediato após propagação |

**Nota**: DNS pode levar até 48h para propagar globalmente, mas geralmente é instantâneo.

---

## 🆘 Troubleshooting DNS

### "Domínio não resolve"
```bash
# Testar propagação DNS:
nslookup gratidao.nexus-tecnolog.ia.br

# Se não encontrar, esperar 15-30 minutos
# Depois rodar novamente
```

### "Certificado inválido"
→ Aguardar propagação DNS completar  
→ Limpar cache do navegador (Ctrl+Shift+Delete)  
→ Tentar em navegador diferente

### "Conexão recusada"
→ Verificar que CNAME foi salvo corretamente no registrador  
→ Verificar que domínio aponta para Vercel/Netlify (não para IP antigo)  
→ Recarregar Vercel/Netlify settings

---

## 📊 Verificação Final

Após propagação completa:

```bash
# 1. Verificar DNS
nslookup gratidao.nexus-tecnolog.ia.br
# Esperado: retorna IP do Vercel/Netlify

# 2. Verificar HTTPS
curl -I https://gratidao.nexus-tecnolog.ia.br
# Esperado: HTTP/1.1 200 OK (ou 301 redirect HTTP → HTTPS)

# 3. Verificar certificado
# Clicar no cadeado verde no navegador
# Esperado: Certificate is valid
```

---

## 🎯 Checklist Final

- [ ] Registrador identificado (GoDaddy, Namecheap, Cloudflare, etc)
- [ ] CNAME record adicionado ao DNS
- [ ] CNAME aponta para Vercel/Netlify
- [ ] TTL configurado para 3600
- [ ] Aguardado 15-30 min de propagação
- [ ] `nslookup gratidao.nexus-tecnolog.ia.br` retorna IP
- [ ] Navegador consegue acessar `https://gratidao.nexus-tecnolog.ia.br`
- [ ] Cadeado verde mostra certificado válido
- [ ] Dashboard carrega e mostra startups

---

**Status**: ✅ Pronto para usar domínio customizado

Que registrador você usa? Posso ajudar com os passos específicos!
