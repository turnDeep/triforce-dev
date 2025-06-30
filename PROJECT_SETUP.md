# 三位一体開発環境セットアップガイド

このプロジェクトは、Claude Code、Gemini CLI、人間の開発者による三位一体開発手法を採用しています。

## セットアップ手順

### 1. 必要なツールのインストール

```bash
# Node.js 18以上が必要
node --version

# Claude Codeのインストール
npm install -g @anthropic-ai/claude-code

# Gemini CLIのインストール
npm install -g @google/gemini-cli
```

### 2. 初回認証

```bash
# Claude Code
claude
# ブラウザでAnthropicアカウントにログイン

# Gemini CLI
gemini
# Googleアカウントでログイン（無料枠: 60req/分、1000req/日）
```

### 3. プロジェクト設定

```bash
# Claudeのメモリを初期化
claude
# /memory コマンドで設定ファイルを開き、プロジェクト固有の情報を追加

# カスタムコマンドのセットアップ
mkdir -p .claude/commands
# .claude/commands/ に提供されたコマンドファイルをコピー
```

### 4. 環境変数の設定（オプション）

```bash
# .env.local または .env を作成
echo "ANTHROPIC_API_KEY=your_key_here" >> .env.local
echo "GEMINI_API_KEY=your_key_here" >> .env.local

# Geminiのサンドボックスモード（推奨）
echo "export GEMINI_SANDBOX=true" >> ~/.bashrc
```

## 開発フロー

### 新機能の開発

1. **要件確認**
   ```bash
   claude
   > 新機能○○を実装したいです
   # Claudeが自動的にGeminiに相談
   ```

2. **実装**
   ```bash
   # Claudeが計画を立て、Geminiでレビュー後に実装
   ```

3. **レビュー**
   ```bash
   /project:review-with-gemini
   ```

### デバッグ

1. **エラー発生時**
   ```bash
   /project:stuck-helper エラーの説明
   ```

2. **複雑な問題**
   ```bash
   /project:gemini-think 問題の詳細
   ```

## チーム開発での注意事項

- `CLAUDE.md`と`GEMINI.md`は全員で共有
- 個人設定は`~/.claude/`と`~/.gemini/`に保存
- プロジェクト固有の設定は必ずコミット

## トラブルシューティング

### Claude Codeが応答しない
```bash
# コンテキストをリセット
/clear
```

### Geminiのレート制限
- 無料枠を超えた場合はAPIキーの使用を検討
- または時間を置いて再試行

### 連携がうまくいかない
- 両ツールが最新バージョンか確認
- `CLAUDE.md`の設定を再確認
```
