import 'dart:io';
import 'Car.dart';
import 'Booking.dart';
import 'CarRentalSystem.dart';
class Customer {
  String id;
  String name;
  String phone;
  String email;
  String address;
  List<Booking> bookingHistory = [];

  Customer(this.id, this.name, this.phone, this.email, this.address);

  void addBooking(Booking booking) {
    bookingHistory.add(booking);
  }

  void displayCustomerInfo() {
    print("Customer ID: $id");
    print("Name: $name");
    print("Phone: $phone");
    print("Email: $email");
    print("Address: $address");
    print("Booking history:");
    for (var booking in bookingHistory) {
      booking.displayBookingDetails();
    }
  }

  void register(CarRentalSystem system) {
    system.customers.add(this);
  }
}

