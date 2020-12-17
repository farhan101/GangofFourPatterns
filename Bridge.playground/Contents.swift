
protocol Color{
    func colorIt()
}
class Red: Color{
    func colorIt(){
       print(" Color Red.")
    }
}
class Green: Color{
    func colorIt(){
        print(" Color Green.")
    }
}
protocol Shape{
    func draw()
}

class Circle: Shape{
    let color: Color?
    init(color: Color) {
        self.color = color
    }
    func draw() {
        print("Drawing Circle with")
        color?.colorIt()
    }
}

class Rectangle: Shape{
    let color: Color?
    init(color: Color) {
        self.color = color
    }
    func draw() {
        print("Drawing Rectangle with")
        color?.colorIt()
    }
}

var shape: Shape = Circle(color: Red())
shape.draw()
shape = Rectangle(color: Green())
shape.draw()
