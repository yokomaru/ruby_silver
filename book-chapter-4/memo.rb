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

# インスタンスメソッドはクラス、インスタンス変数はインスタンｓに