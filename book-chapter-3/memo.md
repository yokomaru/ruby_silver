# 識別子
- クラスめいや変数名を構成するもの
## 命名規則
### ローカルヘンスウ
- アンダースコア
- 英数字
#### 以下だめ
- obj-1
- initialize?
- 1_to_10
#### 予約語
- nil true false not or and
BEGIN END begin end do then yield rescue ensure
class module def defined? alias super self return
while until for in break next redo retry
case when if unless else elsif
__LINE__ __FILE__
__ENCODING__
@でいけなくはないけどだめ

##　rubyで宣言可能な変数と定数
- ローカル変数
 - 先頭 英小文字
 - 構成文字 英数字または_
 - スコープ ブロック、定義の終わり
 - 初期化していないときに参照した場合 代入がない場合は例外 記述はあるが実行されていない場合はnil
- グローバル変数
 - 先頭 $
 - 構成文字 英数字または_
 - スコープ どこからでも
 - 初期化していないときに参照した場合 nil
- クラス変数
 - 先頭 @@
 - 構成文字 英数字または_
 - スコープ ブそのクラスの全てのインスタンスから
 - 初期化していないときに参照した場合 例外
- インスタンス変数
 - 先頭@
 - 構成文字 英数字または_
 - スコープ インスタンス内で参照可能
 - 初期化していないときに参照した場合 nil
- 定数
 - 先頭 英大文字
 - 構成文字 英数字または_
 - スコープ 定数が定義されたクラス・モジュール内 そのクラスモジュールの内側で定義されたクラス・モジュールない、及クラス・モジュールを継承インクルードしている
 クラス名やモジュール名で就職すれば外部からアクセス可能。
 - 初期化していないときに参照した場合 例外

 # 数値
 ## Rubyリテラル
 - 数値
 - 論理値
 - 文字列
 - シンボル
 - 配列
 - ハッシュ
 - 範囲
 - 正規表現
 - コマンド出力

## 数値リテラル
-整数と浮動小数点数がリテラル構文で数字を記述すると数値と認識される。＋ーで正負。eで指数表現も可能
+12
-12
0.1
3.0e2 300(3に10の2乗)
3.0-2 0.03(3に10の-2乗)

基数指示子を指定することで、何進数で解釈されるかを指定できる
2進数 binary 0b 0b10 #=>2
8進数 octal 0oまたは0 0o10 #=>8
10進数 decimal 0d 0d10 #=>10
16進数 hexadecimal 0x 0x10 #=>16

基数指示子を指定した場合少数や指定した真数で表現できない数字を指定すると構文ネラーになる
0b2
0d1.1

数値で_使える無視する
100_000_000

-?に続く文字のリテラル
?R #文字Rを表すString
?\C-v #コントロールきーを表すString
?\M-a #メタキーを表すString
?\n #改行を表す

## 有理数(rational)、複素数(complex)のリテラル
- 42/10r  #=>(21/5)
- (42/10r).class  #=>Rational
- 3.14r  #=>(157/50))
- 42i  #=>(0+42i)
- 42i.class  #=>Complex
- 3.14i #=>(O+3.14i)

## 有理数(rational)、複素数(complex)のリテラルの組み合わせ
- 42ri  #=>(0+(42/1)*i)
- 3.14ri #=>(0+(157/50)*i)

## 数値演算
1 + 2 #=3
1 - 2 #=-1
2 * 3 #=6
4 / 2 #=2
4 % 3 #=1

1 == 1 #=true
1 != 2 #=true
1 < 2 #=true
2 >= 2 #=true

### UFO演算子
- 比較の結果を数値
- 左辺が右辺より大きい 1
- 同じ 0
- 小さい -1
- ソート処理などで使う
100 <=> 10  #=1
100 <=> 100 #=0
10 <=> 100 #=-1

- rubyにインクリメントはない
a = 100
a += 1 #= 101
a -= 1 #= 100
a *= 2 #= 200
a **= 2 #= 40000 **は冪乗

## 数値クラスと遠webAR難死の再定義
- ここまできたのは数値クラスのインスタンスになっている
全ての値が何らかのクラスのインスタンスになっている

1.class #= Integer
10000000000000000.class #= Float
1.2.class #= Float

- Fixnum(固定長)、bignum(可変長)　Integerを継承
- IntegerとFloatはNumeric≈継承

- 算術演算子はクラスのメソッドとして実装されている
- +は数値の＋メソッド
1.+ (2) # = 3
- 再営為for￥位できない演算子
スコープ演算子(:)、代入演算子(=)、条件 ?:, 範囲.. ... 論理演算子 && and ** or not

## メソッド
- defで定義
メソッドの定義方法
def <メソッド> <引数リスト>
end

- 一番最後に評価士らしきが返り血となる
- 仮引数はデフォルトで指定できる
return で明示的に返り血を指定しても良い
def foo a, b = 100
  a + b
end

foo(1,2)
foo 2,3
foo 3

### 2.0からキーワード引数
def foo(a:, b:100)
  a + b
end

foo(a: 2, b: 3)
foo(a:1)
foo(1)

