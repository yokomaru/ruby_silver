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

# 配列
- 配列リテラル
  - 異なる方でもできる。配列に配列いれれる。
  - v1 = %w(hoge foo bar)
  - v1.json()
  - v1.join("_")
  - Array.newでもいける(初期値は第２匹すうやブロックで口述できる)
  - Array.new(5) #=> [nil, nil, nil, nil, nil]
  - a.length
  - Array.new(2) {|index| index + 10} #=> [10, 11]
  - 第二ひきすうに指定したのは同じオブジェクと
    - a = Array.new(2, "a") # ["a", "a"]
    - a[0].replace("b") # "b" #=> ["b", "b"]
  - ブロックで渡せばOK
    - a = Array.new(2){ "a" } #=> ["a", "a"]
    - a[0].replace("b")
    - p a # ["b", "a"]
  - 配列のサイズは要素への代入で動的に変わり、上限を超えたらnilakeru
    v1 = [10] # [10]
    v1.length 1
    v1[3] = "aa" #  [10, nil, nil, "aa"]
    v1.length 4
    v1[2] nil
    v1[100] nil
  - 配列は要素ごとに参照を保持する集合
- 添字演算子
  - Arrayクラスのメソッドとして
  - 添字には負の数値を指定できる
  - この場合末尾の要素を
  -1として銭湯んむけて
  - v1[-1] #=> "aa"
  - 先頭に向けて減っていく。実際のそえじ+-1の値の数
  - 添字に二つ整数を指定すると、次のそえじがそこからの要素素数ｒにな
  - v1[2,1] # => [nil, "aa"]
  - 複数で」値帰ることもできり
  - v1[2,1] = ["poko","kopo"]
    - [10, nil, "poko", "kopo", "aa"]
    - 余ったものが挿入される
  - 多重代入と可変長引数
    -
      <!-- a, b, c = 1, 2, 3
      => [1, 2, 3]
      irb(main):029:0> a
      => 1
      irb(main):030:0> b
      => 2
      irb(main):031:0> c
      => 3 -->
  - メソッドの返り値でふくすやることも可能
  def foo
    return 1,2,3
  end

  a, b, c = foo
  p a
  p b
  p c

  a, b, c = [1,2,3]
  (a,b), c = [1,2], 3
 <!-- (a,b), c = [1,2], 3
=> [[1, 2], 3] -->

    a, b, c = foo
11=> [1, 2, 3]

- 配列の他順代入
　a, b, c = 1,2
 p a
 p b
 p c => nil

- 一つの変数に複数は配列になる
- *をつけると余ったの無視しない配列としてまとめて代入され
a, *b = 1,2,3
 a, *b = 1,2,3
=> [1, 2, 3]
irb(main):045:0> a
=> 1
irb(main):046:0> b
=> [2, 3]

- 可変長引数
def foo (a,*b)
  b
end

foo(1,2,3) #=> [2, 3]

def foo1 a, *b
  foo2(*b)
end
def foo2 c, *d
  d
end
foo1(1, 2, 3)=> [3]

# 配列の演算
- 二項演算し
  - &
    - 数値はビット演算しとなり論理積を返す
  - |
  　- 中ごうのわ演算どちらかが含まれる

  a = [1,1,2,2]
  b = [2,2,3,3]

  a & b
  a | b
  irb(main):084:0>   a & b
=> [2]
irb(main):085:0>   a | b
=> [1, 2, 3]

  a = [1,1,2,2]
  b = [2,2,3,3]

  a + b
  たす
  a - b
　aからbのマッチした要素をひく
  rb(main):089:0>   a + b
=> [1, 1, 2, 2, 2, 2, 3, 3]
irb(main):090:0>   a - b
=> [1, 1]

対象が重複している場合の-演算子
a = [1,1,2,2]
c = [1]
a-c #=> [2, 2] # 全ての１が取り除かれている

