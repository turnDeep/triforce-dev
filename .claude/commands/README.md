# Claude Code カスタムコマンド集

このディレクトリには、三位一体開発フレームワーク用のカスタムコマンドが含まれています。

## コマンド一覧

| コマンド | 説明 | 使用例 |
|---------|------|--------|
| `/project:review-with-gemini` | 現在の変更をGeminiでレビュー | 実装完了後に実行 |
| `/project:check-assumptions` | 実装前の前提条件を確認 | `/project:check-assumptions ユーザー認証機能の実装` |
| `/project:stuck-helper` | 行き詰まった時の解決支援 | `/project:stuck-helper TypeErrorが解決できない` |
| `/project:gemini-think` | 複雑な問題の深い分析 | `/project:gemini-think マイクロサービス分割の是非` |
| `/project:daily-standup` | 今日の作業優先順位を整理 | 朝一番に実行 |
| `/project:architecture-review` | プロジェクト構造の評価 | 定期的に実行 |
| `/project:test-strategy` | テスト戦略の立案 | `/project:test-strategy ユーザー認証コンポーネント` |

## 使い方

Claude Code内で以下のように実行：

```
/project:コマンド名 引数（必要な場合）
```

## カスタムコマンドの追加方法

1. このディレクトリに新しい`.md`ファイルを作成
2. ファイル名が`/project:ファイル名`としてコマンドになる
3. `$ARGUMENTS`で引数を受け取れる

### テンプレート

```markdown
# コマンドの説明

実行内容の詳細説明

\```bash
# 実際に実行されるコマンド
gemini -p "質問内容: $ARGUMENTS"
\```

引数: 引数の説明
例: /project:your-command 引数の例
```

## 注意事項

- Geminiへの質問は具体的に
- 実行結果はClaudeが解釈して実装に反映
- エラー時は`/project:stuck-helper`を活用