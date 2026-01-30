#!/bin/bash

# Auto-push script - watches for changes and commits/pushes automatically

cd /workspaces/Website

echo "🚀 Auto-push monitor started..."
echo "Watching for file changes in the repository..."

while true; do
  # Check if there are unstaged changes
  if ! git diff-index --quiet HEAD --; then
    echo "📝 Changes detected at $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Stage all changes
    git add -A
    
    # Commit with timestamp
    git commit -m "Auto-update: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Push to remote
    git push
    
    echo "✅ Changes pushed successfully"
    echo "---"
  fi
  
  # Check every 5 seconds
  sleep 5
done
