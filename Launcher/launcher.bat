@echo off
setlocal enabledelayedexpansion
echo ===================================
echo    Repository Launcher Java v1.2
echo ===================================
echo made by : hexal

if not exist "MisProgramas" mkdir "MisProgramas"

for /f "tokens=1,2 delims==" %%a in (programas.txt) do (
    echo Procesando: %%a

    for /f %%x in ('powershell -NoProfile -Command "if ('%%b' -match '\.zip$') {Write-Output ZIP} elseif ('%%b' -match '\.jar$') {Write-Output JAR} else {Write-Output ERROR}"') do set tipo=%%x


    if "!tipo!"=="ZIP" (
        echo Descargando y descomprimiendo ZIP...
        powershell -Command "Invoke-WebRequest -Uri '%%b' -OutFile 'temp.zip'; Expand-Archive -Path 'temp.zip' -DestinationPath 'MisProgramas\%%a' -Force; Remove-Item 'temp.zip'"
        echo ZIP descomprimido en: MisProgramas\%%a
        
        echo Buscando JAR dentro del ZIP...
        set jar_encontrado=0
        for /f "delims=" %%f in ('dir "MisProgramas\%%a\*.jar" /b /s 2^>nul') do (
            if !jar_encontrado! equ 0 (
                echo JAR encontrado: %%f
                echo Ejecutando...
                java -jar "%%f"
                set jar_encontrado=1
            )
        )
        if !jar_encontrado! equ 0 (
          echo No se encontro ningun archivo JAR dentro del ZIP, no se puede ejecutar
        )
    ) else if "!tipo!"=="JAR" (
        echo Descargando JAR...
        powershell -Command "Invoke-WebRequest -Uri '%%b' -OutFile 'MisProgramas\%%a.jar'"
        echo Ejecutando JAR...
        java -jar "MisProgramas\%%a.jar"
    ) else (
        echo XX-------------------------------XX
        echo    Tipo de extension incorrecta:
        echo    %%b
        echo XX-------------------------------XX
    )
    echo.
)

pause
