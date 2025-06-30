# Geminiによるコードレビュー

現在の変更内容をGeminiにレビューしてもらいます。

実行手順：
1. 現在の変更内容を`git diff`で確認
2. 以下の観点でGeminiに質問：
   - セキュリティの問題はないか
   - パフォーマンスの改善点
   - コードの可読性
   - ベストプラクティスとの乖離

```bash
git diff --cached > /tmp/changes.diff
gemini -p "以下の変更内容をレビューしてください。セキュリティ、パフォーマンス、可読性の観点から改善点を指摘してください: $(cat /tmp/changes.diff)"
