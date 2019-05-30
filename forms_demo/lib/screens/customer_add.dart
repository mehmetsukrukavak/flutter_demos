import 'package:flutter/material.dart';
import 'package:forms_demo/mixins/validation_mixins.dart';
import 'package:forms_demo/models/customer.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final customer = new Customer();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              firstNameField(),
              lastNameField(),
              emailField(),
              passwordField(),
              submitButton()
            ],
          ),
        ));
  }

  Widget firstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Adınız", hintText: "Mehmet"),
      validator: validateFirstName,
      onSaved: (String value) {
        customer.firstName = value;
      },
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Soyadınız", hintText: "Kavak"),
      validator: validateLastName,
      onSaved: (String value) {
        customer.lastName = value;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email", hintText: "Mehmet@sirketiniz.com"),
      validator: validateEmail,
      onSaved: (String value) {
        customer.eMail = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Şifre", hintText: "şifre"),
      onSaved: (String value) {
        customer.password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          saveCustomer(customer);
        }
      },
    );
  }

  void saveCustomer(Customer customer) {
    print(customer.firstName);
  }
}
