#!/bin/bash
set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Usage: bash $0 <log file path>"
    exit 1
fi

LOG_PATH="$1"

if [ ! -f "$LOG_PATH" ]; then
    echo "Error: Log file $LOG_PATH does not exist."
    exit 1
fi

DATE=$(date +%Y-%m-%d)
REPORT="log_report_${DATE}.txt"

ERROR_COUNT=$(grep -E -c "ERROR|Failed" "$LOG_PATH" || true)
echo "Total Error Count: $ERROR_COUNT"

CRITICAL_EVENTS=$(grep -n "CRITICAL" "$LOG_PATH" || true)

echo "--- Critical Events ---"
if [ -n "$CRITICAL_EVENTS" ]; then
    echo "$CRITICAL_EVENTS"
else
    echo "No critical events found."
fi

echo "--- Top 5 Error Messages ---"
TOP_ERRORS=$(grep "ERROR" "$LOG_PATH" | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5)
if [ -n "$TOP_ERRORS" ]; then
    echo "$TOP_ERRORS"
else
    echo "No error messages found."
fi

TOTAL_LINES=$(wc -l < "$LOG_PATH")

{
    echo "Log Analysis Report - $DATE"
    echo "Log File: $LOG_PATH"
    echo "Total Lines Processed: $TOTAL_LINES"
    echo "Total Error Count: $ERROR_COUNT"
    echo ""
    echo "--- Top 5 Error Messages ---"
    echo "$TOP_ERRORS"
    echo ""
    echo "--- Critical Events ---"
    echo "$CRITICAL_EVENTS"
} > "$REPORT"

echo "Summary report generated: $REPORT"

ARCHIVE_DIR="archive"
mkdir -p "$ARCHIVE_DIR"
mv "$LOG_PATH" "$ARCHIVE_DIR"/
echo "Log file archived to $ARCHIVE_DIR/"
