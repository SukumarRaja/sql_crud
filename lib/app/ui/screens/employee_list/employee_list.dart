import 'package:flutter/material.dart';
import 'package:sql_crud/app/controllers/employee_controller/employee_controller.dart';

import '../../../data/models/employee_model/employee_model.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmployeeController.to.fetchEmployeesFromDatabase();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Employee>>(
          future: EmployeeController.to.fetchEmployeesFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(snapshot.data![index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                          Text(snapshot.data![index].email,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          const Divider()
                        ]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
              alignment: AlignmentDirectional.center,
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
