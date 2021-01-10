

class Approver{
    fileprivate var successor: Approver?
    func setSuccessor(successor: Approver){
        self.successor = successor
    }
    func processRequest(purchase: Purchase){
        fatalError("Implement processRequest in derived class.")
    }
}

class Director: Approver{
    override func processRequest(purchase: Purchase) {
        if purchase.amount <= 10000{
            print("Approved by Director")
        }else if let _ = super.successor{
            super.successor?.processRequest(purchase: purchase)
        }
    }
}

class VicePresident : Approver{
    override func processRequest(purchase: Purchase) {
        if purchase.amount > 10000 && purchase.amount <= 20000{
            print("Approved by Vice President")
        }else if let _ = super.successor{
            super.successor?.processRequest(purchase: purchase)
        }
    }
}

class President : Approver{
    override func processRequest(purchase: Purchase) {
        if purchase.amount  > 20000{
            print("Approved by President")
        }else if let _ = super.successor{
            super.successor?.processRequest(purchase: purchase)
        }
    }
}

class Purchase{
    var amount: Double
    init(amount: Double) {
        self.amount = amount
    }
}


let larry : Approver = Director()
let sam   : Approver = VicePresident()
let tammy : Approver = President()

larry.setSuccessor(successor: sam)
sam.setSuccessor(successor: tammy)

let purchase = Purchase(amount: 150000)
larry.processRequest(purchase: purchase)
