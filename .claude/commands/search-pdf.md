```markdown
# PDF検索コマンド

PDFディレクトリ内のドキュメントを検索し、Geminiに分析してもらいます。

```bash
# PDFディレクトリの内容を確認
PDF_LIST=$(find ~/PDF -type f \( -name "*.pdf" -o -name "*.txt" -o -name "*.md" \) | sort)

# 検索キーワードがある場合
if [ -n "$ARGUMENTS" ]; then
    SEARCH_RESULTS=$(grep -r "$ARGUMENTS" ~/PDF --include="*.txt" --include="*.md" 2>/dev/null || echo "テキストファイルに該当なし")
fi

gemini -p "PDFライブラリの検索結果:

利用可能なドキュメント:
$PDF_LIST

キーワード「$ARGUMENTS」の検索結果:
$SEARCH_RESULTS

これらのドキュメントから、$ARGUMENTS に関する情報を整理して提供してください。"
```

引数: 検索したいキーワード
例: /project:search-pdf API設計
```