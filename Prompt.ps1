$global:COLDBOOT = $true

Function Prompt {
    if($global:COLDBOOT -eq $false) {
	    Write-Host " "
    }
    
    if($global:COLDBOOT) {
	    $global:COLDBOOT = $false	
    }

    $ARR = @()

    $MAP = [Ordered]@{
        "Cargo.toml" = "🦀"
        "CMakeLists.txt" = "🔺"

        "deno.json" = "🦕"
        "deno.jsonc" = "🦕"
        
        "gleam.toml" = "✨"
        "mix.exs" = '🩸'
        "rebar.config" = '☎'

        "pubspec.yaml" = '🎯'
        "pubspec.yml" = '🎯'

        "$(Split-Path -Leaf (Get-Location)).fsproj" = '🤖'
        "$(Split-Path -Leaf (Get-Location)).csproj" = '🤖'

        "go.mod" = "🐹"
        "pyproject.toml" = "🐍"

        "shard.yaml" = '🔮'
        "shard.yml" = '🔮'
        "Gemfile" = '💎'
        
        "package.json" = '📦'
        "yarn.lock" = '📦'

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
        $LANGS += " via "

        if($ARR.Count -eq 1) {
            $LANGS += $ARR
        }

        if($ARR.Count -eq 2) {
            $LANGS += $ARR[0] + " & " + $ARR[1]
        }

        if($ARR.Count -eq 3) {
            $LANGS += $ARR[0] + ", " + $ARR[1] + " & " + $ARR[2]
        }
    } 

    Write-Host "$Env:USERNAME " -NoNewLine -ForegroundColor DarkCyan
    Write-Host "in " -NoNewLine 
    Write-Host "$(Split-Path -Leaf (Get-Location))" -NoNewLine -ForegroundColor Blue
    Write-Host $LANGS 
    Write-Host "$>" -NoNewline -ForegroundColor Blue

    " " 
}

# Overwrite Clear function to make sure it doesn't leave an extra space for prompt
# clear-host is 6x slower than /bin/clear on my phone so this is why I do this
Function clear {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSProvideCommentHelp", "", Justification="/bin/clear is faster than Clear-Host")]
    $global:COLDBOOT = $true
    if($IsLinux) {
        & ("/bin/clear")
    } else {
        Clear-Host
    }
}