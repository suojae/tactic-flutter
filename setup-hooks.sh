#!/bin/sh
echo "🔄 Setting up Git hooks..."
cp -r .githooks/* .git/hooks/
chmod +x .git/hooks/*
