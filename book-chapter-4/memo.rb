class Foo
  def initialize(a)
    @a = a
  end

  def method1
    @a
  end
end

foo1 = Foo.new(1)
foo2 = Foo.new(2)

p foo1.method1
p foo2.method1

# クラス名は大文字 クラス名は定数だから
# 指定されたクラス名で定数を作成する
# 定数に、定義されたクラスを格納する
# クラスはオブジェクト

a = Foo
a.new(1)
Foo = 1 # warn

# class式が評価されるとクラス定義の内部が評価される
# 内部もスキップされない

p 1

class Hoge
  p 2
end

p 3

# インスタンスメソッド
foo1.class = Foo

# irb(main):049:0> foo1.class == Foo
# => true
# irb(main):05

# クラス継承
##
class FooExt < Foo
  def initialize(a,b)
    @b = b
    super a
  end

  def method2(c)
    @a + @b + c
  end
end

fooExt = FooExt.new(3, 4)
p fooExt.method1
p fooExt.method2(5)

# FooExt.superclass == Foo
# => true

# インスタンスはクラスで定義されたインスタンスメソッドを呼び出すことができる
# 継承したクラスのインスタンスはスーパークラスで定義されたインスタンスメソッドを呼び出すことができる

# クラスからオブジェクトを生成することをインスタンス化

# メソッドとインスタンうシェンヒトツノ縫う
# メモリ上はインスタンスメソッドはクラスオブジェクトにインスタウンス変数はインスタンスに保持される
Foo
method1

foo1
@a = 1
foo2
@a = 2


# 継承したクラスオブジェクト
- 汎化 特化
foo1 fooExt　Fooで定義されたｋ

# 継承関係は横軸で表現する
# 右に行くほどより一般的、継承の上位の位置する


# メソッドの探索経路
# インスタンスメソッドを実行すると、インタプリタはクラスのクラスオブジェクトにしヒトツノ定さえパルテノ試そどっが存在すつか判定
# Foo Fooext
# メソッドがない場合　NomethodError

# 一中傷度をあげて継承の方向へ辿る
# 継承チェーンとmethod_missing

# superクラスを省略してクラスを定義すると自動的にObjectクラスを継承するう
Fooext Foo Object Kernel BasicObject validates_numericality_of :attribute, on: :create, message: "is not a number", if: proc { |obj| obj.condition? }}

継承チェーンを参照する方法
Foo.ancestors
Foo < Object
Foo > Object

.instance_methods(false) メソッド falseをかくとsuperに遡らない
.instance_variables　変数

継承チェーンにあるメソッドに別名をつけたらい取り消す方法
評価された時点でヒトツノの
別名 alias <新> <旧>

取り消す undef <メソッド名>,<メソッド名>

class Hoge
  def huga1; end
  def huga2; end
  alias huga3 huga1
  undef huga2
end

Hoge.instance_methods(false) [:fuga1, :huga3]

Nomethoderror　
Basicオブジェクトクラスのmethod_missingメソッドが呼び出される

class Hoge
  def method_missing(m, *args)
     p "called." + m.to_s
    super # 例外が発生するようにスーパークラすを呼び出す
  end
end
Hoge.new.no_method
# irb(main):027:0> Hoge.new.no_method
# "called.no_method"
# Traceback (most recent call last):
#         5: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
#         4: from /Users/suzukiyouko/.rbenv/versions/2.6.5/bin/irb:23:in `load'
#         3: from /Users/suzukiyouko/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):27
#         1: from (irb):24:in `method_missing'
# NoMethodError (undefined method `no_method' for #<Hoge:0x00007faedc135c80>)

# オープンクラス
# - 既にクラスオブジェクトが存在する場合はそのオブジェクトをもう一度開いて評価する

class Hoge
  def huga1; end
end

class Hoge
  def huga2; end
  alias huga3 huga1
  undef huga2
end

Hoge.instance_methods(false)
=> [:huga1, :huga3]