- * 演算子(joinメソッド)
[1,2] * 3 [1, 2, 1, 2, 1, 2] 数値オペランドはその分だけ連結
[1,2,3] * "-" => "1-2-3"　文字列はjoin
[1,2,3].join("-") => "1-2-3"

# for

a = [2,3,4]

for i in a do
  p 1
end
=> [2, 3, 4]

doは省略できる
識別しは複数指定できる

for i,j in [[1,2],[3,4]] do
  p i + j
end
3
7
=> [[1, 2], [3, 4]]

- forはすこー＠雨が作成されないので作られたコードはその後からも参照かのう
for i in [2,3,4] do
  bar = 1
end
bar =>1

ifもスコープなし
eachmはスコープ

[2,3,4].each do
  bar = 1
end
bar #error

# ハッシュ
-　名前で管理したいのはハッシュ

- ハッシュリテラル
  - 両側を{}
  a = {"a" => 1,"b" =>2 ,"c" => 3}
  => {"a"=>1, "b"=>2, "c"=>3}
  シンボルは高速、コード読みやすい
  {:hash => 22}
  {hash: 2}

  a = Hash.new(5)
  a[:foo]

   a = Hash[:foo1, 1, :foo2, 2, :foo3, 3]
   => {:foo1=>1, :foo2=>2, :foo3=>3}
   a = [[:foo1,1],[:foo2,2]].to_h => {:foo1=>1, :foo2=>2}

   ハッシュ引数
   def foo a,b,c
    c
   end
   foo(1,2,:foo1 =>1,:foo2 => 2) #３番目いこがハッシュと認識されうｒ
   {:foo1=>1, :foo2=>2}
   foo(1,2, {:foo1 =>1,:foo2 => 2})
   => {:foo1=>1, :foo2=>2}

    # 範囲
    - .. 右の式を含む　以下
    - ...　左の式を含む　みまんん
    範囲オブジェクト Range
    ^ include?
    == どうち、 === 包括
    (1..5).include?(3) => true
    (1..5).include?(6) => false
    (1..5) == 3=> false
    (1..5) === 3 => true
    (1..5) === 9 => false

    for i in "a".."z"
      p i
    end

    a = ["a","b","c","d","e"]
    p a[2,3] #=> ["c", "d"]
    p a[2..3] #=> ["c"]

    a = "abcdefg"
    p a[1] b
    p a[1..2] bc
    p a[1...2] b

## case
最後に評価した式の結果がcase全体の評価値となる
case 1,2 or条件

case 3
when 1,2 then; p 1
when 3,2 then; p 2
else p 3
end
#=>2

case 7
when 1...5 then; p 1 (1...5) === 7
when 5..10 then; p 2 (5...10) === 7
end

whileは条件を満たす間処理を実行する
i = 0
  while (0..4) === i
  p i
  i += 1
end
  <!-- 0
1
2
3
4
=> nil -->
untilは条件を満たすまで繰り返す
i = 0
  until i == 5 do
  p i
  i += 1
end
0
1
2
3
4
=> nil

後置できる
i = 0
begin
p i
i += 1
end while (0..4) === i
<!-- 0
1
2
3
4
=> nil -->

修飾詞としても記述できる(if的な)
i = 0
p i += 1 while (0..4) === i

## 正規表現とコマンド
/で囲むと正規表現
/Ruby/ #=> /Ruby/
%r(Ruby) #=> /Ruby/
Regexp.new "Ruby" #=> /Ruby/

# ===
指定した文字列とマッチしているかどうか論理値で返す
 /Ruby/ === "I love Ruby" #=> true

 === caseで

 p case "I love Ruby"
 when /Ruby/ then; "Ruby!"
 when /Java/ then; "Java!"
 end #=> "Ruby!"

# =~
- マッチした箇所を取得 マッチしなかったらnil
  /Ruby/ =~ "I love Ruby" #=> 7
  "I love Ruby" =~ /Ruby/ #=> 7
