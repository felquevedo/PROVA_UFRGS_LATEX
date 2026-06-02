@echo off
setlocal

set "INKSCAPE=C:\Program Files\Inkscape\bin\inkscape.exe"

for %%f in (*.svg) do (
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$svg='%%f'; $pdf='%%~nf.pdf';" ^
    "if (!(Test-Path $pdf) -or ((Get-Item $svg).LastWriteTime -gt (Get-Item $pdf).LastWriteTime)) {" ^
    "  Write-Host 'Convertendo' $svg 'para' $pdf;" ^
    "  & '%INKSCAPE%' $svg '--export-filename' $pdf" ^
    "} else {" ^
    "  Write-Host 'Atualizado:' $pdf" ^
    "}"
)

endlocal
pause