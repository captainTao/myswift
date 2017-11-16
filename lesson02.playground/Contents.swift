//: Playground - noun: a place where people can play


//集合：Arrays、Sets和Dictionaries
//（Arrays）是有序数据的集。集合（Sets）是无序无重复数据的集。字典（Dictionaries）是无序的键值对的集。

//数组Arrays

//创建数组,  .count计算数组长度
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印 "someInts is of type [Int] with 0 items."

someInts.append(3) //.append增加数组元素
// someInts 现在包含一个 Int 值
someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。

//创建默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]

//数组的加法：合并两个数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]
var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

//数组初始化
var shoppingList: [String] = ["Eggs", "Milk"]// shoppingList 已经被构造并且拥有两个初始项。

//.count计算数组长度
//isEmpty检查count属性是否为0
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// 打印 "The shopping list is not empty."

//.append()添加元素，+=添加元素
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
// shoppingList 现在有四项了
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList 现在有七项了

//修改元素，可以三项改成两项
shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList 现在有7项

//insert(_:at:)方法来在某个具体索引值之前添加数据项：
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList 现在有7项
// "Maple Syrup" 现在是这个列表中的第一项

//remove(at:)方法来移除数组中的某一项。这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项
let mapleSyrup = shoppingList.remove(at: 0)
// 索引值为0的数据项被移除
// shoppingList 现在只有6项，而且不包括 Maple Syrup
// mapleSyrup 常量的值等于被移除数据项的值 "Maple Syrup"

// 移除数组的最后一项
let apples = shoppingList.removeLast()

//数组遍历 for..in
//如果同时需要每个数据项的值和索引值，可以使用enumerated()方法来进行数组遍历。enumerated()返回一个由每一个数据项索引值和数据值组成的元组。我们可以把这个元组分解成临时常量或者变量来进行遍历：
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}

//a == a(自反性)
//a == b意味着b == a(对称性)
//a == b && b == c意味着a == c(传递性)

//集合Set
//初始化一个空集
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印 "letters is of type Set<Character> with 0 items."

//字面量创建
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop", "Classical"]，重复元素会去重
// favoriteGenres 被构造成含有三个初始值的集合

//set类型推断
var favoriteGenre: Set = ["Rock", "Classical", "Hip hop"]
//.count  集合长度
//.isEmpty  集合是否为空
//.insert(_:)  添加新元素在结尾
favoriteGenre.insert("Jazz")
//.remove(_:)  删除最后一个元素，返回被删除的值
favoriteGenre.remove("Rock")
//.removeAll()  删除所有元素
//.contains(_:)  检查Set中是否包含一个特定的值
//遍历：for...in
//排序：.sorted()

//使用intersection(_:)交集
//使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
//使用union(_:)并集
//使用subtracting(_:)差集
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
