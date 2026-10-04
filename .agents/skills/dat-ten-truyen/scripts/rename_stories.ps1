# Script hỗ trợ đổi tên file truyện cười có Emoji và Tiếng Việt có dấu viết hoa từng từ
param (
    [string]$TargetFolder = "c:\truyen-cuoi",
    [switch]$Execute = $false
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$excludedFiles = @("README.md", "LAM.md", "Nhân.md")
$excludedDirs = @(".git", ".obsidian", ".agents", ".agent")

$files = Get-ChildItem -Path $TargetFolder -Filter *.md -Recurse | Where-Object {
    $fullName = $_.FullName
    $skip = $false
    foreach ($dir in $excludedDirs) {
        if ($fullName -match "[\\/]$([regex]::Escape($dir))[\\/]") {
            $skip = $true
            break
        }
    }
    if ($excludedFiles -contains $_.Name) {
        $skip = $true
    }
    -not $skip
}

Write-Output "Tìm thấy $($files.Count) file truyện markdown cần kiểm tra."
Write-Output "Chế độ chạy: $(if ($Execute) { 'THỰC THI (Execute)' } else { 'XEM TRƯỚC (Dry Run)' })"
