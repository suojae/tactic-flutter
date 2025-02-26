#!/bin/sh
echo "🔄 Setting up Git hooks for this project only..."

# 현재 프로젝트에만 Git Hooks 적용
cp -r .githooks/* .git/hooks/
chmod +x .git/hooks/*

echo "✅ Git hooks applied to this project only!"
