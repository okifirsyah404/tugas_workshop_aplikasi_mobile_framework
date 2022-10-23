import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObsecure = true;
  TextEditingController dateinput = TextEditingController();
  bool _checkBoxValue = false;
  bool _switchValue = true;

  @override
  void initState() {
    // TODO: implement initState
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.87,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            label: Text("Nama"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            label: Text("Email"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                            controller: dateinput,
                            readOnly: true,
                            decoration: InputDecoration(
                                labelText: "Tanggal Lahir",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey))),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(pickedDate);

                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);

                                print(formattedDate);

                                setState(() {
                                  dateinput.text = formattedDate;
                                  print(formattedDate);
                                });
                              } else {
                                print("Date is not selected");
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: "Masukkan No.Hp",
                                labelText: "No.Hp",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blueGrey)))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: TextField(
                          obscureText: _isObsecure,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            label: Text("Password"),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObsecure = !_isObsecure;
                                });
                              },
                              icon: Icon(
                                _isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: SwitchListTile(
                          title: Text("Apakah anda mahasiswa?"),
                          value: _switchValue,
                          activeColor: Theme.of(context).colorScheme.primary,
                          onChanged: ((value) {
                            setState(() {
                              _switchValue = value;
                            });
                          }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/home");
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sudah punya akun? "),
                          InkWell(
                            child: Text(
                              "Login Sekarang!",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/login");
                            },
                          )
                        ],
                      )
                    ],
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
