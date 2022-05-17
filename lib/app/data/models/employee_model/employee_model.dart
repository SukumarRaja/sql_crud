class Employee {
  late String name;
  late String email;
  late String phone;
  late String address;

  Employee(this.name, this.email, this.phone, this.address);

  Employee.fromMap(Map map) {
    name = map[name];
    email = map[email];
    phone = map[phone];
    address = map[address];
  }
}
