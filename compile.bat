@echo off
cls

echo Kompilacja kernel.c...
i686-elf-gcc -ffreestanding -O2 -c kernel.c -o kernel.o
if errorlevel 1 (
    echo ***
    echo Blad podczas kompilacji kernel.c!
    echo ***
    pause
    exit /b 1
)

echo Kompilacja boot.S...
i686-elf-gcc -ffreestanding -O2 -c boot.S -o boot.o
if errorlevel 1 (
    echo ***
    echo Blad podczas kompilacji boot.S!
    echo ***
    pause
    exit /b 1
)

echo Linkowanie kernel.elf...
i686-elf-ld -Ttext 0x1000 -o kernel.elf --oformat elf32-i386 boot.o kernel.o
if errorlevel 1 (
    echo ***
    echo Blad podczas linkowania!
    echo ***
    pause
    exit /b 1
)

echo Wszystko git, kernel.elf gotowy!
pause