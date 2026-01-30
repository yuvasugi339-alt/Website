#!/bin/bash

# Auto-push script - watches for changes and commits/pushes automatically

cd /workspaces/Website || exit

echo "=========================================="
echo "🚀 Auto-push monitor started..."
echo "📁 Directory: $(pwd)"
echo "Watching for file changes..."
echo "Press Ctrl+C to stop"
echo "=========================================="

while true; do
  # Check for unstaged changes
  STATUS=$(git status --porcelain 2>/dev/null)
  
  if [ -n "$STATUS" ]; then
    echo ""
    echo "📝 Changes detected at $(date '+%Y-%m-%d %H:%M:%S')"
    echo "$STATUS"
    
    # Stage all changes
    echo "⏳ Staging changes..."
    git add -A
    
    # Commit with timestamp
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    echo "💾 Committing..."
    git commit -m "Auto-update: $TIMESTAMP" 2>/dev/null
    
    # Push to remote
    echo "🚀 Pushing to GitHub..."
    if git push 2>/dev/null; then
      echo "✅ Successfully pushed!"
    else
      echo "❌ Push failed"
    fi
    echo "=========================================="
  fi
  
  # Check every 3 seconds
  sleep 3
done
