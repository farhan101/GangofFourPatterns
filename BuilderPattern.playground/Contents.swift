import UIKit

class Vehicle{
    
    var vehicleType: String?
    var parts = [String : String]()
    
    init(type: String?){
        self.vehicleType = type
    }
    
    func showVehicle(){
        print("*****Vehicle: ", vehicleType!)
        print("Frame: ", parts["frame"]!)
        print("Engine: ", parts["engine"]!)
        print("Wheels: ", parts["wheels"]!)
        print("Doors: ", parts["doors"]!)
        
    }
    
}

protocol VehichleBuilder{
    
    var vehicle: Vehicle? {get set}
    init()
    func BuildFrame()
    func BuildEngine()
    func BuildWheels()
    func BuildDoors()
    
}

class CarBuilder: VehichleBuilder{
     var vehicle: Vehicle?
    
    required init() {
        self.vehicle = Vehicle(type: "Car")
    }
    func BuildFrame() {
        vehicle?.parts["frame"] = "Car Frame"
    }
    
    func BuildEngine() {
        vehicle?.parts["engine"] = "1300 cc"
    }
    
    func BuildWheels() {
        vehicle?.parts["wheels"] = "4"
    }
    
    func BuildDoors() {
        vehicle?.parts["doors"] = "Doors"
    }
    
    
}

class MotorCycleBuilder: VehichleBuilder{
    
    var vehicle: Vehicle?
    
    required init() {
        self.vehicle = Vehicle(type: "Motor Cycle")
    }
    func BuildFrame() {
        vehicle?.parts["frame"] = "Motor Cycle Frame"
    }
    
    func BuildEngine() {
        vehicle?.parts["engine"] = "1300 cc"
    }
    
    func BuildWheels() {
        vehicle?.parts["wheels"] = "2"
    }
    
    func BuildDoors() {
        vehicle?.parts["doors"] = "N/A"
    }
    
    
}

var builder: VehichleBuilder = CarBuilder()

builder.BuildDoors()
builder.BuildEngine()
builder.BuildFrame()
builder.BuildWheels()
builder.vehicle?.showVehicle()

builder = MotorCycleBuilder()

builder.BuildDoors()
builder.BuildEngine()
builder.BuildFrame()
builder.BuildWheels()
builder.vehicle?.showVehicle()
