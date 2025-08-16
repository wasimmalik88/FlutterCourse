class Vehicle {
  String color = "Red";
  String cc = "1800cc";
  String model = "2020";
  String manufacturer = "honda";
  // Vehicle(String color) {
  //   this.color = color;
  // }
  //
  Vehicle({required String this.color}) {}

  void drive() {
    print("Vehical is driving");
  }
}

class Car extends Vehicle {
  bool auto = false;
  bool _airbags = true;
  Car({required String super.color}) {}
  void Drifting() {
    print("car is drifting");
  }

  @override
  void drive() {
    print("Vehical is driving");
    print(_airbags);
  }

  //polymorphism
  //override
  // redefine method in child class
  //overload
  //change type of parameter or number of parameters it can be done using optional parameters
  //Escapsulation
  //dart does not have proteected add _ to make it any variable private
}
