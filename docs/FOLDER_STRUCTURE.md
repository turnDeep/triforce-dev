# フォルダ構造ガイド

このドキュメントでは、「三位一体開発フレームワーク」の標準的なフォルダ構造と、各ファイル/ディレクトリの役割について説明します。

## 推奨フォルダ構造

```
triforce-dev/
├── 📜 README.md                    # プロジェクト概要とクイックスタート
├── 📜 CLAUDE.md                    # Claude Codeの行動規範・設定
├── 📜 GEMINI.md                    # Gemini CLIの行動規範・設定
├── 📜 PROJECT_SETUP.md             # 手動での環境セットアップ手順
├── 📜 Makefile                     # 便利な開発コマンド集 (オプション)
├── 📜 .gitignore                   # Gitで無視するファイル/フォルダの指定
├── 📜 memory.json.sample           # Claudeのmemory機能用設定サンプル
├── 📜 settings.json.sample         # Gemini CLIの設定サンプル
│
├── 📁 .claude/                     # Claude Code関連のプロジェクト固有設定
│   └── 📁 commands/                # Claude用カスタムコマンドスクリプト
│       ├── 📜 README.md            # カスタムコマンドの説明
│       └── ... (例: stuck-helper.sh, review-with-gemini.sh)
│
├── 📁 .devcontainer/               # VS Code Dev Container設定
│   ├── 📜 devcontainer.json        # Dev Containerの基本設定
│   └── 📜 Dockerfile               # (推奨) Dev Container用Dockerfile
│
├── 📁 docs/                        # 詳細ドキュメント類
│   ├── 📜 DEVCONTAINER_SETUP.md    # Dev Container詳細セットアップガイド
│   ├── 📜 TROUBLESHOOTING.md       # トラブルシューティングガイド
│   └── 📜 FOLDER_STRUCTURE.md      # このファイル
│
├── 📁 src/                         # プロジェクトのソースコード (例)
│   └── ...
│
└── 📁 tests/                       # テストコード (例)
    └── ...
```

## 各ファイル/ディレクトリの説明

### ルートディレクトリ

- **`README.md`**:
  - プロジェクトの顔となるファイル。
  - 三位一体開発フレームワークのコンセプト、主な利点、基本的な使い方（クイックスタート）を記述。
  - 詳細な情報（セットアップ、トラブルシューティング等）は`docs/`内の各ドキュメントへのリンクを推奨。
- **`CLAUDE.md`**:
  - Claude Codeに対する指示書。
  - プロジェクトの概要、技術スタック、コーディング規約、Claudeの役割、Geminiとの連携方法、カスタムコマンドの定義などを記述。
  - **最重要ファイルの一つ。**
- **`GEMINI.md`**:
  - Gemini CLIに対する指示書（主にClaudeがGeminiに渡すコンテキストの一部として利用）。
  - プロジェクトの背景、Geminiに期待する役割（調査、分析、レビュー等）、禁止事項（コード編集の禁止など）を記述。
  - **最重要ファイルの一つ。**
- **`PROJECT_SETUP.md`**:
  - Dev Containerを使用しない場合や、手動で環境を構築する際の詳細な手順を記述。
  - 必要なツールのインストール方法、認証手順、環境変数の設定など。
- **`Makefile`** (オプション):
  - `make setup`, `make test`, `make lint`など、よく使うコマンドをまとめたもの。
  - 開発効率を向上させるためのショートカット集。
- **`.gitignore`**:
  - Gitのバージョン管理対象外とするファイルやディレクトリを指定。
  - `node_modules/`, `.env`, `*.log`, IDE固有ファイルなど。
- **`memory.json.sample`**:
  - Claude Codeの `/memory` 機能で使用する `~/.claude/memory.json` のサンプル。
  - ユーザー設定、開発環境、コミュニケーションスタイル、プロジェクトデフォルトなどを記述。
  - **このサンプルを元にユーザーが各自で `~/.claude/memory.json` を作成・設定する。**
- **`settings.json.sample`**:
  - Gemini CLIの `~/.gemini/settings.json` のサンプル。
  - モデル設定、ツール設定（有効/無効）、サンドボックス設定などを記述。
  - **このサンプルを元にユーザーが各自で `~/.gemini/settings.json` を作成・設定する。**

### `.claude/`

- **`.claude/commands/`**:
  - Claude Codeから呼び出すカスタムコマンドのシェルスクリプトなどを格納。
  - **`README.md`**: このディレクトリ内のカスタムコマンド一覧とそれぞれの使い方を説明。
  - 例: `stuck-helper.sh` (困ったときにGeminiに相談するスクリプト)、`review-with-gemini.sh` (変更差分をGeminiにレビューさせるスクリプト)。

### `.devcontainer/`

- VS Code Dev Containersの設定ファイルを格納。
- **`devcontainer.json`**: Dev Containerの主要な設定（使用イメージ、拡張機能、ポートフォワーディング、ライフサイクルスクリプトなど）。
- **`Dockerfile`** (推奨): `devcontainer.json`から参照されるDockerfile。開発環境に必要なツールやライブラリを細かく定義。

### `docs/`

- プロジェクトに関する詳細なドキュメントを格納。
- **`DEVCONTAINER_SETUP.md`**: Dev Containerのセットアップと使い方に関する詳細ガイド。
- **`TROUBLESHOOTING.md`**: よくある問題とその解決策をまとめたガイド。
- **`FOLDER_STRUCTURE.md`**: このファイル。フォルダ構造の説明。
- その他、設計書、APIドキュメントなどもこのディレクトリに含めることを検討。

### `src/` (例)

- プロジェクトのメインとなるソースコードを格納。
- 言語やフレームワークに応じて構造は変わります (例: `src/components`, `src/services`, `src/utils`)。

### `tests/` (例)

- 自動テストのコードを格納。
- ユニットテスト、インテグレーションテスト、E2Eテストなど。

## なぜこの構造なのか？

- **関心の分離**: 設定ファイル、ドキュメント、ソースコードなどを明確に分離し、見通しを良くする。
- **AIツールとの連携**: `CLAUDE.md`や`GEMINI.md`、カスタムコマンドなど、AIツールが参照しやすい場所に設定ファイルを配置。
- **再現性**: Dev Container設定により、誰でも同じ開発環境を容易に構築可能にする。
- **拡張性**: 新しいドキュメントやツール固有の設定ファイルを追加しやすい構造。

このフォルダ構造はあくまで推奨です。プロジェクトの特性やチームの規約に合わせて適宜カスタマイズしてください。重要なのは、**一貫性があり、チームメンバー（AI含む）全員が理解しやすい構造**を維持することです。
