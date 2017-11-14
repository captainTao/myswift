//: Playground - noun: a place where people can play

//变量和字符串：

//接受用户的输入可以使用 readLine():
let theInput = readLine()
//变量声明：
var x = 0.0, y = 0.0, z = 0.0
//类型标注：
var red, green, blue: Double
//语句结尾不需要分号，但在同一行内写多条独立的语句的时候，必须用分号；

//访问不同类型的最大最小值
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型

/*在32位平台上，Int 和 Int32 长度相同。
在64位平台上，Int 和 Int64 长度相同。*/
//无符号整型UInt
//Double表示64位浮点数
//Float表示32位浮点数

//swift有类型推断：当推断浮点数的类型时，Swift 总是会选择 Double 而不是Float
//一个十进制数，没有前缀
//一个二进制数，前缀是0b
//一个八进制数，前缀是0o
//一个十六进制数，前缀是0x

//如果一个十进制数的指数为 exp，那这个数相当于基数和10^exp的乘积：
//1.25e2 表示 1.25 × 10^2，等于 125.0。
//1.25e-2 表示 1.25 × 10^-2，等于 0.0125。

//如果一个十六进制数的指数为exp，那这个数相当于基数和2^exp的乘积：
//0xFp2 表示 15 × 2^2，等于 60.0。
//0xFp-2 表示 15 × 2^-2，等于 3.75。

//下面的这些浮点字面量都等于十进制的12.1875：
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//为增加可读性，整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//两不同类型不能直接相加，要先进行转换
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//类型转换
let pi = 3.141592653
let integerPi = Int(pi)

let three = 3
let Dt = Double(three)

//类型别名 typealias
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//这个i只有为bool值的时候，编译才不会有错；i不会默认跟0去比较，这也是跟其他语言的区别
//let i = 1
//if i {  //'Int' is not convertible to 'Bool'
//    // 这个例子不会通过编译，会报错
//}

//元组值内容分解
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")// 输出 "The status code is 404"
print("The status message is \(statusMessage)")// 输出 "The status message is Not Found"
//如果只需要部分值，用下划线：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)") // 输出 "The status code is 404"
//通过下标来访问元组中的单个元素
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
//可以在定义元组的时候给单个元素命名，通过名字来获取这些元素的值：
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")// 输出 "The status code is 200"
print("The status message is \(http200Status.description)")// 输出 "The status message is OK"
print(http200Status.1) //"OK"

//缺省值
var serverResponseCode: Int? = 404 // serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil // serverResponseCode 现在不包含值
var surveyAnswer: String? // surveyAnswer 被自动设置为 nil

//条件和赋值放在同一条语句中：
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出 "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 输出 "4 < 42 < 100"

//下面的例子展示了可选类型 String 和隐式解析可选类型 String 之间的区别：
let possibleString: String? = "An optional string." //可选类型
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string." //隐式解析
let implicitString: String = assumedString  // 不需要感叹号

//错误处理：
/*
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
*/

//断言：assert(_:_:file:line:)
let age = -3
assert(age <= 0, "A person's age cannot be less than zero")

//一元正号符（+）不做任何改变地返回操作数的值：
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6

//组合赋值
var a = 1
a += 2
//复合赋值运算没有返回值，let b = a += 2这类代码是错误

//三目运算符
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)// rowHeight 现在是 90

//空合运算：
let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName //第一个值为空，取第二个值
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName //第一个非空，则取第一个
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"

// 两个字符串均为空并等价。
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法

//通过isEmpty属性来判断该字符串是否为空
if emptyString.isEmpty {
    print("Nothing to see here")
}
//.characters属性来获取每一个字符的值
for character in "Dog!🐶" { //测试这儿也可以不用.characters
    print(character)
}
//连接字符： +，  +=
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2  // instruction 现在等于 "look over there"

//append()方法将一个字符附加到一个字符串变量的尾部：
let exclamationMark: Character = "!"
welcome.append(exclamationMark)   // welcome 现在等于 "hello there!"

//变量前加\变成字符串
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"  //这儿必须把int转换为Double
// message 是 "3 times 2.5 is 7.5"

//转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein" // "Imageination is more important than knowledge" - Enistein
//\u： unicode标量
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496

//计算字符串的长度.count
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")  //可以直接用word.count
// 打印输出 "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.count)")
// 打印输出 "the number of characters in café is 4"

//字符串下标 String.Index
//总结：startindex和endIndex的用法不一样
let greeting = "Guten Tag!"
greeting.startIndex //string.index, 目前看样子不是一个数字，暂且当一个数字
greeting[greeting.startIndex]// G

//试图获取越界索引对应的 Character，将引发一个运行时错误
//greeting[greeting.endIndex] // error
//greeting.index(after: endIndex) // error

//greeting[greeting.index(greeting.startIndex)]//这样写会报语法错误，需要before, after,offset

greeting.index(before: greeting.endIndex) //String.index
greeting[greeting.index(before: greeting.endIndex)]// !
greeting[greeting.index(after: greeting.startIndex)]// u

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // a


//插入和删除
//调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符；
//调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。

var welcom = "hello"
welcom.insert("!", at: welcom.endIndex) // welcom 变量现在等于 "hello!"

welcom.insert(contentsOf: "there", at: welcom.index(before: welcom.endIndex))
//welcom.insert(contentsOf: "there", at: welcom.index(before: welcom.endIndex))，也可以这样写
// welcom 变量现在等于 "hello there!"

//调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符
//调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串。

welcom.remove(at: welcom.index(before: welcom.endIndex)) //返回的值为"!"
print(welcom)
// welcom 现在等于 "hello there"

let range = welcom.index(welcom.endIndex, offsetBy: -6)..<welcom.endIndex
welcom.removeSubrange(range)// welcom 现在等于 "hell"
print(welcom)//hell
//注意： 您可以使用 insert(_:at:)、insert(contentsOf:at:)、remove(at:) 和 removeSubrange(_:) 方法在任意一个确认的并遵循 RangeReplaceableCollection 协议的类型里面，如上文所示是使用在 String 中，您也可以使用在 Array、Dictionary 和 Set 中

//字符串/字符可以用等于操作符(==)和不等于操作符(!=)
//hasPrefix(_:)/hasSuffix(_:)方法来检查字符串是否拥有特定前缀/后缀

