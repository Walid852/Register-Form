import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final myController = TextEditingController();
final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
final TextEditingController _pass = TextEditingController();
final TextEditingController _date = TextEditingController();
final TextEditingController _confirmPass = TextEditingController();


String dropdownValue = 'Male';
String? selectedValue;

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("Register Form")),
      body: SafeArea(
        child: Material(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 150),
              child: Form(
                key: _formkey2,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            children: const [
                              Text(
                                "   Create Account !",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                              textInputAction: TextInputAction.done,
                              cursorColor: Colors.green,
                              decoration: const InputDecoration(
                                hintText: "Full Name",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.person_outline),
                                ),
                              ),
                              validator: (val) {
                                if (val!.isEmpty) return 'Empty';
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              cursorColor: Colors.green,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.email_outlined),
                                ),
                              ),
                              validator: (val) {
                                if (val!.isEmpty) return 'Empty';
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                              controller: _date,
                              decoration: const InputDecoration(
                                hintText: "Select your date of birth",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.calendar_month_outlined),
                                ),
                              ),
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1940, 8),
                                    lastDate: DateTime.now());
                                if (selectedDate != null) {
                                  setState(() {
                                    _date.text =
                                        DateFormat('yyyy-MM-dd').format(selectedDate);
                                  });
                                }
                              }),
                        ),
                        const SizedBox(height: 10 / 2),
                        Center(
                          child: Container(
                              child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            child: const Text('Sign Up'),
                            onPressed: () async {
                            },
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
