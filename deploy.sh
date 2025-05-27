#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define a default commit message
COMMIT_MESSAGE="Update site content and deploy"

# Check if a custom commit message is provided
if [ -n "$1" ]; then
  COMMIT_MESSAGE="$1"
fi

echo "Adding changes to git..."
git add .

echo "Committing changes with message: '$COMMIT_MESSAGE'"
# Allow empty commits if there are no changes to the source files but we still want to trigger a build/deploy
git commit -m "$COMMIT_MESSAGE" --allow-empty || echo "No changes to commit to main branch, or commit failed. Proceeding with deployment."

echo "Pushing changes to main branch..."
git push origin master # Or your default branch name e.g., master

echo "Building and deploying to GitHub Pages..."
mkdocs gh-deploy --force # --force can be useful if the gh-pages branch has diverged

echo "Deployment complete. Your site should be updated shortly."