# 定義済みのクラスを咲いて擬できるのをオープンクラス　クラスの再オープン
標準定義されている組込クラスも再オープンできる

class String
  def huga; 1; end
end
irb(main):016:0> "mystgin".huga
=> 1

# スーパークラスを指定して再オープンする場合、スーパークラスはオープンする前のクラスと同じでなければダメ
class Foo; end
class Bar; end
class Baz < Foo
end

# 再オープン
class Baz < Bar
end
class Baz < Foo
end
class Baz
end

# Mix-in
多重継承を実現する機能のこと
できない
bar fooEXt Foo
# モジュールは単独ではインスタンスかできない、継承できない、クラスや他のモジュールに取り込むことができるmodule Bar def
module Bar
  def methodA
    @a
  end
end

Bar.ancestors=> [Bar]
Bar.instance_methods=> [:methodA]
Bar.new NoMethodError

モジュールはよ分ジェクトはinckudeで取り込める
class Foo; end
module Bar
  def methodA
    @a
  end
end

class FooExt < Foo
  include Bar
end

fooExt = FooExt.new(3, 4)
fooExt.methodA

FooExt.ancestors [FooExt, Bar, Foo, Object, Kernel, BasicObject]
FooExt.superclass Foo
FooExt.instance_methods(false) method2
inclide
# インタプリタは指定されたモジュールに対応する無名クラスを作成してスーパークラスの間に組み入れる
# 無名クラスはユーザに意識させないようにancestorsuperclassでも参照できないようになる
# 無名いくらすはincludeを実行したクラスの親に挿入される
# includeは後でincludeしたモジュールのメソッドが優先される
# 継承チェーンに挿入される
# そのクラウの中のメソッド定義が優先される

module M1
  def method1; 1;end
end

class C1
  include M1
  def method1; 2;end
end

C1.new.method1
# => 2

# 特異クラス
# 指定したインスタンス

foo1 = Foo.new(1)
def foo1.methodB
  @a + 100
end
foo1.methodB
=> 101
foo = Foo.new(1)
foo2.methodB

# 特異クラスに対応するオブジェクト指定されたインスタンスの生死柄本をスーパークラスとしてさす
# 得意管すがせしえされた後もインっすタウンは依然として元の生成もとをクラスとしてさす

特殊な書き方で参照はできる
foo1 = Foo.new(1)
singleton_class = class << foo1
self
end

singleton_class_class

class Foo; @a; end

foo1 = Foo.new(1)
class << foo1
  def methodC; @a + 200; end
end

foo1.methodC

class C1
  p self
  def method1
    self
  end
end

c1 = C1.new
p c1 == c1.method1

class C2
  def method1
    def method2
    end
  end
end

C2.instance_methods(false) #=> [:method1]
C2.new.method1 #=> :method2
C2.instance_methods(false) #=> [:method1, :method2]

class Foo; @a; end
# extend
foo1 = Foo.new(1)
class << foo1
  include Bar
end

p foo1.methodA

foo1.extend(Bar)
p foo1.methodA
=> 1

# prependを呼び出したクラスよりも先にモジュ０流に対してメソッドを短足を行う

module M1
  def method1; "m1"; end
end

class C1
  prepend M1
  def method1; "c1"; end
end

class C2
  include M1
  def method1; "c2"; end
end

p C1.new.method1
p C2.new.method1

rb(main):013:0> p C1.new.method1
"m1"
irb(main):014:0> p C2.new.method1
"c2"

irb(main):016:0> C1.ancestors
=> [M1, C1, Object, Kernel, BasicObject]
irb(main):017:0> C2.ancestors
=> [C2, M1, Object, Kernel, BasicObject]

module M1
  def method1
    super
    puts "m1"
  end
end

class C1
  prepend M1
  def method1
    puts "c1"
  end
end

irb(main):032:0> C1.new.method1
c1
m1
=> nil

prependを使う　既存の処理の追加の処理を挟める

