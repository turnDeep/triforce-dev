.PHONY: setup dev test review clean help

# ヘルプ
help:
	@echo "三位一体開発コマンド:"
	@echo "  make setup    - 初期セットアップ"
	@echo "  make dev      - 開発サーバー起動"
	@echo "  make test     - テスト実行"
	@echo "  make review   - Geminiでコードレビュー"
	@echo "  make clean    - キャッシュクリア"

# セットアップ
setup:
	npm install
	mkdir -p .claude/commands
	@echo "Claude CodeとGemini CLIがインストールされていることを確認してください"
	@echo "  npm install -g @anthropic-ai/claude-code"
	@echo "  npm install -g @google/gemini-cli"

# 開発
dev:
	npm run dev

# テスト
test:
	npm test
	npm run typecheck
	npm run lint

# レビュー
review:
	@echo "変更内容をGeminiでレビューします..."
	git diff --cached > /tmp/changes.diff
	gemini -p "コードレビュー: $$(cat /tmp/changes.diff | head -100)"

# クリーンアップ
clean:
	rm -rf node_modules
	rm -rf .next
	rm -rf dist
	rm -f *.log
	npm cache clean --force
