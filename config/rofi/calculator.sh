#!/bin/bash
# Rofi Calculator Script using bc and wl-copy

if [ -z "$1" ]; then
    echo "🧮 Matematiksel bir ifade yazın (örnek: 25 * 4, 2^8, sqrt(144))..."
else
    # Clean expression
    expr=$(echo "$1" | sed 's/x/*/g' | sed 's/÷/\//g')
    result=$(echo "scale=4; $expr" | bc -l 2>/dev/null)
    
    if [ -n "$result" ]; then
        # Trim trailing zeros if decimal
        clean_result=$(echo "$result" | sed '/\./ s/\.\{0,1\}0\{1,\}$//')
        echo "Sonuç: $clean_result"
        echo -n "$clean_result" | wl-copy 2>/dev/null || true
    else
        echo "❌ Geçersiz İfade"
    fi
fi
