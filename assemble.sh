#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
touch code/game/*.c code/game/*.h

if cmake --build build; then
    echo "✅ Сборка завершена: build/Release/"

    # Копирование свежих QVM в папку мода
    mkdir -p build/Release/superiorq3/vm
    cp -v build/Release/baseq3/vm/*.qvm build/Release/superiorq3/vm/

    # Копирование конфига из корня репозитория в папку мода
    cp -v autoexec.cfg build/Release/superiorq3/autoexec.cfg

    echo "✅ QVM и autoexec.cfg скопированы в build/Release/superiorq3/"
else
    echo "❌ Сборка упала — смотри вывод выше"
fi

read -rp "Нажми Enter, чтобы выйти..."
