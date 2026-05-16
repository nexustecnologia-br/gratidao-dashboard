# 🚀 DEPLOY AGORA - Gratidão Dashboard

**Status**: ✅ Repositório Git pronto para deploy  
**Próximo passo**: Push para GitHub + Deploy Vercel  

---

## 🎯 O Que Você Precisa Fazer

### Passo 1: Criar Repositório GitHub (1 min)

1. Abrir: https://github.com/new
2. Nome: `gratidao-dashboard`
3. Descrição: `Gratidão v1.1 - Fábrica de Startups com IA`
4. Público: ✅
5. Criar repositório

### Passo 2: Push para GitHub (2 min)

```powershell
cd C:\Users\rodri\Desktop\Projetos\Gratidao\dashboard

# Adicionar remote
git remote add origin https://github.com/SEU_USUARIO/gratidao-dashboard.git
git branch -M main

# Push
git push -u origin main
```

### Passo 3: Deploy no Vercel (1 clique)

1. Abrir: https://vercel.com/new
2. Conectar GitHub
3. Selecionar: `gratidao-dashboard`
4. Clicar: **Deploy**

**Pronto! Vercel fará o deploy automaticamente** 🎉

---

## 📝 Configurar Domínio (Após Deploy)

1. Abrir Vercel Dashboard
2. Projeto `gratidao-dashboard`
3. Settings → Domains
4. Adicionar: `gratidao.nexus-tecnolog.ia.br`
5. Copiar o **CNAME** que Vercel mostra
6. Ir no seu registrador DNS
7. Adicionar CNAME record com os dados que Vercel mostrou

---

## ✅ Validação Final

```
✓ Acessar: https://gratidao.nexus-tecnolog.ia.br
✓ Dashboard carrega em < 2s
✓ Botão "Nova Startup" funciona
✓ Lista de startups carrega do Supabase
✓ Cadeado verde no navegador (HTTPS)
```

---

## 📋 Tudo Já Está Pronto

- ✅ `index.html` - Dashboard bonito
- ✅ `vercel.json` - Config Vercel
- ✅ `package.json` - Metadados
- ✅ `.htaccess` - Apache config
- ✅ Git repository inicializado
- ✅ Documentação completa

**Você só precisa fazer:**
1. GitHub (criar repo + push)
2. Vercel (clicar Deploy)
3. DNS (apontar CNAME)

**Tempo total**: ~10 minutos 🚀
