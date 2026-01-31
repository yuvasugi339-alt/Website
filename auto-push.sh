#!/bin/bash

# Auto-push script for Git repository
# This script watches for changes and automatically commits and pushes

REPO_DIR="/workspaces/Website"
SLEEP_INTERVAL=5

echo "🚀 Auto-push started for $REPO_DIR"
echo "Watching for changes every $SLEEP_INTERVAL seconds..."
echo ""

cd "$REPO_DIR" || exit 1

while true; do
  # Check if there are any uncommitted changes (staged or unstaged)
  if ! git diff-index --quiet HEAD --; then
    echo "📝 Changes detected at $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Stage all changes
    git add -A
    
    # Create a commit message with timestamp
    COMMIT_MSG="Auto-push: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Commit changes
    if git commit -m "$COMMIT_MSG"; then
      echo "✅ Committed: $COMMIT_MSG"
      
      # Push to remote
      if git push; then
        echo "🎯 Successfully pushed to remote"
      else
        echo "❌ Failed to push to remote"
      fi
    fi
  elif [ -n "$(git status --porcelain)" ]; then
    # Check for untracked files
    echo "📝 Untracked files detected at $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Stage all changes including untracked
    git add -A
    
    # Create a commit message with timestamp
    COMMIT_MSG="Auto-push: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Commit changes
    if git commit -m "$COMMIT_MSG"; then
      echo "✅ Committed: $COMMIT_MSG"
      
      # Push to remote
      if git push; then
        echo "🎯 Successfully pushed to remote"
      else
        echo "❌ Failed to push to remote"
      fi
    fi
  fi
  
  sleep "$SLEEP_INTERVAL"
done
