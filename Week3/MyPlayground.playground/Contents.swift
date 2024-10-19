import UIKit

var emptyDirectory: [String : Int] = [:]
var studentScore: [String : Int] = ["Jeong" : 100, "Marco" : 80]

let score = studentScore["Jeong"]
print(score as Any)

studentScore["Ming"] = 88
studentScore["Jeong"] = 80
studentScore["Jeong"] = nil

for (name, score) in studentScore {
    print("\(name)의 점수 \(score)")
}

if let oldValue = studentScore.updateValue(95, forKey: "Bob") {
    print("Bob의 이전 점수는 \(oldValue)점입니다.")
} else {
    print("Bob의 점수가 새로 추가되었습니다.")
}

if let value = studentScore.removeValue(forKey: "Jeong") {
    print("Jeong의 점수 \(value)가 삭제되었습니다.")
} else {
    print("Jeong의 점수를 찾을 수 없습니다.")
}

var classGrades: [Int: [String: Int]] = [
    1: ["Jeong": 85, "Ming": 90],
    2: ["Marco": 95, "Bob": 88]
]

var emptySet: Set<String> = []
var fruits: Set<String> = ["Apple", "Banana", "Orange"]

var colors: Set = ["Red", "Green", "Blue"]
colors.insert("Yellow")
print(colors)

colors.remove("Green")
print(colors)

let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]

let intersection = setA.intersection(setB)
print(intersection)

let unionSet = setA.union(setB)
print(unionSet)

let subtractingSet = setA.subtracting(setB)
print(subtractingSet)

let symmetricDifferenceSet = setA.symmetricDifference(setB)
print(symmetricDifferenceSet)

enum CompassDirection {
    case north
    case south
    case east
    case west
}

var direction: CompassDirection = .north

enum Weekday: Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

let today: Weekday = .friday
print("오늘은 \(today.rawValue)번째 요일입니다")

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrcode(String)
}

var productBarcode: Barcode = .upc(8, 1111, 5555, 2)
productBarcode = .qrcode("ABCDE")

print(productBarcode)

enum LightSwitch {
    case on
    case off
    
    mutating func toggle() {
        self = (self == .on) ? .off : .on
    }
}

var light: LightSwitch = .off
light.toggle()
print(light)

enum Beverage: CaseIterable {
    case coffee
    case tea
    case juice
}

for beverage in Beverage.allCases {
    print(beverage)
}

