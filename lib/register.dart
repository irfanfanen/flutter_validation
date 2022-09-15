import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginScreen.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  RegExp validationFull = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double strong = 0;
  TextEditingController password = TextEditingController();

  RegExp huruf = RegExp(r"(?=.*[a-z])(?=.*[A-Z])");
  RegExp angka = RegExp(r"[0-9]");

  bool min8 = false;

  bool validatePassword(String pass) {
    if (password.text.isEmpty) {
      setState(() {
        strong = 0;
      });
    } else if (password.text.length < 8) {
      setState(() {
        strong = 1 / 4;
      });
    } else if (password.text.length < 10) {
      setState(() {
        strong = 2 / 4;
      });
    } else if (validationFull.hasMatch(password.text)) {
      setState(() {
        strong = 1 / 4;
      });
      return true;
    }
    return false;
  }

  void validateReq() {
    if (password.text.length > 8) {
      min8 = true;
    } else {
      min8 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(40),
                  child: Text(
                    "Register \nScreen",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  )),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Password"),
                      onChanged: (value) {
                        validatePassword(value);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LinearProgressIndicator(
                      value: strong,
                      minHeight: 10,
                      backgroundColor: Colors.grey,
                      color: strong <= 1 / 4 ? Colors.red : Colors.yellow,
                    ),
                    // Row(children: [Icon()]),
                    ElevatedButton(
                        onPressed: () {},
                        child: Container(
                            width: double.infinity,
                            child: Center(child: Text("Register")))),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const MyLogin()));
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sudah punya akun?"),
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    )
                  ]),
                ),
              ))
            ],
          ),
        ));
  }
}
