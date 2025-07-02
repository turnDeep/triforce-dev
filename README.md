 🔺 Triforce Dev Framework 🔺

**Current Version: 1.1.0**

**人間 × Claude Code × Gemini CLI = 開発効率の最大化**

このリポジトリは、人間、Claude Code、Gemini CLIの三者が協力して開発を進めるための「三位一体開発フレームワーク」のテンプレートです。それぞれの強みを活かし、弱点を補い合うことで、より効率的で質の高い開発を目指します。

## ✨ クイックスタート

1. **リポジトリをクローンまたはテンプレートとして使用:**
   ```bash
   git clone https://github.com/turnDeep/triforce-dev.git
   # または GitHub UI で "Use this template" をクリック
   ```

2. **Dev Containerで開く (推奨):**
   - VS Codeでプロジェクトを開きます。
   - 右下に表示される「Reopen in Container」通知をクリック、またはコマンドパレット (Cmd/Ctrl+Shift+P) から「Dev Containers: Reopen in Container」を選択。
   - 初回起動時、必要なツール (`@anthropic-ai/claude-code`, `@google/gemini-cli`) が自動インストールされ、`make setup`が実行されます。

3. **手動セットアップ (Dev Containerを使用しない場合):**
   - 詳細は [PROJECT_SETUP.md](PROJECT_SETUP.md) を参照してください。
   - 簡単に言うと:
     ```bash
     npm install -g @anthropic-ai/claude-code @google/gemini-cli
     make setup  # または PROJECT_SETUP.md 内の個別コマンド実行
     ```

4. **ClaudeとGeminiの初期設定:**
   - **Claude**: `memory.json.sample` を参考に `~/.claude/memory.json` を作成・編集。
   - **Gemini**: `settings.json.sample` を参考に `~/.gemini/settings.json` を作成・編集。
   - 初回利用時に各CLIで認証が必要です (`claude` と `gemini` をターミナルで実行)。

5. **開発開始！**
   - `CLAUDE.md` と `GEMINI.md` をプロジェクトに合わせてカスタマイズします。
   - Claude Codeを起動 (`claude`) し、開発を開始します。
   - 必要に応じて `Makefile` のコマンド (`make test`, `make lint` など) を活用します。

## 🎯 フレームワークの目的

- **品質向上**: Claudeの計画・実装力とGeminiの調査・分析力を組み合わせ、人間のレビュー負荷を軽減。
- **効率化**: 反復作業や定型的な調査をAIに任せ、人間はより創造的なタスクに集中。
- **トークン節約**: Geminiによる事前調査でClaudeの試行錯誤を減らし、トークン消費を最適化。
- **属人化防止**: `CLAUDE.md` や `GEMINI.md` にプロジェクト知識を集約。

## 🛠️ 主要ファイルとディレクトリ

- **`CLAUDE.md`**: Claude Codeへの指示書。プロジェクトの憲法。
- **`GEMINI.md`**: Gemini CLIへの指示書 (Claude経由で利用)。プロジェクトの賢者。
- **`.claude/commands/`**: Claude用カスタムコマンド群。魔法の呪文集。
- **`docs/`**: 詳細ドキュメント。知恵の書。
  - [フォルダ構造](docs/FOLDER_STRUCTURE.md)
  - [Dev Containerセットアップ](docs/DEVCONTAINER_SETUP.md)
  - [トラブルシューティング](docs/TROUBLESHOOTING.md)
- **`Makefile`**: 便利なコマンド集。万能ツールナイフ。
- **`memory.json.sample` / `settings.json.sample`**: AIツールの設定テンプレート。

詳細は [フォルダ構造ガイド](docs/FOLDER_STRUCTURE.md) を参照してください。

## 🤖 AI連携の特徴

- **自動相談**: Claude Codeが必要に応じてGeminiに自動で相談
- **段階的自動化**: レベル1〜3で自動化度合いを調整可能
- **シームレス連携**: ユーザーは意識せずに三位一体開発を体験

詳細は [Gemini連携ガイド](docs/GEMINI_INTEGRATION.md) を参照。

## 🤝 三位一体の連携フロー (例)

1. **人間**: Claudeに開発要件を伝える (例: 「ユーザー認証機能を実装して」)。
2. **Claude**:
   - `GEMINI.md` の内容と人間の指示を元に、Geminiに調査を依頼 (例: 「Next.jsでの最適な認証方法は？」)。
   - Geminiの回答を参考に実装計画を立案。
3. **Gemini**: 調査結果や複数の選択肢、注意点などをClaudeに提供。
4. **Claude**: 人間に計画を提示し、承認を得てから実装開始。
5. **人間**: 実装計画をレビュー・承認。
6. **Claude**: コーディング。適宜Geminiに相談 (例: 「このエラーの原因は？」)。
7. **人間/Claude**: `/project:review-with-gemini`のようなカスタムコマンドでGeminiにコードレビューを依頼。
8. **Gemini**: コードの問題点や改善案を指摘。
9. **Claude/人間**: レビュー結果を元に修正。
10. **人間**: 最終確認とマージ。

## 🔧 カスタマイズ

- **`CLAUDE.md` / `GEMINI.md`**: あなたのプロジェクトに合わせて、これらのファイルを徹底的にカスタマイズしてください。これがフレームワーク活用の鍵です。
- **`.claude/commands/`**: プロジェクト固有の便利なコマンドを追加・編集。
- **`Makefile`**: チームでよく使うコマンドを登録。

## 💡 ヒント

- **具体的指示**: AIには曖昧な指示より具体的な指示が有効です。
- **役割分担の明確化**: `CLAUDE.md`と`GEMINI.md`で各AIの役割を明確に定義しましょう。
- **反復的改善**: 一度で完璧を目指さず、AIとの対話を通じて徐々に成果物を改善していくのがコツです。
- **人間による最終判断**: AIは強力なアシスタントですが、最終的な意思決定と責任は人間が持ちます。

## 🙏 貢献

バグ報告、機能提案、プルリクエストを歓迎します！

## 📜 ライセンス

このプロジェクトは [MITライセンス](LICENSE) の下で公開されています。

---

**このフレームワークが、あなたの開発プロジェクトを次のレベルへと導く一助となれば幸いです！** 🚀