### 引数に任意の引数
def bar(a:, b: 100, **z)
  p z
  a + b
end

bar(a: 2, c:200 , d: 3)
- {:c=>200, :d=>3}
- => 102

# 論理値
true false
TrueClass
FalseClass
trueは真の代表ち
falseとnil以外は全て真
- 判定結果は関係なく変数は保持される

b = 3 if false
p b #=> nil
p c #=> NameError

## 疑似変数
true falseは疑似変数
true TrueClassオブジェクト
false Falseクラスのオブジェクｔｐ
nil NIlClassのオブジェクト
self 現在のオブジェクト
__FILE__ 現在実行しているプログラムのファイル名
__LINE__ 行番号
__ENCODING__ ソースのエンコーディング
Rubyはnilとfalseのみが偽
nilの比較はいらない

## 論理演算子
if true && true true
if nil && 10 nil
if false || true  true
if nil || false nil
if !true nil

左辺で確定する場合は右は読まん
式の評価値は最後に評価したオペランドとなる
b = b || 1 #bが初期化していない場合1を格納 1
c ||= 1 #cが初期化していない場合1を格納 1

- 事故代入できない、代入演算子よりも優先度が低い「
and
not

p 1 && 2
p 1 and 2
irb(main):141:0> p 1 && 2
2
=> 2
irb(main):142:0> p 1 and 2
1
=> 2
p (1 and 2)

# 文字列
- 書式として妥当か
- 式展開ができるか
a = "ab"
p a #=> "ab"
p a.class #=> String
b = "ab" 'cd' #=> "abcd"

- ダブルクォーテでかこむと式展開ができる、シングルはできない
- #{}

a = 1
p "ああ#{a}" => "ああ1"
=> 任意の値をto_sメソッドが呼ばれる。to_sはクラスによって異なる。
aはFixnumクラスのto_sは10進数で返す
p 'ああ#{a}' => "ああ\#{a}"

## 数値
"100".to_i 100
"1.9".to_f 1.9
"5/2".to_r (5/2)
"1+2i".to_c (1+2i)
"12ab3".to_i 12
"12ab3".to_f 12.0
"1.9".to_i 1.9
"1.9.9".to_f 1.9

途中で文字列などがあればそれ以降は評価されない

##　バックスラッシュ記法
" はできる
ASCIIの(0x51)はJISでは(JIS X 0201)がわりあてられている
\x xの文字
\n 改行
\r　キャリッジリターン
\f　改ページ
\a ベル
\e　エスケープ
\s スペース
\b バックスペース
\t タブ
\v　垂直タブ
\nnn ８進数
\xnn 16進数
\cx コントロール文字
\C-x コントロール文字
\M-x メタx
\M-\C-x メタコントロール
\unnnn Unicode文字(0-9 a-f A-F)
\u{nnnn} Unicode文字(0-9 a-f A-F) 1~6桁まで スペースかタブ区切りで複数指定

8進数
 p "\101" #=> "A"
16進数
 p "\x41" #=> "A"

バックスラッシュを表示
print
puts

p "a\nb"
puts "a\nb"
print "a\nb"

p "a\nb"
"a\nb"
=> "a\nb"

puts "a\nb"
a
b
=> nil

print "a\nb"
a
b=> nil

p　はデバッグよう
文字列をダブルクォーとで囲んだり、アレイを鍵かっこで見せたりなど

p 引数ごとに改行 inspect そのまま
print 改行しない to_s　適用
puts 引数ごとに改行 to_s　適用

p "\x61"
p "\x0a"

p "\x61"
"a"
=> "a"
p "\x0a"

"\n"
=> "\n"

p '\x61'
p '\x0a'

' シングルクォーテおとバックスラッシュのエスケープが表示される
p '\x61'
"\\x61"
=> "\\x61"

 p '\x0a'
"\\x0a"
=> "\\x0a"

###　ヒアドキュメント
- 式展開やバックスラッシュが簡単にできる
<< の後に任意の識別し
query = <<SQL
select *
from my_table;
  SQL
query #=> "select * \nfrom my_table;\n"
- 終端をしめす識別子の前にはスペースだめ
- <<- でスペースあってもOK
query = <<-SQL
select *
from my_table;
  SQL
query

- シングルにしたい場合
query = <<-'SQL'
select *
from my_table;
  SQL
query
- "select * \nfrom my_table;\n"

ダブルクオートで囲むことで明示できる
query = <<-"SQL"
select *
from my_table;
  SQL
query

# ％記法
% でやれば文字列をかこむ文字を指定できる
a =%*aaaa*
a

a =%*aaaa* # => "aaaa"
a #=> "aaaa"

文字の中でダブルクォーテつかいたい時などに使える
a =%*aaaa"aaaa"*
a # => "aaaa\"aaaa\""

a = %[test]
a

a = 1
%q　シングル　%Q ダブル
%q!#{a + 1}! #=> "\#{a + 1}"
%Q?#{a + 1}? #=> "2"

