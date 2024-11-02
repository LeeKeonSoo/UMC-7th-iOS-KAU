class BankAccount {
    let accountNumber: String
    private var balance: Double
    
    init (accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) {
        balance += amount
        
        print("Deposited \(amount). Current balance: \(balance)")
    }
    
    func withdraw(amount: Double) {
        if (amount > balance) {
            print("Insufficent funds. Current balance: \(balance)")
        } else {
            balance -= amount
            print("Withdrew \(amount). Current balance: \(balance)")
        }
    }
        
}



let account = BankAccount(accountNumber: "123-456", initialBalance: 100.0)

account.deposit(amount: 50.0) // 출력: "Deposited 50.0. Current balance: 150.0"
account.withdraw(amount: 30.0) // 출력: "Withdrew 30.0. Current balance: 120.0"
account.withdraw(amount: 200.0) // 출력: "Insufficient funds. Current balance: 120.0"


struct Car {
    let make: String
    let model: String
    let year: Int
    var mileage: Double
    var isRunning: Bool
    
    init(make: String, model: String, year: Int, mileage: Double, isRunning: Bool) {
        self.make = make
        self.model = model
        self.year = year
        self.mileage = mileage
        self.isRunning = isRunning
    }
    
    mutating func start() {
        if isRunning == false {
            isRunning = true
            print("차 시동 걸림.")
        } else { print("차 이미 시동 중.") }
    }
    
    mutating func stop() {
        if isRunning {
            isRunning = false
            print("차 시동 꺼짐.")
        } else { print("차 이미 꺼짐. ") }
    }
    
    mutating func drive(distance: Double) {
        if isRunning {
            mileage += distance
            print("이동거리 \(distance)km. 현재 milage: \(mileage)km")
        } else { print("이동 불가능. 차 시동 꺼짐.") }
    }
    
}

var myCar = Car(make: "한국", model: "KIA", year: 2024, mileage: 15000.0, isRunning: false)

myCar.start() // 출력: "차 시동 걸림."
myCar.drive(distance: 100) // 출력: "이동거리 100 km. 현재 mileage: 15100 km"
myCar.stop() // 출력: "차 시동 꺼짐."
myCar.drive(distance: 50) // 출력: "이동 불가능. 차 시동 꺼짐."
myCar.start() // 출력: "Car started."
myCar.start() // 출력: "차 이미 시동 중."

actor OrderProcessor {
        private var orders: [String] = []
    
    // 주문 추가 메서드
    func addOrder(_ order: String) {
            orders.append(order)
            print("추가된 주문: \(order)")
    }

    // 주문 처리 메서드
    func processOrder() {
        if orders.isEmpty {
                print("처리할 주문 없음")
        } else {
                let order = orders.removeFirst()
                print("처리된 주문: \(order)")
        }
    }

    // 현재 남아있는 주문 출력 메서드
    func printAllOrder() {
        if orders.isEmpty {
                print("남아 있는 주문 없음")
        } else {
                print("남아 있는 주문: \(orders.joined(separator: ", "))")
        }
    }
}

let orderProcessor = OrderProcessor()

func processing() async {
    await orderProcessor.addOrder("Pizza")
    await orderProcessor.addOrder("Burger")
    await orderProcessor.addOrder("Pasta")

    await orderProcessor.processOrder()
    await orderProcessor.processOrder()

    await orderProcessor.printAllOrder()
    await orderProcessor.processOrder()
    await orderProcessor.processOrder()
    await orderProcessor.printAllOrder()

}

Task {
    await processing()
}