# Refinments

class C
  def foo
    puts "C#foo"
  end

  def bar
    foo
  end
end

module M
  refine C do
    def foo
      puts s "C#foo in M"
    end
  end
end

using M
x = C.new
x.foo
x.bar

# クラスメソッド
# クラスオブジェクトをレシーバビエネッタ はよするメソッド
# クラスに対する得意クラスのｍえｓどお
foo_class=Foo.class #Class

# Classクラスをインスタンしてクラスが作れる
irb(main):076:0> SomeClass = Class.new
=> SomeClass
irb(main):077:0> SomeClass.new
=> #<SomeClass:0x00007f9cb2930ac0>

 # class,newでスーパクラスを指定できる　引数で
FooExt = Class.new(Foo) do
  def initialize(a,b)
    @b = b
    super(a)
  end

  def method2(c)
    @a + @b + c
  end
end

# Classクラスはクラスオブジェクトから中傷度上げたもの

class Class
  def c_method1
    1
  end
end

p Foo.c_method1
p String.c_method1
p Object.c_method1

irb(main):107:0> p String.c_method1
=> 1
irb(main):108:0> p Object.c_method1
=> 1

# moduleのスーパークラスはObject
class Foo
  def Foo.c_method2; 2; end
end
# => :c_method2
# => 2

class Foo
  def self.c_method3; 3; end
end
# => :c_method3
Foo.c_method3
# => 3

class Foo
  class << self
    def Foo.c_method4; 4; end
    def Foo.c_method5; 5; end
  end
end

Foo.c_method4
Foo.c_method5

irb(main):125:0> Foo.c_method4
=> 4
irb(main):126:0> Foo.c_method5
=> 5

module M4
  def method1; 1; end
end

class C4
  include M4
  extend M4
end

C4.method1
c4 = C4.new
c4.method1

irb(main):135:0> module M4
irb(main):136:1>   def method1; 1; end
irb(main):137:1> end
=> :method1
irb(main):138:0> class C4
irb(main):139:1>   include M4
irb(main):140:1>   extend M4
irb(main):141:1> end
=> C4
irb(main):142:0> C4.method1
=> 1
irb(main):143:0> c4 = C4.new
=> #<C4:0x00007f9cb2989350>
irb(main):144:0> c4.method1
=> 1

# publicが指定されたメソッドはどのインスタンスからも実行できる
# protectedは自分自身、またはサブクラスのインスタンスから実行できる
# privateはレシーバーつけた呼び出しはできない

class Baz1
  def public_method1; 1; end
  public
  def public_method2; 2; end
  protected
  def protected_method1; 1; end
  def protected_method2; 2; end
  private
  def private_method1; 1; end

  public
  protected
  private
end

Baz1.new.public_method1
Baz1.new.public_method2
Baz1.new.protected_method1
Baz1.new.protected_method2
Baz1.new.private_method1

# privateは
# selfなどレシーバを指定すると実行しようとするとエラー

class Baz2
  def public_method1;
    private_method1
  end

  def public_method2
     self.private_method1
  end

  private
  def private_method1; 1; end
end

Baz2.new.public_method1
# => 1
Baz2.new.public_method2 #NoMethodError

class Baz2Ext < Baz2
  public :private_method1
end

Baz2.new.private_method1 #NoMethodError
Baz2Ext.new.private_method1 #=> 1

# Kernel
## Rubyは本当の意味で関数はない全てメソッド

irb(main):171:0> self.class
=> Object

# kernelモジュールはprivatteだから呼び出せにあ

module Kernel
  private
  def my_func; end
end

my_func #=> nil
self.my_func #NoMethodError

class Object
  private
  def my_func; end
end

my_func #=> nil

# Kernelモジュールにprivate追加できるけど基本はObjectモデルにする

# 変数と定数
# ローカル変数とグローバす変数
# インスタンス変数
# クラス変数

v1 = 1
class Qux1
  p v1
