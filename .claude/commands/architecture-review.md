```markdown
# アーキテクチャレビュー

現在のプロジェクト構造をレビューし、改善点を提案します。

```bash
# ディレクトリ構造を取得
STRUCTURE=$(find . -type d -name "node_modules" -prune -o -type d -print | grep -v node_modules | sort)

# 主要な依存関係を確認
DEPS=$(cat package.json | jq '.dependencies')

gemini -p "以下のプロジェクト構造をレビューしてください：

ディレクトリ構造：
$STRUCTURE

依存関係：
$DEPS

評価観点：
1. スケーラビリティ
2. 保守性
3. テスタビリティ
4. パフォーマンス
5. セキュリティ"
