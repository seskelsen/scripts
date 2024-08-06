param($ip)

if (!$ip)
{
    echo "ESKEL SECURITY - PORTSCAN"
    echo "Modo de uso: ./portscan.ps1 192.168.5.1"    
}
else
{
    $topports = 21,22,3306,80,443
    try{
        foreach ($porta in $topports)
        {
            if(Test-NetConnection $ip -Port $porta -WarningAction SilentlyContinue -InformationLevel Quiet)
            {
                echo "Porta: $porta -> Aberta"
            }
        }
        
    }catch{} 
}