end

v1 = 1
class Qux2
  v2 = 2
  def method1; v1;end
  def method2; v2;end
end

Qux2.new.method1
Qux2.new.method2

# メソッドにおける
# トップレベルに加えてクラス内部、メソッドの外部で定義された

トップレベルに加えてクラス内部メソッドの外部で定義されたローカル変数も参照できない
クラス定義と内部のメソッドはそれぞれ独立したスコープを持ち、相互に参照できない

# グローバル変数

$v1 = 1
class Qux2
  $v2 = 2
  def method1; $v1; end
  def method2; $v2; end
end
Qux2.new.method1

irb(main):220:0> Qux2.new.method1
=> 1
irb(main):221:0>  Qux2.new.method2
=> 2

# インスタンス変数
# @

@v1 = 1
class Qux3
  @v2 = 2
  def method1; @v1; end
  def method2; @v2; end
end
Qux3.new.method1
Qux3.new.method2
irb(main):236:0> Qux3.new.method1
=> nil
irb(main):237:0> Qux3.new.method2
=> nil

# インスタンス変数はインスタンスに値は格納される
# トップレベルで初期化された@v1はトップレベルビエネッタ のインスタンスに格納される
# @v2 はクラスの中で値が代入されているのでQue3クラスに格納される

# qux3 => Object
# @v2=2

# インスタンス変数はメソッドのように探索されないことを覚えておきましょう
# インスタンの中だけで完結シエ生元クラスも継承チェーン

class Qux4
  def v3 getter
    return @v3
  end

  def v3=(value) setter
    @v3 = value
  end
  def method1; @v3; end
end

qux4 = Qux4.new
qux4.v3 = 3

p qux4.v3
p qux4.method1

irb(main):270:0> qux4 = Qux4.new
=> #<Qux4:0x00007f9cb29b3830>
irb(main):271:0> qux4.v3 = 3
=> 3
irb(main):272:0>
irb(main):273:0> p qux4.v3
3
=> 3
irb(main):274:0> p qux4.method1
3
=> 3

attr_reader:
attr_writer:
attr_accessor:
attr: getter true setter

class Qux4
  attr_accessor :v3
  def method1; @v3; end
end
qux4 = Qux4.new
qux4.v3 = 3
qux4.v3
qux4.method1

# irb(main):279:0> qux4 = Qux4.new
# => #<Qux4:0x00007f9cb5147720>
# irb(main):280:0> qux4.v3 = 3
# => 3
# irb(main):281:0> qux4.v3
# => 3
# irb(main):282:0> qux4.method1
# => 3

class Qux4Ext < Qux4
end

qux4Ext = Qux4Ext.new
qux4Ext.v3 = 4
qux4Ext.v3

> #<Qux4Ext:0x00007f9cb2978c58>
irb(main):290:0> qux4Ext.v3 = 4
=> 4
irb(main):291:0> qux4Ext.v3
=> 4

# クラス変数
# インスタンス間で共有され。さらに自分自身のクラスとサブクラスでも共有される
class Qux5
  @@v1 = 1
  def v1; @@v1; end
  def v1=(value); @@v1=value; end
end

class Qux5Ext < Qux5
end

qux5 = Qux5.new
qux5.v1
qux5Ext = Qux5Ext.new
qux5Ext.v1

irb(main):301:0> qux5 = Qux5.new
=> #<Qux5:0x00007f9cb511ede8>
irb(main):302:0> qux5.v1
=> 1
irb(main):303:0> qux5Ext = Qux5Ext.new
=> #<Qux5Ext:0x00007f9cb514d710>
irb(main):304:0> qux5Ext.v1
=> 1

qux5Ext.v1 = 10
qux5.v1
Qux5.new.v1 = 100
qux5.v1

irb(main):315:0> qux5Ext.v1 = 10
=> 10
irb(main):316:0> qux5.v1
=> 10
irb(main):317:0> Qux5.new.v1 = 100
=> 100
irb(main):318:0> qux5.v1
=> 100

