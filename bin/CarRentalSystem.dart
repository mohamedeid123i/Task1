import 'dart:io';
import 'Car.dart';
import 'Booking.dart';
import 'Customer.dart';
class CarRentalSystem {
  List<Car> cars = [];
  List<Customer> customers = [];
  List<Booking> bookings = [];

  void addCar(Car car) {
    cars.add(car);
  }

  void createBooking(Booking booking) {
    if (booking.car.isAvailable) {
      bookings.add(booking);
      booking.customer.addBooking(booking);
      booking.car.isAvailable = false;
      print("Booking created successfully!");
    } else {
      print("Car is not available!");
    }
  }

  void displayAvailableCars() {
    print("Available Cars:");
    for (var car in cars) {
      if (car.isAvailable) {
        car.displayCarInfo();
      }
    }
  }

  void returnCar(String bookingId) {
    var booking = bookings.firstWhere((b) => b.bookingId == bookingId);
    if (!booking.isReturned) {
      booking.isReturned = true;
      booking.returnDate = DateTime.now();
      booking.car.isAvailable = true;
      print("Car returned successfully!");
    } else {
      print("Booking not found or car already returned!");
    }
  }

}