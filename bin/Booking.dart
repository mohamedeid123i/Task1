import 'Car.dart';
import 'Customer.dart';
class Booking {
  String bookingId ;
  Customer customer;
  Car car;
  DateTime startDate;
  DateTime endDate;
  DateTime? returnDate;
  int rentalDays;
  double cost = 0;
  double totalCost = 0;
  bool isReturned = false;

  Booking(this.bookingId,this.customer, this.car, this.startDate, this.rentalDays)
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
    print("Customer: ${customer.id}");
    print("Car: ${car.model}");
    print("Start Date: $startDate");
    print("End Date: $endDate");
    print("Rental Days: $rentalDays");
    int lateDays = returnDate != null ? returnDate!.difference(endDate).inDays : 0;
    double lateFee = (lateDays > 0) ? lateDays * car.lateReturnPenalty : 0;
    print("Late Penalty: \$$lateFee");
    print("Total Cost: \$$totalCost");
  }
}
