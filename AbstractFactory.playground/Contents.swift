//https://www.dofactory.com/net/abstract-factory-design-pattern

// The 'Abstract Factory' protocol
protocol ContinentFactory{
    func CreateHerbivore() -> Herbivore
    func CreateCarnivore() -> Carnivore
}

protocol Herbivore{
    
}
protocol Carnivore{
    func eat(h: Herbivore)
}

class AfricaFactory : ContinentFactory{
    
    func CreateHerbivore() -> Herbivore {
        return  Wildebeest()
    }
    
    func CreateCarnivore() -> Carnivore {
        return Lion()
    }
    
}
class AmericaFactory : ContinentFactory{
    func CreateHerbivore() -> Herbivore {
        return Bison()
    }
    func CreateCarnivore() -> Carnivore {
        return Wolf()
    }
}

class Wildebeest : Herbivore{
    
}
class Lion : Carnivore{
    func eat(h: Herbivore) {
        print(type(of: self), " eats " , type(of: h))
    }
}

class Bison : Herbivore{
}
class Wolf : Carnivore{
    
    func eat(h: Herbivore) {
        print(type(of: self), " eats " , type(of: h))
    }
}
class AnimalWorld{
    
    var _herbivore: Herbivore?
    var _carnivore: Carnivore?
    init(factory: ContinentFactory) {
        _carnivore = factory.CreateCarnivore()
        _herbivore = factory.CreateHerbivore()
    }
    func runFoodChain(){
        _carnivore?.eat(h: _herbivore!)
    }
}


// Create and run the African animal world
var africa: ContinentFactory  = AfricaFactory()
var world: AnimalWorld  =  AnimalWorld(factory: africa)
world.runFoodChain()

// Create and run the American animal world
var america: ContinentFactory  = AmericaFactory()
world = AnimalWorld(factory: america)
world.runFoodChain()

