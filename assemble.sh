#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
touch code/game/*.c code/game/*.h

if cmake --build build; then
    echo "✅ Сборка завершена: build/Release/"

    # Копирование свежих QVM в папку мода
    mkdir -p build/Release/superiorq3/vm
    cp -v build/Release/baseq3/vm/*.qvm build/Release/superiorq3/vm/
    echo "✅ QVM скопированы в build/Release/superiorq3/vm/"
else
    echo "❌ Сборка упала — смотри вывод выше"
fi

read -rp "Нажми Enter, чтобы выйти..."

# ─── Быстрая сборка (без touch, параллельно) ───────────────────────
# Раскомментируй, если нужна скорость, а не гарантия пересборки:
#
# cd "$(dirname "$0")"
# cmake --build build -j"$(nproc)"
# echo "✅ Быстрая сборка завершена"