import 'dart:math';
import 'Customer.dart';
import 'package:args/args.dart';
void main() {
  CarRentalSystem system = CarRentalSystem();

  system.addCar(EconomyCar("C001", "Toyota Corolla"));
  system.addCar(SportsCar("C002", "Ferrari 488"));
  system.addCar(ElectricCar("C003", "Tesla Model S"));

  Customer customer1 = Customer("CU001", "John Doe", "1234567890", "john@example.com", "123 Main St");
  customer1.register(system);

  Booking booking1 = Booking("B001", customer1, system.cars[0], DateTime.now(), 3);
  system.createBooking(booking1);

  Invoice invoice1 = Invoice("I001", booking1, booking1.cost);
  invoice1.generateInvoice();

  system.returnCar("B001");
  system!.generateReport();
}

/*void main() {
  String a = "dfgd gfdg jjjggg";
  List b = a.split(" ");
  print(b.last.length);
  int m = 12345;
  int d = int.parse(m.toString().split('').reversed.join());
  if(d == m) print("YES");
  else print("NO");
  List n = [1,2,3,4,5,5,6,5,2];
  n.sort();
  int j = n.first + n.last;
  print(j);
  n.removeWhere((element) => element == 5);
  n.reduce((a,b) => a^b);
  print(n);
}*/