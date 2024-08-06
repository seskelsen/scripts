#-------------------------------
#  ESKEL SECURITY - PING SWEEP
#-------------------------------

#param($p1)
$p1 = "192.168.5"

if (!$p1)
{
    echo "Eskel Security"    echo "Exemplo de uso: ./script.ps1 192.168.0."
}
else
{
    echo "Varrendo a rede: $p1"
    foreach ($ip in 0..254)
    {
        try{
        $resp = ping -n 1 "$p1.$ip" | Select-String "bytes=32"  
        $resp.Line.Split(" ")[2] -replace ":",""
        }
        catch{}
    }
    
}