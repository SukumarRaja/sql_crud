import 'package:flutter/material.dart';
import 'package:sql_crud/app/controllers/employee_controller/employee_controller.dart';
import 'package:sql_crud/app/ui/widgets/common_button.dart';
import 'package:sql_crud/app/ui/widgets/common_textform_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: EmployeeController.to.formKey,
        child: Column(
          children: [
            CommonTextFormField(
              hintText: "Name",
              labelText: "Name",
              maxLength: 20,
              controller: EmployeeController.to.name,
              keyboardType: TextInputType.text,
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return 'Name field required';
                } else if (data.length < 3) {
                  return 'Name must be 3 character';
                }
                return null;
              },
            ),
            CommonTextFormField(
              hintText: "Email",
              labelText: "Email",
              maxLength: 25,
              controller: EmployeeController.to.email,
              keyboardType: TextInputType.emailAddress,
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return 'Email field required';
                } else if (!RegExp(
                        r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,6})+$")
                    .hasMatch(data)) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
            CommonTextFormField(
              hintText: "Phone",
              labelText: "Phone",
              keyboardType: TextInputType.phone,
              controller: EmployeeController.to.phone,
              maxLength: 10,
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return 'Phone field required';
                } else if (!RegExp(
                        r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,6})+$")
                    .hasMatch(data)) {
                  return 'Please enter valid phone';
                }
                return null;
              },
            ),
            CommonTextFormField(
              hintText: "Address",
              labelText: "Address",
              keyboardType: TextInputType.text,
              controller: EmployeeController.to.address,
              maxLength: 25,
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return 'Address field required';
                } else if (data.length < 5) {
                  return 'Address must be 5 character';
                }
                return null;
              },
            ),
            CommonButton(
              text: "Save",
              onPressed: () {
                if (EmployeeController.to.formKey.currentState!.validate()) {
                  EmployeeController.to.storeEmployeeDetails(
                      name: EmployeeController.to.name.text,
                      email: EmployeeController.to.email.text,
                      phone: EmployeeController.to.phone.text,
                      address: EmployeeController.to.address.text);
                } else {
                  return null;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
