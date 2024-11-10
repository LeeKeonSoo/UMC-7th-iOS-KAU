class Rectangle {
    let width: Double
    let height: Double
    let unit: String = "cm"
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func info() {
        print("사각형의 너비: \(width)cm, 높이: \(height)cm")
    }
    
    func area() {
        print("사각형의 면적: \(width * height) \(unit)")
    }
    
}
