import Foundation

func calculateTotalPrice(totalPrice: Int, tipPrice: Int) -> Int {
    return totalPrice + tipPrice
}

func checkTemperatrue(temperature: Int) {
    if temperature > 30 {
        print("덥다")
    } else if temperature > 15 {
        print("적당하다")
    } else {
        print("춥다")
    }
}

func printTravelBudget(cityName: String, days: Int, budget: Int) {
    print(days * budget)
}

func getCurrentDate() {
    let date = Date()
    
    print(date)
}

getCurrentDate()


let addValue = {
    var sum: Int = 0
    
    for i in 1 ... $0 {
        sum += i
    }
    
    return sum
}

print(addValue(10))
