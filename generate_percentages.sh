#!/usr/bin/env bash

CSV_FILE="${1:-../clean_dialog.csv}"
TOTAL_LINES=36859

echo "pony_name,total_line_count,percent_all_lines" > Line_percentages.csv

PONIES=("Twilight Sparkle" "Rarity" "Pinkie Pie" "Rainbow Dash" "Fluttershy")

for pony in "${PONIES[@]}"; do
    COUNT=$(grep -c '","'"$pony"'",' "$CSV_FILE")
    PERCENT=$(awk -v c="$COUNT" -v t="$TOTAL_LINES" 'BEGIN { printf "%.2f%%", (c / t) * 100 }')
    echo "$pony,$COUNT,$PERCENT" >> Line_percentages.csv
done
