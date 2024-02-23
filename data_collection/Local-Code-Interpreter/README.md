# Local-Code-Interpreter

OpenAIのChatGPTコードインタープリター（高度なデータ分析）のローカル実装です。

## 紹介

OpenAIのコードインタープリター（現在は高度なデータ分析として改名されました）は、AIモデル内でPythonコードを実行する画期的な機能を提供します。しかし、オンラインのサンドボックス内でコードを実行するため、いくつかの制限があります。このプロジェクトでは、ローカルデバイスでコード実行を可能にするLocal Code Interpreterを紹介します。これにより、柔軟性、セキュリティ、便利さが向上します。
![notebook_gif_demo](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/save_to_notebook_demo.gif) 

## 主な利点 
- **カスタム環境** : 必要なパッケージと設定を備えた、選択したカスタマイズ環境でコードを実行します。 
- **シームレスな体験** : ファイルサイズの制限やアップロード時のインターネットの問題とはお別れです。Local Code Interpreterを使用すると、完全にコントロールできます。 
- **GPT-3.5の利用可能性** : 公式のコードインタープリターがGPT-4モデルでのみ利用可能である一方、Local Code InterpreterはGPT-3.5とGPT-4モデルの間で柔軟に切り替えることができます。 
- **強化されたデータセキュリティ** : コードをローカルで実行することで、インターネット上でのデータ転送を最小限に抑え、データをより安全に保ちます。 
- **Jupyterサポート** : すべてのコードと会話履歴をJupyterノートブックに保存して、将来的な使用のために保持できます。

## 注意

人間のレビューなしにAIが生成したコードを自分のデバイスで実行することは安全ではありません。このプログラムを起動する前に、デバイスとデータのセキュリティを保護するための措置（仮想マシンの使用など）を講じる責任があります。このプログラムの使用によって発生したすべての結果は、自身で負担するものとします。
## 使用方法
### インストール 
1. このリポジトリをローカルデバイスにクローンします。

```shell
git clone https://github.com/MrGreyfun/Local-Code-Interpreter.git
cd Local-Code-Interpreter
``` 
2. 必要な依存関係をインストールします。このプログラムはWindows 10とCentOS Linux 7.8でテストされており、Python 3.9.16が必要です。必要なパッケージには以下が含まれます：

```text
Jupyter Notebook    6.5.4
gradio              3.39.0
openai              0.27.8
ansi2html           1.8.0
tiktoken            0.3.3
Pillow              9.4.0
```



他のシステムやパッケージのバージョンでも動作する場合があります。`openai`パッケージを最新の`1.x`バージョンに更新しないでください。これは書き直されており、古いバージョンと互換性がありません。
必要なパッケージを直接インストールするには、次のコマンドを使用します：

```shell
pip install -r requirements.txt
```



Pythonの初心者向けに、データ処理と分析に一般的に使用される追加パッケージをインストールする便利なコマンドも提供しています：

```shell
pip install -r requirements_full.txt
```
### 設定 
1. `src`ディレクトリに`config.json`ファイルを作成し、`config_example`ディレクトリに提供されている例に従います。 
2. `config.json`ファイルでAPIキーを設定します。

注意事項： 
1. **を正しく設定する** 
このプログラムは`0613`またはそれ以降のバージョンのモデルの関数呼び出し機能に依存しています： 
- `gpt-3.5-turbo-0613`（およびその16Kバージョン） 
- `gpt-3.5-turbo-1106` 
- `gpt-4-0613`（およびその32Kバージョン） 
- `gpt-4-1106-preview`

古いバージョンのモデルでは動作しません。`gpt-4-vision-preview`は関数呼び出しをサポートしていないため、`GPT-4`モデルとして設定すべきではありません。

Azure OpenAIサービスのユーザーの場合： 
- `model_name`をデプロイメント名として設定します。 
- デプロイされたモデルが`0613`またはそれ以降のバージョンに対応していることを確認します。 
2. **APIバージョン設定** 
Azure OpenAIサービスを使用している場合は、`config.json`ファイルで`API_VERSION`を`2023-12-01-preview`に設定します。`2023-07-01-preview`より古いAPIバージョンは、このプログラムに必要な関数呼び出しをサポートしていないため、`2023-12-01-preview`が推奨されます。古いバージョンは近い将来廃止される予定です。 
3. **ビジョンモデル設定** 
現在、`gpt-4-vision-preview`は関数呼び出しをサポートしていませんが、非エンドツーエンドのアプローチを使用してビジョン入力を実装しています。ビジョン入力を有効にするには、`gpt-4-vision-preview`を`GPT-4V`モデルとして設定し、`available`を`true`に設定します。逆に、必要ない場合は`available`を`false`に設定することでビジョン入力を無効にし、ビジョン関連のシステムプロンプトを削除し、APIコストを削減します。
![vision_demo](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/vision_example.jpg) 
4. **モデルコンテキストウィンドウ設定** 
`model_context_window`フィールドは、各モデルのコンテキストウィンドウを記録し、会話がモデルのコンテキストウィンドウ容量を超えた場合にプログラムが会話を分割するために使用します。
Azure OpenAIサービスのユーザーは、以下の形式を使用してモデルのデプロイメント名を使用してコンテキストウィンドウ情報を手動で挿入する必要があります：

```json
"<YOUR-DEPLOYMENT-NAME>": <contex_window (integer)>
```



さらに、OpenAIが新しいモデルを導入した場合、同じ形式を使用して新しいモデルのコンテキストウィンドウ情報を手動で追加できます。（このファイルは更新されますが、遅れが生じる可能性があります） 
5. **代替APIキー処理** 
`config.json`ファイルにAPIキーを保存したくない場合は、代替のアプローチを選択できます： 
- `config.json`の`API_KEY`フィールドを空の文字列として残します：

```json
"API_KEY": ""
``` 
- プログラムを実行する前に環境変数`OPENAI_API_KEY`にAPIキーを設定します：
- Windowsの場合：

```shell
set OPENAI_API_KEY=<YOUR-API-KEY>
```


- Linuxの場合：

```shell
export OPENAI_API_KEY=<YOUR-API-KEY>
```
## はじめに 
1. `src`ディレクトリに移動します。

```shell
cd src
``` 
2. 次のコマンドを実行します：

```shell
python web_ui.py
``` 
3. ブラウザで生成されたリンクにアクセスして、Local Code Interpreterの使用を開始します。 
4. `-n`または`--notebook`オプションを使用して、会話をJupyterノートブックに保存します。
デフォルトでは、ノートブックは作業ディレクトリに保存されますが、パスを追加して他の場所に保存することもできます。

```shell
python web_ui.py -n <path_to_notebook>
```
## 例

データファイルをアップロードして、モデルに線形回帰を実行してデータを可視化するように依頼する場面を想像してください。Local Code Interpreterがシームレスな体験を提供する方法をご覧ください： 
1. データをアップロードして線形回帰をリクエストします：
![Example 1](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/1.jpg) 
2. 生成されたコードでエラーが発生します：
![Example 2](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/2.jpg) 
3. ChatGPTが自動的にデータ構造をチェックしてバグを修正します：
![Example 3](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/3.jpg) 
4. 修正されたコードが正常に実行されます：
![Example 4](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/4.jpg) 
5. 最終結果が要件を満たします：
![Example 5](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/5.jpg) 

![Example 6](https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/data_collection/Local-Code-Interpreter/example_img/6.jpg)---
