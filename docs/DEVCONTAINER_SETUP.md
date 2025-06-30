# Dev Containerセットアップガイド

このプロジェクトでは、開発環境の統一と再現性向上のため、VS Code Dev Containersをサポートしています。

## 必要なファイル構成

```
プロジェクトフォルダ/
├── .devcontainer/
│   ├── devcontainer.json
│   └── Dockerfile  (推奨)
└── ... (その他のプロジェクトファイル)
```

## 1. `.devcontainer/devcontainer.json`

基本的な設定ファイルです。

```json
{
  "name": "Triforce Dev Container",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "postCreateCommand": "npm install -g @anthropic-ai/claude-code @google/gemini-cli && make setup",
  "customizations": {
    "vscode": {
      "settings": {
        "terminal.integrated.defaultProfile.linux": "bash"
      },
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "GitHub.copilot"
      ]
    }
  },
  "remoteUser": "node",
  "features": {
    "ghcr.io/devcontainers/features/git:1": {},
    "ghcr.io/devcontainers/features/github-cli:1": {}
  }
}
```

**主な設定項目:**

- **`name`**: コンテナの名前
- **`build.dockerfile`**: 使用するDockerfileを指定
- **`postCreateCommand`**: コンテナ作成後に実行されるコマンド。CLIツールのインストールとプロジェクトのセットアップ（`make setup`）を行います。
- **`customizations.vscode.extensions`**: VS Code内で自動的にインストールされる拡張機能。
- **`remoteUser`**: コンテナ内で使用されるユーザー。
- **`features`**: 追加のDev Container Features。GitとGitHub CLIを有効にしています。

## 2. `.devcontainer/Dockerfile` (推奨)

より詳細な環境構築を行うためのDockerfileです。

```dockerfile
FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bookworm

# システムの依存関係をインストール (必要に応じて)
# RUN apt-get update && apt-get install -y \
#     #例: Python, build-essentialなど
#     && rm -rf /var/lib/apt/lists/*

# Node.jsのバージョンを固定 (必要に応じて)
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install 20 && nvm alias default 20"

# 作業ディレクトリ設定 (devcontainer.jsonで上書き可能)
# WORKDIR /workspace

# ユーザーをnodeに切り替え (devcontainer.jsonのremoteUserと合わせる)
USER node
```

**ポイント:**

- **`FROM`**: ベースとなるイメージ。Node.js 20の公式イメージを使用しています。
- **`RUN apt-get update ...`**: 必要に応じて、OSレベルのパッケージをインストールします。
- **`USER node`**: `remoteUser`と合わせておくことで、パーミッションの問題を回避しやすくなります。

## 3. 使用方法

1. **VS Codeでプロジェクトを開く**:
   - プロジェクトフォルダをVS Codeで開きます。
2. **Dev Containerで開く**:
   - 右下に表示される「Reopen in Container」の通知をクリックします。
   - または、コマンドパレット (Cmd/Ctrl+Shift+P) から「Dev Containers: Reopen in Container」を選択します。
3. **初回起動**:
   - Dockerイメージのビルドとコンテナの作成が開始されます。
   - `postCreateCommand`が実行され、必要なツールがインストールされます。
   - これには数分かかることがあります。
4. **開発開始**:
   - VS Codeのターミナルを開くと、コンテナ内のシェルが利用できます。
   - `claude`や`gemini`コマンドが使用可能になっているはずです。

## 4. 環境変数

APIキーなどの機密情報は、ローカルの`.env`ファイル（例: `.env.local`）に記述し、それをコンテナにマウントするか、Dev Containerの機能で設定します。

**`.devcontainer/devcontainer.json` での設定例:**

```json
  "remoteEnv": {
    "ANTHROPIC_API_KEY": "${localEnv:ANTHROPIC_API_KEY}",
    "GEMINI_API_KEY": "${localEnv:GEMINI_API_KEY}"
  }
```
この設定により、ローカルマシンの環境変数 `ANTHROPIC_API_KEY` と `GEMINI_API_KEY` がコンテナ内でも同じ名前の環境変数として利用可能になります。ローカルでこれらの環境変数を設定しておく必要があります。

## 5. トラブルシューティング

- **ビルドに失敗する場合**:
  - Dockerfileやdevcontainer.jsonの構文エラーを確認します。
  - `postCreateCommand`が正しく実行されているか、ログを確認します。
- **拡張機能がインストールされない場合**:
  - `customizations.vscode.extensions`のIDが正しいか確認します。
- **パーミッションエラー**:
  - `remoteUser`とDockerfile内の`USER`設定が適切か確認します。

詳細は、[公式Dev Containersドキュメント](https://containers.dev/)を参照してください。
