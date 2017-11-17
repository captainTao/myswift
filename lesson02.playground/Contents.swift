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
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]并集
oddDigits.intersection(evenDigits).sorted()
// []交集
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]差集
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]去交集

//== 集合是否相等
//.isSubset(of:) 是否是子集
//.isSuperset(of:) 是否是父集
//.isStrictSubset(of:) 真子集, 真包含于
//.isStrictSuperset(of:) 真父集，真包含
//.isDisjoint(with:) 是否有交集

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

//字典

//创建一个空字典
var namesOfIntegers = [Int: String]()

// 创建键值对
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
// namesOfIntegers 又成为了一个 [Int: String] 类型的空字典

//字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//如果键和值都有各自一致的类型，那么就不必写出字典的类型
var airport = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]//类型推断

//.count 字典的数据项数量
//.isEmpty 检查数量属性是否为0
//更新或者新增直接用下标就可以  airports["LHR"] = "London"
//更新 updateValue(_:forKey:)（有则更新，无则添加）这个方法返回更新值之前的原值
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}// 输出 "The old value for DUB was Dublin."

//airports["APL"] = "Apple Internation"
// 通过赋值为nil可以移除键值对
airports["APL"] = nil// APL 现在被移除了
//.removeValue(forKey:)移除键值对。在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回nil
if let removedValue = airports.removeValue(forKey: "DU") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin Airport."

//字典遍历，以元组形式返回
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//字典有.keys和.values的属性
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
//keys数组
let airportCodes = [String](airports.keys)
// airportCodes 是 ["YYZ", "LHR"]
//values数组
let airportNames = [String](airports.values)
// airportNames 是 ["Toronto Pearson", "London Heathrow"]

//循环
//for...in
//while ...{}
//repeat{} while...  类似于do...while
//if...{} else {}
//if...{} else if...else {}
/*switch <#value#> {
case <#pattern#>:
    <#code#>
default:
    <#code#>
}*/

//复合匹配：用逗号隔开两个值即可
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", //列表过长还可以分行书写
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
//区间匹配  NO.1...NO.2
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//元组中的元素可以是值，也可以是区间。使用下划线（_）来匹配所有可能的值。
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// 输出 "(1, 1) is inside the box"

//case值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):  //把值绑定给了x
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// 输出 "on the x-axis with an x value of 2"

//case中where增加额外判断条件，where相当于过滤器
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):   //这个case覆盖了所有余下的可能性，所以不要写default
    print("(\(x), \(y)) is just some arbitrary point")
}
// 输出 "(1, -1) is on the line x == -y"

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):  //过滤了（x,0）(0,x)两种可能性
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// 输出 "On an axis, 9 from the origin"


//控制转移语句
//continue，立即停止本次循环，重新开始下次循环；仍还在循环体内
//break， 立即停止循环体
//fallthrough, 贯穿
//return
//throw

//continue下面的例子把一个小写字符串中的元音字母和空格字符移除，生成了一个含义模糊的短句：
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue  //上面条件立即跳过这次循环
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
// 输出 "grtmndsthnklk"

//break:检查numberSymbol是否是拉丁，阿拉伯，中文或者泰语中的1到4之一
let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// 输出 "The integer value of 三 is 3."

//fallthrough,贯穿，一直执行
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// 输出 "The number 5 is a prime number, and also an integer."
