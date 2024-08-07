$site = Read-Host "Digie o site: "
$web = Invoke-WebRequest -Uri "$site" -Method Options
echo "O servidor roda: "
$web.headers.server
echo ""
echo "O servidor aceita os metodos: "
$web.headers.allow
$web2 = Invoke-WebRequest -Uri "$site" 
Echo "Links encontrados:"
$web2.links.href | Select-String "http://"