import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/employee_model/employee_model.dart';

class DbHelper {
  Database? database;

  //get db
  Future<Database> get getDb async {
    if (database != null) {
      return database!;
    }
    database = await initDb();
    return database!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "employee.db");
    var db = await openDatabase(path, version: 1, onCreate: onCreate);
    return db;
  }

  void onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Employee(id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT,address TEXT )");
    print("Created tables");
  }

  void saveEmployee(Employee employee) async {
    var dbClient = await getDb;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Employee(name, email, phone, address ) VALUES(' +
              '\'' +
              employee.name +
              '\'' +
              ',' +
              '\'' +
              employee.email +
              '\'' +
              ',' +
              '\'' +
              employee.phone +
              '\'' +
              ',' +
              '\'' +
              employee.address +
              '\'' +
              ')');
    });
  }

  Future<List<Employee>> getEmployees() async {
    var dbClient = await getDb;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = [];
    for (int i = 0; i < list.length; i++) {
      employees.add(Employee(list[i]["name"], list[i]["email"],
          list[i]["phone"], list[i]["address"]));
    }
    print(employees.length);
    return employees;
  }
}
