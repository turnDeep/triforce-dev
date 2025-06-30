WSL2 + Ubuntu + Docker Desktop + VS Code環境でtriforce-devをDev Containerで立ち上げる手順をご説明します。

## 🚀 セットアップ手順

### 1. 前提条件の確認

```bash
# WSL2でのDocker確認
docker --version
docker compose --version

# VS Codeが起動できることを確認
code --version
```

### 2. VS Code拡張機能のインストール

VS Codeで以下の拡張機能をインストール：

```
ms-vscode-remote.remote-containers
```

または、VS Code内で `Ctrl+Shift+X` → 「Dev Containers」で検索してインストール

### 3. プロジェクトの取得

```bash
# リポジトリをクローン（または GitHub でテンプレート使用）
git clone https://github.com/turnDeep/triforce-dev.git
cd triforce-dev

# VS Codeでプロジェクトを開く
code .
```

### 4. Dev Containerで開く

VS Codeでプロジェクトを開いた後：

**方法1: 通知から**
- 右下に表示される「Reopen in Container」をクリック

**方法2: コマンドパレットから**
- `Ctrl+Shift+P` → 「Dev Containers: Reopen in Container」を選択

**方法3: 左下のアイコンから**
- 左下の緑色のアイコン（><）をクリック → 「Reopen in Container」

### 5. 初回ビルド（自動実行）

Dev Containerが起動すると、以下が自動実行されます：

```bash
# これらが .devcontainer/devcontainer.json の postCreateCommand で実行される
npm install -g @anthropic-ai/claude-code @google/gemini-cli
make setup
```

**⏱️ 初回は数分かかります**

### 6. 認証設定

コンテナが起動したら、ターミナルで以下を実行：

```bash
# Claude Code認証
claude
# → ブラウザでAnthropicアカウントにログイン

# Gemini CLI認証  
gemini
# → Googleアカウントでログイン
```

### 7. 設定ファイルのカスタマイズ

```bash
# Claudeのメモリ設定（ユーザーディレクトリに作成）
cp memory.json.sample ~/.claude/memory.json
code ~/.claude/memory.json

# Gemini設定（ユーザーディレクトリに作成）
cp settings.json.sample ~/.gemini/settings.json  
code ~/.gemini/settings.json
```

### 8. 動作確認

```bash
# 基本コマンドの確認
claude --version
gemini --version

# プロジェクト固有のコマンド確認
make help

# 開発サーバー起動テスト（プロジェクトによって異なる）
make dev
```

## 🔧 プロジェクトのカスタマイズ

### 必須：行動規範ファイルの編集

プロジェクトに合わせて以下をカスタマイズ：

1. **`CLAUDE.md`** - Claude Codeの行動指針
2. **`GEMINI.md`** - Gemini CLIの行動指針  
3. **`package.json`** - プロジェクト固有のスクリプト

### カスタムコマンドの確認

```bash
# 利用可能なプロジェクトコマンド確認
ls -la .claude/commands/

# 例：行き詰まった時のヘルパー
/project:stuck-helper "TypeScriptのエラーが解決できない"

# 例：Geminiでコードレビュー
/project:review-with-gemini
```

## ⚠️ トラブルシューティング

### Docker関連エラー
```bash
# Docker Desktopが起動していることを確認
docker ps

# WSL2でのDocker統合確認
# Docker Desktop設定 → Resources → WSL Integration
```

### Dev Container ビルド失敗
- VS Code出力パネル → 「Dev Containers」でエラーログ確認
- `.devcontainer/devcontainer.json`の構文チェック

### 認証エラー
- ブラウザでログインプロセスを完了
- 必要に応じてAPIキー設定：
  ```bash
  echo "ANTHROPIC_API_KEY=your_key" >> ~/.bashrc
  echo "GEMINI_API_KEY=your_key" >> ~/.bashrc
  ```

## 🎯 次のステップ

1. **`CLAUDE.md`を現在のプロジェクトに合わせて編集**
2. **実際の開発タスクでClaude Codeを起動**：
   ```bash
   claude
   # → 「○○機能を実装したい」
   ```
3. **Geminiとの連携確認**：
   - Claudeが自動的にGeminiに相談することを確認

これで三位一体開発フレームワークの環境が整います！何か問題が発生した場合は、`docs/TROUBLESHOOTING.md`も参照してください。