//: Playground - noun: a place where people can play

import UIKit
//let定义常量
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//如果你需要把一个值转换成其他类型，请显式转换。
let label = "The width is"
let width = 94
let widthLabel = label + String(width)

//有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠。
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//使用方括号[]来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号。
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

//要创建一个空数组或者字典，使用初始化语法。
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//控制流
//使用if和switch来进行条件操作，使用for-in、for、while和repeat-while来进行循环。包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的。
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore) //11


//在if语句中，条件必须是一个布尔表达式——这意味着像if score { ... }这样的代码将报错，而不会隐形地与 0 做对比
var optionalString: String? = "Hello"
print(optionalString == nil) //false
//可以一起使用if和let来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者是nil以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
var optionalName: String? = "captain"
var greeting = "Hello!"
if let name = optionalName { //if let name为真，则执行后面的内容
    greeting = "Hello, \(name)" //hello,captain
}
//另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)" //Hi John Applessed


//switch支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
//运行switch中匹配到的子句之后，程序会退出switch语句，并不会继续向下运行，所以不需要在每个子句结尾写break。
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?") //Is it a spicy red pepper?
default:
    print("Everything tastes good in soup.")
}


//用for-in来遍历字典，需要两个变量来表示每个键值对。字典是一个无序的集合，所以他们的键和值以任意顺序迭代结束。
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var lei = "Prime"
for (kind, numbers) in interestingNumbers { //Immutable value 'kind' was never used; consider replacing with '_' or removing it
    for number in numbers {
        if number > largest {
            largest = number
            lei = kind
        }
    }
}
print(largest) //25
print(lei) //square


//repeat while和do.while的意思类似
var n = 2
while n < 100 { //2^n<100，求出2^n,并且再*2；结果为64*2=128
    n = n * 2
}
print(n)
//换成repeat...while
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


//可以在循环中使用..<来表示范围;使用..<创建的范围不包含上界，如果想包含的话需要使用...。
var total = 0
for i in 0..<4 { //(0,4)
    total += i
}
print(total) //6

var totl = 0
for i in 1...4 {  //[1,4]
    totl += i
}
print(totl) //10


//函数和闭包

//使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值的类型。
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person:"Bob", day: "Tuesday")

//默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

//使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)//这儿用.sum来表示第三个元素
print(statistics.2)//这儿用.2表示第三个元素

//函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)

//函数可以嵌套。被嵌套的函数可以访问外侧函数的变量。
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen() //15

//函数作为返回值；返回函数又称为闭包
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7) //8

//函数做参数传入另一个函数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool { //判断一个list中的每个元素
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool { //判断单个元素与10比较的true or false
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen) //true，判断numbers中是否有元素<10;lessThanTen函数作为参数传入
lessThanTen(number:12)

//可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离。
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

//如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers) //[60, 57, 21, 36]

//可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
//let sortedNumbers = numbers.sort { $0 > $1 } //这儿有错
//print(sortedNumbers) //"()\n"