### 文字列の連結
a = "ru" + "by" "ruby"
a * 3 "rubyrubyruby"
3 * a #TypeError (String can't be coerced into Integer)

加算丈さんできる

a = "ru"
p a << "by"
p a => "ruby"
末尾に連携する時は<<できる。破壊的メソッド

エンコードはUTF8
異なるエンコードはむり
a = "ルビー"
a.encoding  #<Encoding:UTF-8>
b = a.encode("SJIS")
b.encoding #<Encoding:Windows-31J>
a + b #Encoding::CompatibilityError

## 比較
"a" < "b" => true
"ab" < "ac" => true
"Ab" < "Ab" => false
"Ab" == "Ab" => true
"Ab" <=> "Ab" = 0

## 文字列
"abcde".length　=> 5
"日本語".length　=> 3

## フォーマット
進数
sprintf("result: %#b", 16)
=> "result: 0b10000"
sprintf("result: %#o", 16)
=> "result: 020"
sprintf("result: %#x", 16)
=> "result: 0X10"
sprintf("result: %#X", 16)
=> "result: 0X10"
桁数

sprintf("result: %#02d", 1)
=> "result: 01"
sprintf("result: %#03d", 1)
=> "result: 001"
sprintf("result: %#05.2f", 1.1111)
=> "result: 01.11"

aprintfは文字列の%と一緒になる

"result: %#02d" % 1
=> "result: 01"
"result: %#03d" % 1
=> "result: 001"
"result: %#05.2f" % 1.1111
=> "result: 01.11"

# シンボル
- シンボルは文字列の先頭にころん "を省略できる

foo1 = :"foo1" => :foo1
foo2 = :"#{foo1}foo2" => :foo1foo2
foo3 = :'foo3' => :foo3
foo4 = :foo4 => :foo4

%s[foo1] => :foo1
%s?foo2? => :foo2

生成されたのはシンボルクラスのインスタンス
+とかは定義されてない
一度文字列を生成してあげる
to_symでシンボルに
v1 = "foo1" => "foo1"
v2 = v1.to_sym => :foo1
v3 = v2.to_s => "foo1"

## オブジェクトの同値性と同一性
- 数値や文字列などのリテラすを指定する
- Rubyのインタプリタはリテラルに対応するクラスのインスタンスをｓ悪性
- 全部オブジェクトでオブジェクトIDを持つ　一位のオブジェクトID
文字列リテラルでは毎回新たに作る
シンボルは同じ値を参照するので変わらない
2.3以降ではfrozen_string_literal:trueで同じ内容の文字列は同一のオブジェクト返すようにする

p "foo1".object_id => 70108496254080
p "foo1".object_id => 70108496226340

p :foo1.object_id => 1519068
p :foo1.object_id => 1519068
p :foo2.object_id => 1519388

シンボルは内部では整数なので処理が早くなるラベルの場合はシンボル
2.2以降ではガベージコレクション
equal? 2つのオブジェクトが同一かどうか

"foo1" == "foo1"
=> true
"foo1".equal?("foo1")
=> false
:foo1 == :foo1
=> true
:foo1.equal?(:foo1)
=> true

==とeql?は一緒

数値は == 整数と浮動小数点数は一緒
eql?型も見る　厳密に見る
"foo1".eql? "foo1"
=> true
1.0 == 1
=> true
(1.0).eql? 1
=> false
(1.0).eql? 1.0
=> true

リテラルを指定すると対応するオブジェクおがメモリ上に生成される
変数を宣言すると変数にオブジェクトの参照が与えられる
v1　= "foo1" => "foo1"
v2 = v1 => "foo1"
v1.equal? v2 => true

大部分は再代入になるので元の値には影響ない
v1 = "foo1"
v2 = v1
v1 += "foo2"
p v1 => "foo1foo2"
p v2 => "foo1"

メソッドの引数も一緒
実引数に指定された変数の参照が仮引数にコピーされる

def func v1
  v1.object_id
end

v1 = "foo1"
p v1.object_id => 70118948659940
p func(v1) => 70118948659940

# メソッドの内部で作成した亜値は本スコープに含まれる
# 外部は直接参照できない

def func v1
  v1.object_id
end

v1 = "foo1"
p v1.object_id => 70118948659940
p func(v1) => 70118948659940

# 事故代入しても実引数には影響なし
def func v1
  v1 += "foo2"
end

v1 = "foo1"
p func v1 => "fo


v1 = "foo1" => "foo1"
v2 = v1 => "foo1"
p v1.chop => "foo"
p v2  "foo1"
p v1.chop! => "foo"
p v2 => "foo"
chopは最後の文字列を取り除いた文字れてう
参照先にも影響を与えている!
concatなど破壊的なやつもいる
最近のライブラリでは破壊的メソッドではないが注意せえよ！もある
v1="foo"
v2="foo"
v3="foo"

p v1.object_id => 70118948440840
p v2.object_id => 70118948680340
p v3.object_id => 70118948698500

v1= :foo => 1518428
v2=:foo => 1518428
v3=:foo => 1518428

p v1.object_id
p v2.object_id
p v3.object_id

v1.chop
