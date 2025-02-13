import 'dart:io';

import 'Booking.dart';

class Report{
  Booking booking;
  Report(this.booking);
  void generateReport() {
    File reportFile = File('rental_report.txt');
    StringBuffer buffer = StringBuffer();
    buffer.writeln("========== RENTAL REPORT ==========");
      buffer.writeln("Booking ID: ${booking.bookingId}");
      buffer.writeln("Customer: ${booking.customer.name}");
      buffer.writeln("Car: ${booking.car.model}");
      buffer.writeln("Rental Cost: \$${booking.cost}");
      buffer.writeln("Start Date : ${booking.startDate}");
      buffer.writeln("End Date : ${booking.endDate}");
      int lateDays = booking.returnDate != null ? booking.returnDate!.difference(booking.endDate).inDays : 0;
      double lateFee = (lateDays > 0) ? lateDays * booking.car.lateReturnPenalty : 0;
      buffer.writeln("Late Penalty: \$$lateFee");
      buffer.writeln("Total Cost: \$${booking.totalCost}");
      buffer.writeln("------------------------------");
    reportFile.writeAsStringSync(buffer.toString());
    print("Rental report generated successfully!");
  }

}