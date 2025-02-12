abstract class Car {
  String id;
  String model;
  double basePrice;
  bool isAvailable;

  Car(this.id, this.model, this.basePrice, {this.isAvailable = true});

  double calculateRentalCost(int days);
  void displayCarDetails(){
    print("Car ID : $id ");
    print("Car Model : $model ");
    print("Car Rental price : $basePrice ");
    print("Car Availability : $isAvailable ");
  }

}

class EconomyCar extends Car {
  EconomyCar(super.id, super.model, super.basePrice);

  @override
  double calculateRentalCost(int days) => days * basePrice;
}

class SportsCar extends Car {
  double luxuryFee;

  SportsCar(super.id, super.model, super.basePrice, this.luxuryFee);

  @override
  double calculateRentalCost(int days) => (days * basePrice) + luxuryFee;
}

class ElectricCar extends Car {
  double chargingFee;

  ElectricCar(super.id, super.model, super.basePrice, this.chargingFee);

  @override
  double calculateRentalCost(int days) => (days * basePrice) + chargingFee;
}