# サブクラスでどう名のクラス変数を宣言
class Qux6
  @@v1 = 1
  def v1; @@v1; end
end

class Qux6Ext < Qux6
  @@v1 = 2
end

Qux6.new.v1
irb(main):328:0> Qux6.new.v1
=> 2

# ネストしたスコープの定義
## 変数のスコープをみてきた
## 定数について復讐します

A = 1
p A
A = 2
p A

# irb(main):329:0> A = 1
# => 1
# irb(main):330:0> p A
# 1
# => 1
# irb(main):331:0> A = 2
# (irb):331: warning: already initialized constant A
# (irb):329: warning: previous definition of A was here
# => 2
# irb(main):332:0> p A
# 2

# 定数はメソッドの中で定義することができません
def func
  B = 2 SyntaxError
end

# 定数の代入値にクラス式やモジュールをしていした場合は、定数にクラスオブジェクトや
# モジュールオブジェクトが格納されること

module B; end
B::A = 1 # BのなかにAの宣言
B::A::A = 1 #TypeError
# 整数オブジェクトだからエラー
# モジュールオブジェクトからクラスオブジェクトに::演算子は有効

# Aはそれぞれ違う値が保持される
module M
  A = 1
  class B
    A = 2
  end
  class C
  end
end

M::A
M::B::A

# ネストした定数の参照
# 処理がクラス式やモジュールの内部に入っている時は
# そこから相対いちｄえ定数を参照することができる
# Mのなかに入っている時、単にAやBと書くだけで定数

irb(main):014:0> M::A
=> 1
irb(main):015:0> M::B::A
=> 2

module M
  p A
  p B::A
end

# irb(main):020:0> module M
# irb(main):021:1>   p A
# irb(main):022:1>   p B::A
# irb(main):023:1> end
# 1
# 2

irb(main):024:0> M.constants
=> [:B, :A, :C]
irb(main):025:0> M::B.constants
=> [:A]
irb(main):026:0> M::C.constants
=> []

module M
  p ::M::A
  p ::M::B::A
end

# irb(main):028:0> module M
# irb(main):029:1>   p ::M::A
# irb(main):030:1>   p ::M::B::A
# irb(main):031:1> end
# 1
# 2

module M
  class C
    p A
  end
end

#　クラスノナカデteisuuAヲサンショウスルトｃにはあないので、Cノソトガワノモッジュルきんぐにあるのが出てくる
# irb(main):033:0> module M
# irb(main):034:1>   class C
# irb(main):035:2>     p A
# irb(main):036:2>   end
# irb(main):037:1> end
# 1
# => 1

# 外側のモジュールにも存在しない場合、継承チェーンをたどる
class Foo
  A = 1
end

module Bar
  B = 2
end

class FooExt < Foo
  include Bar
  p A
  p B
end

# irb(main):059:0> class FooExt < Foo
# irb(main):060:1>   include Bar
# irb(main):061:1>   p A
# irb(main):062:1>   p B
# irb(main):063:1> end
# 1
# 2

# スーパークラスにも定数が見つからない場合はRubyのインタプリタは自分自身のクラスメソッド
# const_missing
# method_missinsの定数版
# const_missingのデフォルトはnameeror
# メソッドをサブクラスで上書きすることで定数が見つからない場合の動作を制御できる

module M
  def self.const_missing(id)
    1
  end
end

M::HOGE # 定数が見つからない時,１を返す

# irb(main):064:0> module M
# irb(main):065:1>   def self.const_missing(id)
# irb(main):066:2>     1
# irb(main):067:2>   end
# irb(main):068:1> end
# => :const_missing
# irb(main):069:0>
# irb(main):070:0> M::HOGE
# => 1

# これまでみてきたネストモジュールはクラスの名前空間的今日する
# トップレベルにクラスを定義すると名前が衝突する可能性が高くなる
#