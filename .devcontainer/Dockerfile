FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bookworm

# 追加の依存関係をインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# グローバルnpmパッケージのインストールは
# postCreateCommandで行うため、ここでは行わない
