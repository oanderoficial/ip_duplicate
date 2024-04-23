# Obter uma lista de todas as impressoras instaladas
$impressoras = Get-Printer | Select-Object -Property Name, PortName
 
# Contar a frequ�ncia de cada endere�o IP
$frequenciaIPs = $impressoras | Group-Object -Property PortName | Where-Object { $_.Count -gt 1 }
 
# Exibir as impressoras com endere�os IP duplicados
if ($frequenciaIPs) {
    Write-Host "Impressoras com IPs duplicados:"
    $frequenciaIPs | ForEach-Object {
        $_.Group | ForEach-Object {
            "Nome da Impressora: $($_.Name), IP: $(Get-PrinterPort -Name $_.PortName).PrinterHostAddress"
        }
    }
} else {
    Write-Host "N�o h� IPs de impressoras duplicados."
}
