import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_crud/app/data/models/employee_model/employee_model.dart';
import 'package:sql_crud/app/data/storage/db_helper/db_helper.dart';
import 'package:sql_crud/app/ui/screens/employee_list/employee_list.dart';

class EmployeeController extends GetxController {
  static EmployeeController get to => EmployeeController();

  //TextEditingController for Employee

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  Employee employee = Employee("", "", "", "");

  storeEmployeeDetails(
      {required String name,
      required String email,
      required String phone,
      required String address}) {
    var employees = Employee(name, email, phone, address);
    var dpHelper = DbHelper();
    dpHelper.saveEmployee(employees);
    Get.to(const EmployeeDetails());

    Get.snackbar("Success", "Employee Saved Successfully");
  }

  final formKey = GlobalKey<FormState>();

  Future<List<Employee>> fetchEmployeesFromDatabase() async {
    var dbHelper = DbHelper();
    Future<List<Employee>> employees = dbHelper.getEmployees();
    return employees;
  }
}
