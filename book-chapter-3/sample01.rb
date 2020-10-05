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
p func v1 => "foo1foo2"
p v1 => "foo1"
