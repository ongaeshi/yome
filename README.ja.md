# Yome

注釈付きコメントを使ってコードリーディング文書を生成するツールです。

ソースコード内に`YOME:`という形式のマークアップを埋め込むと、テキストとソースコードを順番に並べたマークダウン文章を作成します。

## インストール

RubyGemsからインストールできます。

    $ gem install yome

Windows向けにバイナリも用意しています。  
ダウンロードしてパスの通った場所に置いてください。

- [Releases · ongaeshi/yome](https://github.com/ongaeshi/yome/releases/)

## 使い方
ソースコードを読みながら注釈付きコメントを記述していきます。サンプルでは[1ファイルにのみ](https://github.com/ongaeshi/yome/blob/master/test/data/simple/simple.rb)注釈付きコメントを記述していますが複数ファイルにまたがっても構いません。

```ruby
# YOME:title Yome simple test
# YOME:summary This is a simple sample
# YOME:url https://github.com/ongaeshi/yome/tree/master/test/data/simple

# YOME:4 require
require "dir"

# YOME:1 Define class
class Simple
  # YOME:3 attr_reader
  attr_reader :x

  # YOME:1.1 Initialize
  def initialize(x)
    @x = x
  end


  # YOME:2 Method
  # YOME: The *to_double* method doubles x and returns it.
  # YOME: double
  def to_double
    2 * x
  end
end
```

コメントを付けたらyomeコマンドを実行します。注釈付きコメントと関連するコードを抜粋し、指定した数字の順に並べて表示します。

````bash
$ cd ~/src
$ yome    # yome . の省略形です
# Yome simple test
This is a simple sample

https://github.com/ongaeshi/yome/tree/master/test/data/simple


## Define class
*simple.rb*


```ruby
class Simple
```
````

`-o`でファイルに出力します。

```bash
$ yome -o simple.md
```

出力結果は[simple.md](https://github.com/ongaeshi/yome/blob/master/test/data/simple/simple.md)です。

## リファレンスマニュアル
### YOME:no (セクション) 
### YOME: (コメント)
### YOME:title
### YOME:summary
### YOME:url
### YOME:end

## コマンドラインオプション

## Gitとの連携