enum TransportType {
  clientTransport('Client Transport', "1"),
  companyTransport('Company Transport', '2');

  const TransportType(this.type, this.value);

  final String type;
  final String value;
}

enum VehicleType {
  PickUp('Pickup', "1"),
  Tractor('Tractor', '2'),
  Truck('Truck', '3');

  const VehicleType(this.type, this.value);

  final String type;
  final String value;
}

enum RegistrationType {
  Registered('Registered Vehicle', 'registered'),
  UnRegistered('Un-Registered Vehicle', 'unregistered');

  const RegistrationType(this.label, this.type);

  final String label;
  final String type;
}

enum LabourType {
  clientLabour('Client Labour', "1"),
  companyLabour('Company Labour', '2');

  const LabourType(this.type, this.value);

  final String type;
  final String value;
}

enum CommodityType {
  kisani('Kisani', 1),
  manditaxPaid('Mandi-Tax Paid', 2);

  const CommodityType(this.type, this.title);

  final String type;
  final int title;
}

enum PackageType {
  loose('Loose', "Loose"),
  juteBags('Jute bags', 'Jute bags'),
  plasticBags('Plastic bags', 'Plastic bags');

  const PackageType(this.type, this.title);

  final String type;
  final String title;
}
