# ローカル
foo = 1
def bar
  foo
end

bar
baz
# irb(main):009:0> foo = 1
# => 1
# irb(main):010:0> def bar
# irb(main):011:1>   foo
# irb(main):012:1> end
# => :bar
# irb(main):014:0> bar
# NameError (undefined local variable or method 'foo' for main:Object)
# irb(main):014:0> baz
# NameError (undefined local variable or method 'baz' for main:Object)

#　グローバル
$foo = 1
def bar
  $foo
end

bar
$baz
# irb(main):016:0> $foo = 1
# => 1
# irb(main):017:0> def bar
# irb(main):018:1>   $foo
# irb(main):019:1> end
# => :bar
# irb(main):020:0>
# irb(main):021:0> bar
# => 1
# irb(main):022:0> $baz
# => nil