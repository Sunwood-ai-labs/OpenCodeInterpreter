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

## 紹介
OpenCodeInterpreterは、大規模言語モデルとGPT-4コードインタープリターのような高度なプロプライエタリシステムとのギャップを埋めることを目指したオープンソースのコード生成システムスイートです。実行と反復的な改良機能を統合することにより、コード生成能力を大幅に向上させます。

## モデル
OpenCodeInterpreterシリーズ内のすべてのモデルはHugging Faceでオープンソース化されています。次のリンクから私たちのモデルにアクセスできます：[OpenCodeInterpreterモデル](https://huggingface.co/collections/m-a-p/opencodeinterpreter-65d312f6f88da990a64da456)。

## データ収集
68Kのマルチターンインタラクションを特徴とするCode-Feedbackデータセットを支えに、OpenCodeInterpreterは実行と人間のフィードバックを組み込んで動的なコード改良を行います。
データ収集手順の詳細については、[データ収集](https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/blob/main/data_collection/README.md)の下に提供されているreadmeをご覧ください。

## 評価
私たちの評価フレームワークは、主にHumanEvalとMBP、およびそれらの拡張バージョンであるHumanEval+とMBPP+を使用し、より包括的な評価のために[EvalPlusフレームワーク](https://github.com/evalplus/evalplus)を活用します。
特定の評価方法論については、詳細は[Evaluation README](https://github.com/OpenCodeInterpreter/OpenCodeInterpreter/blob/main/evaluation/README.md)をご参照ください。

## 連絡先

ご質問がある場合は、遠慮なくissueを立てるか、xiangyue.work@gmail.com, zhengtianyu0428@gmail.comまでメールでお問い合わせください。
お手伝いできることがありますので、お気軽にご連絡ください！