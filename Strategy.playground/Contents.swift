protocol SortStrategy{
    func sort(list: [String])
}
extension SortStrategy{
    func sort(list: [String]){
        print("Default Implementation")
    }
}
class QuickSort: SortStrategy{
    func sort(list: [String]) {
        print("Quick Sort")
    }
}

class ShellSort: SortStrategy{
    func sort(list: [String]) {
        print("Shell Sort")
    }
}

class MergeSort: SortStrategy{
    func sort(list: [String]) {
        print("Merge Sort")
    }
}

class SortedList{
    
    private var list: [String] = []
    private var sortStrategy: SortStrategy?
    
    func setSortStrategy(sortStrategy: SortStrategy){
            self.sortStrategy = sortStrategy
    }
    func add(name: String){
        self.list.append(name)
    }
    func sort(){
        self.sortStrategy?.sort(list: self.list)
        print(self.list)
    }
}

var students : SortedList = SortedList()
students.add(name: "Samual")
students.add(name: "Jimmy")
students.add(name: "Sandra")
students.add(name: "Vivek")
students.add(name: "Anna")
students.setSortStrategy(sortStrategy: QuickSort())
students.sort()
students.setSortStrategy(sortStrategy: ShellSort())
students.sort()


