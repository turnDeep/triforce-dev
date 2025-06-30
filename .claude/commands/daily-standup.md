```markdown
# デイリースタンドアップ

今日の作業を開始する前に、優先順位を整理します。

```bash
# 最近のコミットを確認
RECENT_COMMITS=$(git log --oneline -5)

# TODOコメントを抽出
TODOS=$(grep -r "TODO" --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" . | head -10)

gemini -p "以下の情報を基に、今日の作業優先順位を提案してください：

最近のコミット：
$RECENT_COMMITS

残っているTODO：
$TODOS

観点：
1. ビジネス影響度
2. 技術的依存関係
3. 実装の難易度
4. 他のタスクへのブロッカー"
