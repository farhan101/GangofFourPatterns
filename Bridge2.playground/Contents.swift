

protocol DataObject{
    func nextRecord()
    func priorRecord()
    func addRecord(name: String)
    func deleteRecord(name: String)
    func showRecord()
    func showAllRecord()
}

class CustomersData: DataObject{
    var list: [String] = []
    var _nextRecord : Int = 0
    init() {
        list.append("Jim Jones")
        list.append("Samual Jackson")
        list.append("Allen Good")
        list.append("Ann Stills")
        list.append("Lisa Giolani")
    }
    func nextRecord() {
        if _nextRecord <= list.count - 1{
            _nextRecord += 1
        }
    }
    
    func priorRecord() {
        if _nextRecord < 0{
            _nextRecord -= 1
        }
    }
    
    func addRecord(name: String) {
        list.append(name)
    }
    
    func deleteRecord(name: String) {
        if let index = list.firstIndex(of: name){
            list.remove(at: index)
        }
        
    }
    
    func showRecord() {
        print(list[_nextRecord])
    }
    
    func showAllRecord() {
        print(list)
    }
}

class CustomerBase{
    var dataObject: DataObject?
    var group: String?
    init(group: String) {
        self.group = group
    }
    func next(){
        dataObject?.nextRecord()
    }
    func prior(){
        dataObject?.priorRecord()
    }
    func add(name: String){
        dataObject?.addRecord(name: name)
    }
    func delete(name: String){
        dataObject?.deleteRecord(name: name)
    }
    func show(){
        dataObject?.showRecord()
    }
    func showAll(){
        print("Records for group: ", group!)
        dataObject?.showAllRecord()
    }
}

class Customers: CustomerBase{
    override init(group: String) {
        super.init(group: group)
    }
    override func showAll() {
        print("===============================")
        super.showAll()
        print("===============================")
    }
}

var customers: Customers = Customers(group: "Heavy Group")
customers.dataObject = CustomersData()
customers.show()
customers.next()
customers.show()
customers.add(name: "Farhan")
customers.showAll()
customers.delete(name: "Farhan")
customers.showAll()
