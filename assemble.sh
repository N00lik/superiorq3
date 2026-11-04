#!/usr/bin/env bash
set -e

cd ~/superiorq3
touch code/game/*.c code/game/*.h

if cmake --build build; then
    echo "✅ Сборка завершена: build/Release/"
else
    echo "❌ Сборка упала — смотри вывод выше"
fi

read -rp "Нажми Enter, чтобы выйти..."

# ─── Быстрая сборка (без touch, параллельно) ───────────────────────
# Раскомментируй, если нужна скорость, а не гарантия пересборки:
#
# cd ~/superiorq3
# cmake --build build -j"$(nproc)"
# echo "✅ Быстрая сборка завершена"
# ───────────────────────────────────────────────────────────────────
