
enum TaskStatus {
    case completed
    case pending
}

struct TaskItem {
    var title: String
    var status: TaskStatus
    var description: String
    var day:String
    var time :String
    
}

class ToDoList {
    var todoTitle = ""
    var mytodolist : [TaskItem]
    
    init(mytodolist : TaskItem){
        self.mytodolist = [mytodolist]
    }
    
    func addmytodo(mytodo: TaskItem){
        mytodolist.append(mytodo)
        
    }
    func readAll() {
        for item in self.mytodolist {
            print("Task Title: \(item.title), status: \(item.status), description \(item.description) day \(item.day) at \(item.time)")
            
        }
    }
    func getByStatus(status: TaskStatus) {
        
        let filterByStatusArray = self.mytodolist.filter({$0.status == status})
        for item in filterByStatusArray {
            print("Task: \(item.title), status: \(item.status)")
        }
    }
    
    func update(index:Int,change :TaskItem){
        if (index > self.mytodolist.count) {
            print("Item not found")
        } else {
            mytodolist[index] = change
            print("updated")
            
        }
    }
    
    func remove(index:Int){
        if (index > self.mytodolist.count || index < 0) {
            print("can't remove")
        }else{
            mytodolist.remove(at:index)
            print("removed")
        }
    }
    
    func getOneItem (byIndex : Int){
        let task = mytodolist[byIndex]
        print(task)
    }
}


var list = ToDoList(mytodolist: TaskItem.init(title: "FamilyDay", status: .pending, description: "dinner", day: "Friday", time: "9:00 PM"))
list.addmytodo(mytodo: TaskItem.init(title: "project", status: .pending, description: "projectSumission", day: "Thrusday", time: "11:00 AM"))
list.addmytodo(mytodo: TaskItem.init(title: "visit", status: .pending, description: "Campus", day: "Saturday", time: "6:00 PM"))
list.addmytodo(mytodo: TaskItem.init(title: "course", status: .completed, description: "Language Course", day: "Friday", time: "5:30 PM"))
list.readAll()
list.update(index: 1, change: TaskItem.init(title: "todo-project", status: .pending, description: "coding", day: "thursday", time: "9:00am"))
list.readAll()
list.remove(index: 2)
list.readAll()
list.getByStatus(status: .completed)
list.getOneItem(byIndex: 2)


