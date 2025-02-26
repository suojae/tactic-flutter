#!/bin/sh
echo "🛠 Restoring default Git hooks for this project..."

rm -rf .git/hooks
mkdir -p .git/hooks

echo "✅ Git hooks have been restored to default in this project."
