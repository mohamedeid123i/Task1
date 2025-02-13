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