- =~同じスコープで組込変数を「$&」を参照する。
  - マッチした文字列より前の文字列を参照するには「$`」
  - マッチした後の文字列「＄'」
  - マッチ順は`&'
  /bb/ =~ "aabbcc"
  p $` #=> "aa"
  p $& #=> "bb"
  p $' #=> "cc"

- マッチするとは
  - 正規表現でR u b yというよう箱が用意されて、判定する文字が一文字ずつ送られる
  - 判定はマッチしないと全部からになる
  - 全部の箱が埋まってたらマッチ
  - 正規表現^は頭 行末は$
  - /^bb$/ =~ "aabbcc" #=> nil
  - 並列って感じ|
    - reg = /^(aa|bb)c$/
    - reg === "aac" # => true
    - reg === "bbc" #=> true
  - [] 文字列の集合を指定できる
    - reg = /a[bcd]e[fg]h/
    - bcdかfgのどれか
    - reg === "abegh" #=> true
## 正規表現記号とオプション
- -を使うと一気に指定できる
- /a[1-5]z/ === "a2z" #=> true
- /a[b-d]z/ === "abz" #=> true

- 正規表現記号
  - .  改行を除く任意の一文字 mオプションが指定された場合は改行もマッチ
  - \d 数字
  - \D 数字以外の文字
  - \w 英数字と_
  - \W 英数字と_ 以外
  - \s 空白文字(/t, /n, /r, /f)
  - \S 空白文字(/t, /n, /r, /f)以外
  - \A 先頭の文字、改行の有無に影響されない
  - \z 末尾の文字、改行の有無に影響されない
  - \Z 末尾の文字、改行があればその改行の直前にマッチ
  - /a\db/ === "a2b" #=> true
- 繰り返し
 - *
   - 直前の文字の0回以上の繰り返し
   /a*b/ === "ab" #=> true
   /a*b/ === "aab" #=> true
   /a*b/ === "aaab" #=> true
 - +
   - 直前の文字の1回以上の繰り返し
   /a+b/ === "aab"  #=> true
   /a+b/ === "aaab" #=> true
 - {m}
   - 直前の文字のm回の繰り返し
   /a{2}b/ === "aab" #=> true
 - {m,}
   - 直前の文字の最低m回の繰り返し
   /a{2,}b/ === "aab" #=> true
 - {m,n}
   - 直前の文字の最低m回、最高n会の繰り返し
   /a{2,3}b/ === "aab"  #=> true
  - /a(bc)*d/ === "abcbcd"
 - グループ化した正規表現にマッチした結果は特殊変数$1、$2、$3といった$数字で取り出すことができる　正規表現の後＄方参照

%r|(http://www(\.)(.*)/)| =~ "http://www.xyz.org/" #=> 0
$1 #=> "http://www.xyz.org/" :http://で始まる
$2 #=> "." :wwwの次のピリオド
$3 #=> "xyz.org" www.の次の任意の文字の０位上
$4 #=> nil nil
$0はスクリプト名
# 正規表現オプpション
- i 大文字小文字区別しない
- o一度だけ式展開を使い
- x パターン中の空白と改行を無視するまた、#移行をコメントとして無視する
- m 正規表現記号が改行にもマッチする
/ruby/ === "RUBY" #=> false
/ruby/i === "RUBY" #=> false
/a.*b/ === "a\nb" # => false
/a.*b/m === "a\nb" #=> false]

#　コマンド出力
- バッククォーテおで囲まれた文字列はコマンドとして解釈されOSニワタサレテジッコウサレル
- $?

puts `date +%Y/%m/%d` 今日の日付

# ブロックとPROC
- kuro-ja

def func x
  x + yield
end #=> :func
p func(1){2} #=> 3
ブロックの実行結果yield
ブロックはスコープを生成する

def func y
  y + yield
end

func (1) do
  x = 2
end

p x #NameError

- ブロックの実行中にブロックの中で変数xに値を代入している。元のスコープとは別の場所に確保されるので于bロックの外からは参照できない

- ブロックは波かっこ{}の代わりにdo endで記述できます(１行か複数)

- クロージャとしてのブロック
def func y
  y + yield
end
x = 2
p func(1) {x+=2}　#=> 5
p x #=> 4

- ブロックの外でxに２を代入
メソッドに無特区わたす
xを更新xは武録の外のと一緒

- 値ではなく変数そのもが共有されるてん
対応付はユーザが指定でいない束縛という 環境の束縛クロージャ
クロージャ　遅延評価や公開かんすうなど様々な場面で使える
クロージャｇ呼び出し元の変数を処理に持ち込む手段

# ブロックのフォーマットと判例
def func a,b
  a + yield(b, 3)
end

p func(1,2){|x,y| x + y }
=> 6

# ブロックはんてい
def func
  return 1 if block_given?
  2
end

p func(){} #=> 1
p func #=> 2

# Proc
- ブロックをオブジェクトとして使いたい場合はProc使う　ブロックをobjエクトとして使う場合
Procのコンストラクタに無特区を指定する
proc = Proc.new{|x| p x}
=> #<Proc:0x00007ffcb38e2580@(irb):149>
proc.call(1)
=> 1

# カウンタで初期値がプログラムの冒頭で決定し、あとで操作する。

def get_counter start
  Proc.new{|up| start += up}
end
=> :get_counter
count_up = get_counter(1)
=> #<Proc:0x00007ffcb38143b0@(irb):152>
count_up.call(1)

irb(main):156:0> count_up.call(1)
=> 2
irb(main):157:0> count_up.call(1)
=> 3
irb(main):158:0> count_up.call(1)
=> 4
irb(main):159:0> count_up.call(1)
=> 5
irb(main):160:0> count_up.call(1)
=> 6

# Procとブロックを相互に変換する方法を見ていきましょう

def func x
  x + yield
end

proc = Proc.new{2}
func(1, &proc)

irb(main):161:0> def func x
irb(main):162:1>   x + yield
irb(main):163:1> end
=> :func
irb(main):164:0>
irb(main):165:0> proc = Proc.new{2}
func(1, &proc)=> #<Proc:0x00007ffcb38586f0@(irb):165>
irb(main):166:0> func(1, &proc)
=> 3

- procオブジェクトとして受け取るには&をつけた引数でprodオブジェクトを参照できる

def func x, &proc
  x + proc.call
end

func(1) do
  2
end #=> 3
# lamnbda
- lambdaはProcインスタンスを生成ますうがProcとは異なる動きします
lmd = lambda{|x| p x}
=> #<Proc:0x00007ffcb0149c40@(irb):203 (lambda)>
lmd = -> (x) { p x }
=> #<Proc:0x00007ffcb3863bb8@(irb):204 (lambda)>
lmd.call(1) => 1
上のように作成したProcインスタンスはlambdaと呼ばれ、
おブジェクトかされていない分proc.newで作成されたインスタンスよりもメソッドに近い
procはreturnでスコープをサッシュつ
lambdaはreturnすると呼び出し元に復帰する
procはfuncも終了している

def func
  proc = Proc.new{return 1}
  proc.call
  2
end
=> 1
def func
  proc = lambda{return 1}
  proc.call
  2
end
=> 2

p1 = Proc.new{|x ,y| y}
p1.call(1)
=> nil
 p1.call(1,2)
=> 2

p1 = lambda{|x ,y| y}
p1.call(1) #ArgumentErrorメソっどぉ同じ

p1 = ->(x,y){p x + y}
p1.call(1,2) #=> 3
配列の走査
[1,2,3].each do |value|
  value
end => [1, 2, 3]

[3,4,5].each_with_index do |value, index|
  p value + index
end

3
5
7

{:a => 1, :b =>2 }.each do |key, value|
  p "#{key}:#{value}"
end

"a:1"
"b:2"

{:a => 1, :b =>2 }.each_key do |key|
  p "#{key}"
end
"a"
"b"

{:a => 1, :b =>2 }.each_value do |value|
  p "#{value}"
end
"1"
"2"

{:a => 1, :b =>2 }.each_key do |key|
  "#{key}"
end

("a"..."z").each do |value|
  p value
end

2.upto(5).each do |i|
  p i
end
2
3
4
5

5.downto(2).each do |i|
  p i
end
5
4
3
2

4.times do |i|
  p i
end
0
1
2
3
=> 4

# スレッド
thread

t = Thread.new do
  p "start"
  sleep 5
  p "end"
end

p "wait"
t.join

3.times do |i|
  Thread.start(i) do |index|
    p "thread-#{index} start"
  end
end
sleep 1

# ファイバ
- 複数のタスクをきりかえ、並行処理する機能
- スレッドはOSトカ切り替えるが、ファイバはプログラマが切り替える

f = Fiber.new do
  (1..3).each do |i|
    Fiber.yield i
  end
  nil
end

p f.resume 1 # ファイバに処理が移す　yieldが呼ばれると戻る　戻り値は引数を返す
p f.resume 2 # 続きから実行される
p f.resume 3 #
p f.resume nil # ファイバを抜けるかnil
p f.resume FiberError # それ以外はエラー

# 脱出公文と例外処理、大域脱出
## 脱出公文
- break continue next redo
next はちゅだんredoは現在の会を口返す

10.times do |i|
  next if i == 5
  print i, " "
end
-  0 1 2 3 4 6 7 8 9 => 10 #5がとぶ

10.times do |i|
  redo if i == 5
  print i, " "
end

# 例外処理
raise ArgumentError, "引数が不正です"
raise ArgumentError.new, "引数が不正です"

err =  ArgumentError.new("引数が不正です")
err
=> #<ArgumentError: 引数が不正です>
raise err
=> ArgumentError (引数が不正です)

raise "実行中にエラーが発生しました"
- RuntimeError (実行中にエラーが発生しました)

begin
  1 / 0
  p 1
rescue
  p 0
end =>0

rescueの後にelseをかくと例外が発生しなかったときensureアはどっちでも時効する

begin
  p 1
rescue
  p 0
else
  p 2
ensure
  p 3
end
1
2
3

1/0 rescue p 1 =>1

def foo
 -1 / 0
rescue
p 1
end
foo =>1

rescueは例外クラスを指定しないとStandarderrorとそのサブクラスが補足の対象となった

Exception
- ScriptErrpr 文法エラー
  - SyntaxError
- SgnalException 補足していないシグナルを受けた
- StandardError　
  - ArgumentError　引数の数が合わない、値が正しくない
  - RuntimeError 特定の例外クラスに該当しないエラー、例外クラスを省略したraise
  - NameError 未定義のローカルヘンスウや定数を参照
    - NoMethodError 未定義メソッドよひだし
  - ZeroDivisionError 整数に対す整数の0でじょさんを行った

begin
 1/0
rescue ZeroDivisionError => e
 p e.backtrace
end

begin
 1/0
rescue ZeroDivisionError
 p $!.class
 raise
end
=>ZeroDivisionError (divided by 0)

begin
 1/0
rescue ZeroDivisionError
 p $!.class
end=> 最後の例外を参照ZeroDivisionError

# retry
a = 0
- 元に委ねず、自分で解決したいばあはretry再度beginを実行ensureは位階しか行われzん
begin
  b = 1 / a
rescue ZeroDivisionError
  a += 1
  retry
ensure
  p b
end => 1

rescueは複数でっきるけど、際d世にマッチしたものしか実行されぬ
begin
  1/0
rescue
  p 1
rescue ZeroDivisionError
  p 2
end => 1

だんだん広くした方がええで
# catchとthrow
正常でも処理を抜けたいとき
def foo
  throw :exit
end

catch(:exit) {
  foo
  p 1
}

p 2

# throw実行されると同名のラベルが指定されているcatchまで呼び出しスタックをたどり、ブロック内の後続処理をスキップする
- throwにはラベル以外に値を引数でわたう
- throwに私た値の戻り値とすることができます
def bar
  catch(:calc) do
    throw :calc, 100
  end
end
p bar　#=> 100