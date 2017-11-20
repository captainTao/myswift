//: Playground - noun: a place where people can play


let firstHighScore = ("Mary", 9001)
print(firstHighScore.0) // Mary
print(firstHighScore.1) // 9001

let (firstName, firstScore) = firstHighScore
print(firstName) // Mary
print(firstScore) // 9001
//print和println的区别:第一个不换行，第二个带换行

let secondHighScore = (name: "James", score: 4096)
print(secondHighScore.name)
print(secondHighScore.score)
