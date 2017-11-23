//: Playground - noun: a place where people can play


//函数
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//函数举例
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
//    return "Hello again, " + person + "!"   可以直接写这一句
}
print(greet(person: "Anna"))
// 打印 "Hello, Anna!"
print(greet(person: "Brian"))
// 打印 "Hello, Brian!"

//无参
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// 打印 "hello, world"

//多参
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greet(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// 打印 "Hello again, Tim!"

//无返回值
func greet02(person: String) {
    print("Hello, \(person)!")
}
greet02(person: "Dave")
// 打印 "Hello, Dave!"

//多重返回值
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// 打印 "min is -6 and max is 109"

// 可选元组返回类型，返回可能为没有值
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
