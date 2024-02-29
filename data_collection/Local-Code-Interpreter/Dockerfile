# 使用するPythonのバージョンを指定
FROM python:3.9.16

# 作業ディレクトリを設定
WORKDIR /app


# requirements_full.txtをコンテナにコピー
COPY requirements_full.txt /app
# 必要なPythonパッケージをインストール
RUN pip install --no-cache-dir -r requirements_full.txt

# コンテナが起動した際に実行されるコマンド
# CMD ["bash"]
