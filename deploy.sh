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

echo "Committing changes to master branch with message: '$COMMIT_MESSAGE'"
# Allow empty commits if there are no changes to the source files but we still want to trigger a build/deploy
# This commits your source files (e.g., Markdown, mkdocs.yml).
git commit -m "$COMMIT_MESSAGE" --allow-empty || echo "No changes to commit to master branch, or commit failed. Proceeding."

echo "Pushing changes to remote master branch..."
git push origin master

echo "Building and deploying to GitHub Pages..."
# This command builds the site and commits the *built files* to the 'gh-pages' branch, then pushes 'gh-pages'.
# Ensure your build output directory (e.g., 'site/') is in your .gitignore file for the master branch.
mkdocs gh-deploy --force

echo "Deployment complete. The site should be updated shortly."
