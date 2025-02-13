import 'Booking.dart';
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
    print("Base Rental Cost: \$${booking.car.basePrice}");
    if (additionalFees != null) {
      print("Additional Fees: \$${booking.car.lateReturnPenalty}");
    }
    print("Total Amount: \$${(totalAmount + (additionalFees ?? 0))}");
    print("Issued Date: $issuedDate");
  }
}