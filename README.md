<h1>
<img src="https://raw.githubusercontent.com/Sunwood-ai-labs/OpenCodeInterpreter/main/docs/icon.png" height=300px align="right"/>
OpenCodeInterpreter: <br>
</h1>
<h2>
Integrating Code Generation with Execution and Refinement
<br>(コード生成の統合、実行、および改良)
</h2>

<p align="center">
<img width="1000px" alt="OpenCodeInterpreter" src="https://opencodeinterpreter.github.io/static/images/figure1.png">
</p>
<p align="center">
  <a href="https://opencodeinterpreter.github.io/">[🏠ホームページ]</a> 
  |
  <a href="https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/">[🛠️コード]</a> 
</p>
<hr>


## &#x1f31f; 近日中の新機能 
- &#x1f4a1; **OpenCodeInterpreter-SC2シリーズモデル（StarCoder2ベース）のオープンソーシング** 
- &#x1f4a1; **gemma-7bベースのOpenCodeInterpreter-GM-7bモデルのオープンソーシング**

## &#x1f514;ニュース

&#x1f6e0;&#xfe0f;[2024-02-29]: 公式オンラインデモをHuggingFace Spacesにデプロイしました！[デモページ](https://huggingface.co/spaces/m-a-p/OpenCodeInterpreter_demo) をご覧ください！

&#x1f6e0;&#xfe0f;[2024-02-28]: デモローカルデプロイメントコードとセットアップガイドをオープンソース化しました。

&#x2728;[2024-02-26]: [OpenCodeInterpreter-DS-1.3b](https://huggingface.co/m-a-p/OpenCodeInterpreter-DS-1.3B) モデルをオープンソース化しました。

&#x1f4d8;[2024-02-26]: [CodeFeedback-Filtered-Instruction](https://huggingface.co/datasets/m-a-p/CodeFeedback-Filtered-Instruction) データセットをオープンソース化しました。

&#x1f680;[2024-02-23]: 当プロジェクトで使用しているデータセット、[Code-Feedback](https://huggingface.co/datasets/m-a-p/Code-Feedback) をオープンソース化しました。

&#x1f525;[2024-02-19]: OpenCodeInterpreterシリーズのすべてのモデルをオープンソース化しました！皆様のモデルの試用と参加をお待ちしています！&#x1f606;


## 紹介

OpenCodeInterpreterは、大規模な言語モデルとGPT-4コードインタープリターのような洗練された独自システムの間のギャップを埋めることを目指した、オープンソースのコード生成システムスイートです。実行機能と反復的な改善機能を統合することにより、コード生成能力を大幅に強化します。


## モデル

OpenCodeInterpreterシリーズ内のすべてのモデルはHugging Faceでオープンソース化されています。以下のリンクからモデルにアクセスできます：[OpenCodeInterpreterモデル](https://huggingface.co/collections/m-a-p/opencodeinterpreter-65d312f6f88da990a64da456) 。

## データ収集

68Kのマルチターンインタラクションを特徴とするCode-Feedbackデータセットを支えに、OpenCodeInterpreterは実行と人間のフィードバックを組み合わせて動的なコード改善を取り入れています。
データ収集手順の詳細については、[データ収集](https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/blob/main/data_collection/README.md) のreadmeをご覧ください。

## 評価

当社の評価フレームワークは主にHumanEvalとMBPP、およびそれらの拡張バージョンであるHumanEval+とMBPP+を使用し、より包括的な評価のために[EvalPlusフレームワーク](https://github.com/evalplus/evalplus) を活用しています。
特定の評価方法論については、[評価README](https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/blob/main/evaluation/README.md) を参照してください。

## デモ

私たちは、ユーザーが当社のLLMをローカルでコードを生成し実行できるオープンソースのデモを提供することを嬉しく思います。デモ内では、ユーザーはLLMの力を活用してコードを生成し、ローカルで実行し、自動実行フィードバックを受け取ることができます。LLMはこのフィードバックに基づいてコードを動的に調整し、よりスムーズなコーディング体験を実現します。さらに、ユーザーはLLMモデルとのチャットベースのインタラクションを通じてフィードバックを提供し、生成されたコードをさらに強化することができます。

デモを探索し、その機能を直接体験するには、[OpenCodeInterpreterデモREADME](https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/blob/main/demo/README.md) ファイルに記載されている指示に従ってください。ハッピーコーディング！

### クイックスタート 
- **ワークスペースに入る** :

```bash
git clone https://github.com/OpenCodeInterpreter/OpenCodeInterpreter.git
cd demo
``` 
- **新しいconda環境を作成する** : `conda create -n demo python=3.10` 
- **作成したデモ環境をアクティブにする** : `conda activate demo` 
- **必要なパッケージをインストールする** : `pip install -r requirements.txt` 
- **という特定のリポジトリにコンテンツを作成しプッシュするだけです。このデモをご自身のデバイスにデプロイした場合、私たちはあなたのデータにアクセスできません。** 
- **アクセストークンを環境変数に追加する:**  `export HF_TOKEN="your huggingface access token"` 
- **Gradioアプリを実行する** :

```bash
python3 chatbot.py --path "the model name of opencodeinterpreter model family. e.g., m-a-p/OpenCodeInterpreter-DS-6.7B"
```
### 動画

[https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/assets/46103100/2337f34d-f5ed-4ecb-857b-3c2d085b72fd](https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/assets/46103100/2337f34d-f5ed-4ecb-857b-3c2d085b72fd) 

## お問い合わせ

ご質問がある場合は、issueを立てるか、[xiangyue.work@gmail.com]() 、[zhengtianyu0428@gmail.com]() までメールでお問い合わせください。
お手伝いさせていただきます！

## スター履歴

![](https://star-history.com/#OpenCodeInterpreter/OpenCodeInterpreter&Date)
