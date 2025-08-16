import 'vehicle.dart';

void main() {
  print("hello world");
  Vehicle vehicleObj = Vehicle(color: "Green");
  print(vehicleObj.color);
  vehicleObj.drive();
  Car objCar = Car(color: "white");
  print(objCar.color);
  objCar.drive();
  objCar.Drifting();
  //  print(objCar._airbags); private variable can not be accessed
  //overriding
  objCar.drive();
}
