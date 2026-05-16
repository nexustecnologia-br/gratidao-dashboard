# Deploy Privado - Apenas gratidao.nexus-tecnolog.ia.br
# Sem GitHub, sem Vercel, sem compartilhamento

$ErrorActionPreference = "Stop"

Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "DEPLOY PRIVADO - gratidao.nexus-tecnolog.ia.br" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Dados do servidor privado
$servidor = "64.29.17.65"
$usuario = Read-Host "Usuario SSH do servidor"
$porta = Read-Host "Porta SSH (padrao: 22)"
if (-not $porta) { $porta = 22 }
$caminho = Read-Host "Caminho do site no servidor (ex: /var/www/gratidao)"

Write-Host ""
Write-Host "[1/3] Preparando arquivos..." -ForegroundColor Yellow

# Copiar apenas public/ e config/
$arquivos_deploy = @(
    "public/index.html",
    "public/assets",
    "config/vercel.json",
    "config/.htaccess",
    "config/package.json"
)

Write-Host "[2/3] Conectando ao servidor SSH..." -ForegroundColor Yellow
Write-Host "   Servidor: $servidor" -ForegroundColor Gray
Write-Host "   Porta: $porta" -ForegroundColor Gray
Write-Host "   Usuario: $usuario" -ForegroundColor Gray
Write-Host "   Caminho: $caminho" -ForegroundColor Gray
Write-Host ""

# Usar SCP para fazer upload
Write-Host "[3/3] Enviando arquivos..." -ForegroundColor Yellow

# Se tiver OpenSSH
if (Get-Command scp -ErrorAction SilentlyContinue) {
    scp -P $porta -r "public\*" "$usuario@$servidor`:$caminho/"
    scp -P $porta "config\.htaccess" "$usuario@$servidor`:$caminho/.htaccess"
    Write-Host "   OK: Arquivos enviados" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  OpenSSH nao encontrado" -ForegroundColor Yellow
    Write-Host "   Instalando via Chocolatey..." -ForegroundColor Yellow
    choco install openssh -y
    Write-Host "   Reabra o PowerShell e tente novamente" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "DEPLOY CONCLUIDO!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "Dashboard em: https://gratidao.nexus-tecnolog.ia.br" -ForegroundColor Yellow
Write-Host ""
