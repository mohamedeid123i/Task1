import 'dart:io';
import 'dart:math';
import 'Customer.dart';
import 'CarRentalSystem.dart';
import 'Report.dart';
import 'Car.dart';
import 'Booking.dart';
import 'Invoice.dart';
 bool ispalindrome(int x){
   int d = int.parse(x.toString().split('').reversed.join());
   if(d == x) return true;
   return false;
 }

 List remove(List<int>s,int val){
   s.removeWhere((element) => element == val);
   return s;
 }

 int length_of_the_last_word(String m){
   List b = m.split(" ");
   return b.last.length;
 }

 int Summation_Max_Min(List<int> n){
   n.sort();
   return n.first + n.last;
 }

int findUnique(List<int> nums) {
  return nums.reduce((a, b) => a ^ b);
}
void main() {
  CarRentalSystem system = CarRentalSystem();

  system.addCar(EconomyCar("C001", "Toyota Corolla"));
  system.addCar(SportsCar("C002", "Ferrari 488"));
  system.addCar(ElectricCar("C003", "Tesla Model S"));

  while (true) {
    print("\n==== Car Rental System ====");
    print("1. Register Customer");
    print("2. Display Available Cars");
    print("3. Create Booking");
    print("4. View Customer Info");
    print("5. Create Invoice");
    print("6. Return Car");
    print("7. Exit");
    stdout.write("Choose an option: ");
    String bookingId;
    String customerId;
    String carId;

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        print("\nEnter your ID: ");
        String id = stdin.readLineSync()!;
        print("Enter your Name: ");
        String name = stdin.readLineSync()!;
        print("Enter your Phone: ");
        String phone = stdin.readLineSync()!;
        print("Enter your Email: ");
        String email = stdin.readLineSync()!;
        print("Enter your Address: ");
        String address = stdin.readLineSync()!;
        Customer customer= Customer(id, name, phone,email,address);
        customer.register(system);
        break;

      case "2":
        system.displayAvailableCars();
        break;

      case "3":
        print("\nEnter Booking ID: ");
        bookingId = stdin.readLineSync()!;
        print("\nEnter Customer ID: ");
        customerId = stdin.readLineSync()!;
        Customer customer = system.customers.firstWhere((c) => c.id == customerId);
        print("Enter Car ID: ");
        carId = stdin.readLineSync()!;
        Car car = system.cars.firstWhere((c) => c.id == carId);
        print("Enter Number of Days: ");
        int days = int.parse(stdin.readLineSync()!);
        Booking booking = Booking( bookingId,customer, car, DateTime.now(), days);
        system.createBooking(booking);
        break;

      case "4":
        print("\nEnter Customer ID: ");
        customerId = stdin.readLineSync()!;
        Customer customer = system.customers.firstWhere((c) => c.id == customerId);
        customer.displayCustomerInfo();
        break;
      case "5" :
        print("Enter Booking ID: ");
        bookingId = stdin.readLineSync()!;
        Booking booking = system.bookings.firstWhere((b) => b.bookingId == bookingId);
        print("Enter Invoice ID: ");
        String invoiceId = stdin.readLineSync()!;
        Invoice invoice = Invoice(invoiceId, booking);
        invoice.generateInvoice();
        break;
      case "6" :
        print("Enter Booking ID: ");
        bookingId = stdin.readLineSync()!;
        Booking booking = system.bookings.firstWhere((b) => b.bookingId == bookingId);
        system.returnCar(booking);
        Report report = Report(booking);
        report.generateReport();
      case "7":
        print("\nExiting... Thank you for using the Car Rental System!\n");
        return;

      default:
        print("\nInvalid choice! Please try again.\n");
    }
  }
}
