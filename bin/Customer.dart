import 'dart:io';

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

abstract class Car {
  String id;
  String model;
  String type;
  double basePrice;
  bool isAvailable;
  double lateReturnPenalty;

  Car(this.id, this.model, this.type, this.basePrice,
      {this.isAvailable = true, this.lateReturnPenalty = 0});

  double calculateRentalCost(int days);

  void displayCarInfo() {
    print("Car ID: $id");
    print("Model: $model");
    print("Type: $type");
    print("Base Price: $basePrice");
    print("Available: ${isAvailable ? "Yes" : "No"}");
  }
}

class EconomyCar extends Car {
  EconomyCar(String id, String model)
      : super(id, model, "Economy", 100, lateReturnPenalty: 200);

  @override
  double calculateRentalCost(int days) => days * basePrice;
}

class SportsCar extends Car {
  double luxuryFee = 100;

  SportsCar(String id, String model)
      : super(id, model, "Sports", 200, lateReturnPenalty: 300);

  @override
  double calculateRentalCost(int days) => (days * basePrice) + luxuryFee;
}

class ElectricCar extends Car {
  double chargingFee = 50;

  ElectricCar(String id, String model)
      : super(id, model, "Electric", 75, lateReturnPenalty: 150);

  @override
  double calculateRentalCost(int days) => (days * basePrice) + chargingFee;
}

class Booking {
  String bookingId;
  Customer customer;
  Car car;
  DateTime startDate;
  DateTime endDate;
  DateTime? returnDate;
  int rentalDays;
  double cost = 0;
  double totalCost = 0;
  bool isReturned = false;

  Booking(this.bookingId, this.customer, this.car, this.startDate, this.rentalDays)
      : endDate = startDate.add(Duration(days: rentalDays));

  void calculateTotalCost() {
    int lateDays = returnDate != null ? returnDate!.difference(endDate).inDays : 0;
    double lateFee = (lateDays > 0) ? lateDays * car.lateReturnPenalty : 0;
    cost = car.calculateRentalCost(rentalDays);
    totalCost = cost + lateFee;
  }
  void displayBookingDetails() {
    calculateTotalCost();
    print("Booking ID: $bookingId");
    print("Customer: ${customer.name}");
    print("Car: ${car.model}");
    print("Start Date: $startDate");
    print("End Date: $endDate");
    print("Rental Days: $rentalDays");
    print("Late Return Penalty: \$${car.lateReturnPenalty}");
    print("Total Cost: \$$totalCost");
  }
}

class Invoice {
  String invoiceId;
  Booking booking;
  double totalAmount;
  double? additionalFees;
  DateTime issuedDate;

  Invoice(this.invoiceId, this.booking, this.totalAmount)
      : issuedDate = DateTime.now();

  void generateInvoice() {
    print("========== INVOICE ==========");
    print("Invoice ID: $invoiceId");
    print("Customer: ${booking.customer.name}");
    print("Car: ${booking.car.model}");
    print("Rental Period: ${booking.rentalDays} days");
    print("Base Rental Cost: \$${booking.totalCost}");
    if (additionalFees != null) {
      print("Additional Fees: \$${booking.car.lateReturnPenalty}");
    }
    print("Total Amount: \$${(totalAmount + (additionalFees ?? 0))}");
    print("Issued Date: $issuedDate");
  }
}

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

  void generateReport() {
    for (var booking in bookings) {
      booking.displayBookingDetails();
    }
  }
}
