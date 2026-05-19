function Generate-LuaIndex {
    param (
        [string]$SourceDir,
        [string]$OutFile
    )

    if (-not (Test-Path $SourceDir)) {
        Write-Host "Skipping missing directory: $SourceDir"
        return
    }

    $files = Get-ChildItem -Path $SourceDir -Filter "*.lua" -File -Recurse |
        Sort-Object FullName

    $lines = @()
    $lines += "return {"

    foreach ($file in $files) {
        $relativePath = $file.FullName.Substring((Resolve-Path $SourceDir).Path.Length + 1)
        $luaPath = "$SourceDir/" + ($relativePath -replace '\\', '/' -replace '\.lua$', '')
        $lines += "    `"$luaPath`","
    }

    $lines += "}"

    $lines -join "`n" | Set-Content -Encoding UTF8 $OutFile
    Write-Host "Generated $OutFile"
}

# script location
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

Generate-LuaIndex "ItemPacks" "ImportItemsFiles.lua"
Generate-LuaIndex "ContainerPacks" "ImportContainerFiles.lua"