//对象和类
class Shape {
    var numberOfSides = 10
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//使用点语法来访问实例的属性和方法。
var shape = Shape()
print(shape.numberOfSides) //10
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//类需要init初始化一些东西，like python
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//如果你需要在删除对象之前进行一些清理工作，使用deinit创建一个析构函数。
//子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所以你可以忽略父类。
//子类如果要重写父类的方法的话，需要用override标记——如果没有添加override就重写父类方法的话编译器会报错。编译器同样会检测override标记的方法是否确实在父类中。
class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() ->  Double {
        return sideLength * sideLength //27.04
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()//27.04
test.simpleDescription()//"A square with sides of length 5.2."

//作业：创建NamedShape的另一个子类Circle，构造器接收两个参数，一个是半径一个是名称，在子类Circle中实现area()和simpleDescription()方法

//除了储存简单的属性之外，属性可以有 getter 和 setter 。
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter) //9.3
triangle.perimeter = 9.9
print(triangle.sideLength) //3.3
//在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显式的设置一个名字。
//注意EquilateralTriangle类的构造器执行了三步：
//1.设置子类声明的属性值
//2.调用父类的构造器
//3.改变父类定义的属性值。其他的工作比如调用方法、getters 和 setters 也可以在这个阶段完成。

//如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用willSet和didSet。
//比如，下面的类确保三角形的边长总是和正方形的边长相同。
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
//处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加?。如果?之前的值是nil，?后面的东西都会被忽略，并且整个表达式返回nil。否则，?之后的东西都会被运行。在这两种情况下，整个表达式的值也是一个可选值。
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


//枚举和结构体

//使用enum来创建一个枚举，枚举可以包含方法。

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
//练习： 写一个函数，通过比较它们的原始值来比较两个Rank值。

//默认情况下，Swift 按照从 0 开始每次加 1 的方式为原始值进行赋值，不过你可以通过显式赋值进行改变。在上面的例子中，Ace被显式赋值为 1，并且剩下的原始值会按照顺序赋值。你也可以使用字符串或者浮点数作为枚举的原始值。使用rawValue属性来访问一个枚举成员的原始值。

//使用init?(rawValue:)初始化构造器在原始值和枚举值之间进行转换。

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
//枚举的成员值是实际值，并不是原始值的另一种表达方法。实际上，如果没有比较有意义的原始值，你就不需要提供原始值。

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
//练习： 给Suit添加一个color()方法，对spades和clubs返回“black”，对hearts和diamonds返回“red”。

//注意，有两种方式可以引用Hearts成员：给hearts常量赋值时，枚举成员Suit.Hearts需要用全名来引用，因为常量没有显式指定类型。在switch里，枚举成员使用缩写.Hearts来引用，因为self的值已经知道是一个suit。已知变量类型的情况下你可以使用缩写。

//一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值和原始值是不同的：枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。

//例如，考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息。

enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Failure(message):
    print("Failure...  \(message)")
}
//练习： 给ServerResponse和switch添加第三种情况。

//注意日升和日落时间是如何从ServerResponse中提取到并与switch的case相匹配的。

//使用struct来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//练习： 给Card添加一个方法，创建一副完整的扑克牌并把每张牌的 rank 和 suit 对应起来。


//协议和扩展

//使用protocol来声明一个协议。
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//类、枚举和结构体都可以实现协议。
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
//练习： 写一个实现这个协议的枚举。

//注意声明SimpleStructure时候mutating关键字用来标记一个会修改结构体的方法。SimpleClass的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）。

//使用extension来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是从外部库或者框架引入的一个类型，使得这个类型遵循某个协议。

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
//练习： 给Double类型写一个扩展，添加absoluteValue功能。

//你可以像使用其他命名类型一样使用协议名——例如，创建一个有不同类型但是都实现一个协议的对象集合。当你处理类型是协议的值时，协议外定义的方法不可用。

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // 去掉注释可以看到错误
//即使protocolValue变量运行时的类型是simpleClass，编译器会把它的类型当做ExampleProtocol。这表示你不能调用类在它实现的协议之外实现的方法或者属性。


//错误处理

//使用采用Error协议的类型来表示错误。

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
//使用throw来抛出一个错误并使用throws来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函数会立刻返回并且调用该函数的代码会进行错误处理。

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
//有多种方式可以用来进行错误处理。一种方式是使用do-catch。在do代码块中，使用try来标记可以抛出错误的代码。在catch代码块中，除非你另外命名，否则错误会自动命名为error。

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
//练习： 将 printer name 改为"Never Has Toner"使send(job:toPrinter:)函数抛出错误。

//可以使用多个catch块来处理特定的错误。参照 switch 中的case风格来写catch。

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
//练习： 在do代码块中添加抛出错误的代码。你需要抛出哪种错误来使第一个catch块进行接收？怎么使第二个和第三个catch进行接收呢？

//另一种处理错误的方式使用try?将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为nil。否则的话，结果会是一个包含函数返回值的可选值。

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
//使用defer代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。使用defer，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执行时机截然不同。

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

//泛型

//在尖括号里写一个名字来创建一个泛型函数或者类型。

func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem(repeating: "knock", numberOfTimes:4)
//你也可以创建泛型函数、方法、类、枚举和结构体。

// 重新实现 Swift 标准库中的可选类型
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
//在类型名后面使用where来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])
//练习： 修改anyCommonElements(_:_:)函数来创建一个函数，返回一个数组，内容是两个序列的共有元素。

//<T: Equatable>和<T> ... where T: Equatable>是等价的。

