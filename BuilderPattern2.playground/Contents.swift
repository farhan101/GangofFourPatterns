import UIKit

protocol Item{
    func name() -> String?
    func packing() -> Packing?
    func price() -> Float?
}

protocol Packing{
    func pack() -> String?
}

class Wrapper: Packing{
    func pack() -> String? {
        return  "Wrapper"
    }
}

class Bottle: Packing{
    func pack() -> String? {
        return  "Bottle"
    }
}


class Burger: Item{
    func name() -> String? {
        fatalError("")
    }
    
    func price() -> Float? {
        fatalError("")
    }
    
     func packing() -> Packing?{
        return Wrapper()
    }
}


class ColdDrink: Item{
    func name() -> String? {
        fatalError("Implement in sub class")
    }
    
    func price() -> Float? {
        fatalError("Implement in sub class")
    }
    
     func packing() -> Packing?{
        return Bottle()
    }
}


class ChickenBurger: Burger{
    override func name() -> String? {
        return "Chicken Burger"
    }
    override func price() -> Float? {
        return 250.0
    }
}
class VegBurger: Burger{
    override func name() -> String? {
        return "Veg Burger"
    }
    override func price() -> Float? {
        return 200.0
    }
}

class Coke: ColdDrink{
    override func name() -> String? {
        return "Coke"
    }
    override func price() -> Float? {
        return 55.0
    }
}
class Fanta: ColdDrink{
    override func name() -> String? {
        return "Fanta"
    }
    override func price() -> Float? {
        return 55.0
    }
}

class Meal{
    var items: [Item]
    
    init(){
        items = []
    }
    func addItem(item: Item){
        self.items.append(item)
    }
    func showItems(){
        for item in items{
            print(item.name()!)
            print(item.price()!)
            print(item.packing()!.pack()!)
        }
    }
}


class MealBuilder{
    func prepareVegMeal() -> Meal{
        let meal = Meal()
        meal.addItem(item: VegBurger())
        meal.addItem(item: Fanta())
        return meal
    }
    func prepareNonVegMeal() -> Meal{
        let meal = Meal()
        meal.addItem(item: ChickenBurger())
        meal.addItem(item: Coke())
        return meal
    }
}

let builder: MealBuilder = MealBuilder()
var meal = builder.prepareVegMeal()
meal.showItems()


meal = builder.prepareNonVegMeal()
meal.showItems()
