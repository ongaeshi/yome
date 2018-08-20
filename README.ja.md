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

コメントを付けたらyomeコマンドを実行します。注釈付きコメントと関連するコードを抜粋して数字の順に並べて表示します。

````bash
$ cd ~/src
$ yome
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

最終出力結果は[simple.md](https://github.com/ongaeshi/yome/blob/master/test/data/simple/simple.md)です。

## リファレンスマニュアル
### YOME:no (セクション) 
`YOME:`の後に空白を空けずに数字を記述するとセクションになります。自分よりの下の`YOME: (コメント)`やソースコードを1つにまとめ、数字の順にマークダウンの`##`に変換して出力されます。

数字には小数点も使えます。数値の途中が空いていてもかまいません。

```ruby
# YOME:1 First section
class Simple
  # YOME:10 Second section
  def foo
  end

  # YOME:    3 This is not a section
  def bar
  end
end  
```

### YOME: (コメント)
`YOME:`の後に空白を空けるとコメントになります。マークダウンの段落になります。

```ruby
# YOME:1 First section
# YOME: First section's comment
class Simple
  # YOME:10 Second section
  # YOME: Second section's comment
  # YOME: Next comment
  def foo
  end
end  
```

### YOME:title
`YOME:title`の後に空白を空けるとタイトルになります。マークダウンの`#`に変換して出力されます。記述する場所はファイルの先頭でなくてもかまいません。

```ruby
# YOME:title Simple class

# YOME:1 First section
# YOME: First section's comment
class Simple
end  
```

### YOME:summary
`YOME:summary`の後に空白を空けるとサマリーになります。マークダウンの`#`の後に段落として出力されます。記述する場所はファイルの先頭でなくてもかまいません。

```ruby
# YOME:title Simple class
# YOME:summary Behavior of simple class

# YOME:1 First section
# YOME: First section's comment
class Simple
end  
```

### YOME:url
`YOME:url`の後に空白を空けるとURLになります。マークダウンの`#`の後にURLを出力します。記述する場所はファイルの先頭でなくてもかまいません。

```ruby
# YOME:title Simple class
# YOME:summary Behavior of simple class
# YOME:url https://github.com/ongaeshi/yome

# YOME:1 First section
# YOME: First section's comment
class Simple
end  
```

### YOME:end
セクションのコード抜粋範囲は8行もしくは次のセクションまでです。長いコード範囲を抜粋したいときは`YOME:end`を使ってください。

```ruby
  # YOME:5 YOME:end
  # YOME: You can display long distance with `YOME:end`.
  def long_method
    1 +
    2 +
    3 +
    4 +
    5 + 
    6 +
    7 +
    8 +
    9 +
    10
  end
  # YOME:end
```

## コマンドラインオプション
ソースコードの位置、出力ファイル名、未対応のソースコード種類などを指定することができます。

```
$ yome -h
Usage: yome [DIR] [options]
    -o FILE                          Output file name
        --lang LANG                  Specify code blocks language
```

## Gitとの連携
yomeは単体でも使うことができますが、Gitと組み合わせるとさらに便利になります。

```
# 読みたいソースコードをclone
$ git clone https://github.com/mruby/mruby.git
$ cd mruby

# 作業用のブランチを切ると便利
$ git checkout -b yome/gc

# コメントを書き込んだら定期的にコミットしておきましょう
$ git commit

# 他のコードエリアを読むときにブランチを切り替えると
# 別のドキュメントとして生成することができます。
$ git checkout master
$ git checkout -b yome/array
```