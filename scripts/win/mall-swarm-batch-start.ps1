# 定义日志目录
$logDir = "F:\service_logs" 

# 检查目录是否存在,不存在则创建
if (!(Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Force -Path $logDir
}

# Nacos日志文件
$nacosStdLog = Join-Path -Path $logDir -ChildPath "nacosStdLog.log"
$nacosErrLog = Join-Path -Path $logDir -ChildPath "nacosErrLog.log"

# 启动Nacos
$nacosProcess = Get-Process -Name nacos*  
if (-not $nacosProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\nacos\bin\startup.cmd' -ArgumentList '-m standalone' -RedirectStandardOutput $nacosStdLog -RedirectStandardError $nacosErrLog -PassThru
  

  Write-Host "Nacos started - http://localhost:8848/nacos" 
} else {
  Write-Host "Nacos already running - http://localhost:8848/nacos"
}
Write-Host "============="

# Redis日志文件 
$redisStdLog = Join-Path -Path $logDir -ChildPath "redisStd.log"
$redisErrLog = Join-Path -Path $logDir -ChildPath "redisErr.log"

# 启动Redis
$redisProcess = Get-Process -Name redis*
if (-not $redisProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\Redis-x64-5.0.14.1\redis-server.exe' -ArgumentList 'F:\develop\Env\Redis-x64-5.0.14.1\redis.windows.conf' -RedirectStandardOutput $redisStdLog -RedirectStandardError $redisErrLog


  Write-Host "Redis started"
} else {
  Write-Host "Redis already running"
}  
Write-Host "============="

# ES日志文件 
$esStdLog = Join-Path -Path $logDir -ChildPath "esStd.log"
$esErrLog = Join-Path -Path $logDir -ChildPath "esErr.log"

# 启动ES
$esProcess = Get-Process -Name elasticsearch*
if (-not $esProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\elasticsearch-7.17.3\bin\elasticsearch.bat' -RedirectStandardOutput $esStdLog -RedirectStandardError $esErrLog


  Write-Host "ES started"
} else {
  Write-Host "ES already running"
} 
Write-Host "============="

# Kibana日志文件 
$kibanaStdLog = Join-Path -Path $logDir -ChildPath "kibanaStd.log"
$kibanaErrLog = Join-Path -Path $logDir -ChildPath "kibanaErr.log"

# 启动Kibana
$kibanaProcess = Get-Process -Name kibana*
if (-not $kibanaProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\kibana-7.17.3-windows-x86_64\bin\kibana.bat' -RedirectStandardOutput $kibanaStdLog -RedirectStandardError $kibanaErrLog

  Write-Host "kibana started - http://localhost:5601"
} else {
  Write-Host "kibana already running - http://localhost:5601"
} 
Write-Host "============="

# logStash日志文件 
$logStashStdLog = Join-Path -Path $logDir -ChildPath "logStashStd.log"
$logStashErrLog = Join-Path -Path $logDir -ChildPath "logStashErr.log"

# 启动logStash
$logStashProcess = Get-Process -Name logStash*
if (-not $logStashProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\logstash-7.17.3\bin\logstash.bat' -ArgumentList '-f logstash.conf' -RedirectStandardOutput $logStashStdLog -RedirectStandardError $logStashErrLog

  Write-Host "logStash started"
} else {
  Write-Host "logStash already running"
} 
Write-Host "============="

# mongo日志文件 
$mongoStdLog = Join-Path -Path $logDir -ChildPath "mongoStd.log"
$mongoErrLog = Join-Path -Path $logDir -ChildPath "mongoErr.log"

# 启动mongo
$mongoProcess = Get-Process -Name mongod*
if (-not $mongoProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\MongoDB\bin\mongod.exe' -RedirectStandardOutput $mongoStdLog -RedirectStandardError $mongoErrLog


  Write-Host "mongo started"
} else {
  Write-Host "mongo already running"
} 
Write-Host "============="

# rabbitmq日志文件 
$rabbitmqStdLog = Join-Path -Path $logDir -ChildPath "rabbitmqStd.log"
$rabbitmqErrLog = Join-Path -Path $logDir -ChildPath "rabbitmqErr.log"

# 启动rabbitmq
$rabbitmqProcess = Get-Process -Name rabbitmq*
if (-not $rabbitmqProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\RabbitMQ Server\rabbitmq_server-3.10.5\sbin\rabbitmq-plugins' -ArgumentList 'enable rabbitmq_management' -RedirectStandardOutput $rabbitmqStdLog -RedirectStandardError $rabbitmqErrLog


  Write-Host "rabbitmq started - http://localhost:15672/ guest:guest"
} else {
  Write-Host "rabbitmq already running - http://localhost:15672/ guest:guest"
} 
Write-Host "============="

# minio日志文件 
$minioStdLog = Join-Path -Path $logDir -ChildPath "minioStd.log"
$minioErrLog = Join-Path -Path $logDir -ChildPath "minioErr.log"

# 启动minio
$minioProcess = Get-Process -Name minio*
if (-not $minioProcess) {
  $null = Start-Process -FilePath 'F:\develop\Env\minio\minio.exe' -ArgumentList 'server D:\developer\env\minio\data --console-address ":9001"' -RedirectStandardOutput $minioStdLog -RedirectStandardError $minioErrLog


  Write-Host "minio started - http://localhost:9001 minioadmin:minioadmin"
} else {
  Write-Host "minio already running - http://localhost:9001 minioadmin:minioadmin"
} 
# 其他服务启动逻辑

# 循环打印日志
# Get-Content $nacosStdLog -Wait -Tail 10 | Write-Output 
# Get-Content $nacosErrLog -Wait -Tail 10 | Write-Output

# Get-Content $redisStdLog -Wait -Tail 10 | Write-Output 
# Get-Content $redisErrLog -Wait -Tail 10 | Write-Output