Function Prompt {
    Write-Host ""

    $ARR = @()

    $MAP = @{
        "Cargo.toml" = "🦀"
        "deno.json" = "🦕"
        "deno.jsonc" = "🦕"
        "gleam.toml" = "✨"
        "go.mod" = "🐹"
        "shard.yaml" = '🔮'
        "shard.yml" = '🔮'
        "package.json" = '📦'
        # Language by @TheNachoBIT
        "Nucleus.toml" = '☢️'
    }
    
    ForEach ($KEY in $MAP.Keys) {
        If (Test-Path "./$KEY") {
            $ARR += $MAP[$KEY]
        }
    }

    $ARR = $ARR | Select-Object -Unique

    $LANGS = ""

    if($ARR.Count -gt 0) {
        $LANGS += "via "

        if($ARR.Count -eq 1) {
            $LANGS += $ARR
        }

        if($ARR.Count -eq 2) {
            $LANGS += $ARR[0] + " & " + $ARR[1]
        }

        if($ARR.Count -eq 3) {
            $LANGS += $ARR[0] + " , " + $ARR[1] + " & " + $ARR[2]
        }
    } 

    Write-Host "LePichu@Toaster " -NoNewLine -ForegroundColor DarkCyan
    Write-Host $LANGS 
    Write-Host "$>" -NoNewline -ForegroundColor Blue

    " " 
}