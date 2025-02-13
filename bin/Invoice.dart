import 'Booking.dart';
class Invoice {
  String invoiceId;
  Booking booking;
  DateTime issuedDate;

  Invoice(this.invoiceId, this.booking,)
      : issuedDate = DateTime.now();

  void generateInvoice() {
    print("========== INVOICE ==========");
    print("Invoice ID: $invoiceId");
    print("Customer: ${booking.customer.name}");
    print("Car: ${booking.car.model}");
    print("Rental Period: ${booking.rentalDays} days");
    print("Base Rental Cost: \$${booking.car.basePrice}");
    print("Additional Fees: \$${booking.car.lateReturnPenalty}");
    print("Total Amount: \$${(booking.totalCost)}");
    print("Issued Date: $issuedDate");
  }
}