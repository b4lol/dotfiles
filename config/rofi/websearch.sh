#!/bin/bash
# Rofi Web Search Script

if [ -z "$1" ]; then
    echo "🔍 Google'da Ara..."
    echo "🦆 DuckDuckGo'da Ara..."
    echo "▶ YouTube'da Ara..."
    echo "🌐 Wikipedia'da Ara..."
else
    query="$1"
    
    if [[ "$query" == "🔍 Google"* ]] || [[ "$query" == "🦆 Duck"* ]] || [[ "$query" == "▶ YouTube"* ]] || [[ "$query" == "🌐 Wiki"* ]]; then
        echo "Aramak istediğiniz kelimeyi yazıp Enter'a basın..."
        exit 0
    fi

    encoded_query=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" "$query" 2>/dev/null || echo "$query")
    url="https://www.google.com/search?q=$encoded_query"
    
    xdg-open "$url" >/dev/null 2>&1 &
fi
