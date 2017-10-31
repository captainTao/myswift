//: Playground - noun: a place where people can play

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

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)//两不同类型不能直接相加，要先进行转换

//类型转换
let pi = 3.141592653
let integerPi = Int(pi)

let three = 3
let Dt = Double(three)

//类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//这个i只有为bool值的时候，编译才不会有错；i不会默认跟0去比较，这也是跟其他语言的区别
/*
let i = 1
if i {
    // 这个例子不会通过编译，会报错
}
*/
