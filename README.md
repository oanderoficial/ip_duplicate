<h1>IP-DUPLICATE</h1>
<h2> Script para verificar IP'S em duplicidade em filas de impressão </h2>

``` powershell
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
````

<strong> cmdlet Get-Printer </strong> 

<strong> Documentação: </strong> https://learn.microsoft.com/en-us/powershell/module/printmanagement/get-printer?view=windowsserver2022-ps

<p>Recupera uma lista de impressoras instaladas em um computador.</p>

<strong> Sintaxe </strong> 

```ps1
Get-Printer
   [[-Name] <String[]>]
   [-ComputerName <String>]
   [-Full]
   [-CimSession <CimSession[]>]
   [-ThrottleLimit <Int32>]
   [-AsJob]
   [<CommonParameters>]
```

<strong> Obtenha uma lista de impressoras </strong> 

```ps1
Get-Printer
```
<strong> Obtenha as informações de uma impressora específica: </strong> 

```ps1
Get-Printer -Name "Microsoft XPS Document Writer"
```
<strong> Obtenha informações detalhadas para uma impressora específica: </strong> 

```ps1
Get-Printer -Name "Microsoft XPS Document Writer" | Format-List
```



