extension Int {
    func square() -> Int {
        return self * self
    }
}

let number = 4

print(number.square())

protocol TestB {
    func methodA()
}

struct Item: TestB {
    func methodA() {
        print("안녕하세요!! 문법 문제입니다!!")
    }
}

let item = Item()
print(item.methodA())

protocol Summable {
    func sum() -> Int
}

extension Summable {
    func sum(with other: Self) -> Int {
        return self.sum() + other.sum()
    }
}

struct Number: Summable {
    func sum() -> Int {
        return self.value
    }
    var value: Int
    
}

let number1 = Number(value: 3)
let number2 = Number(value: 5)

print(number1.sum(with: number2)) // 출력 : 8
