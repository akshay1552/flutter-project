// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:codelab/components/custom_surfix_icon.dart';
import 'package:codelab/components/default_button.dart';
import 'package:codelab/components/form_error.dart';
import 'package:codelab/components/no_account_text.dart';
import 'package:codelab/constants.dart';
import 'package:codelab/screens/splash/sign_in/components/sign_form.dart';
import 'package:codelab/screens/splash/sign_in/sign_in_screen.dart';
import 'package:codelab/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                Fluttertoast.showToast(msg: "Email has been sent.");
                resetPassword();
                // Do what you want to do
                //setState(() {
                //Fluttertoast.showToast(msg: "Password Changed Successfully.");
                //Navigator.pushReplacement(context,
                //  MaterialPageRoute(builder: (context) => SignInScreen()));
                //});
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }

  resetPassword() async {
    String email = _emailController.text.toString();
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
