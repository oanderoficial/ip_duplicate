# Obter uma lista de todas as impressoras instaladas
$impressoras = Get-Printer | Select-Object -Property Name, PortName
 
# Contar a frequência de cada endereço IP
$frequenciaIPs = $impressoras | Group-Object -Property PortName | Where-Object { $_.Count -gt 1 }
 
# Exibir as impressoras com endereços IP duplicados
if ($frequenciaIPs) {
    Write-Host "Impressoras com IPs duplicados:"
    $frequenciaIPs | ForEach-Object {
        $_.Group | ForEach-Object {
            "Nome da Impressora: $($_.Name), IP: $(Get-PrinterPort -Name $_.PortName).PrinterHostAddress"
        }
    }
} else {
    Write-Host "Não há IPs de impressoras duplicados."
}
