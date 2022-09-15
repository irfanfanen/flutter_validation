import 'package:flutter/material.dart';
import 'package:flutter_application_1/register.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

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
                    "Login \nScreen",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  )),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height,
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
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        child: Container(
                            width: double.infinity,
                            child: Center(child: Text("Log In")))),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MyRegister()));
                      },
                      child: Row(children: [
                        Text("Belum punya akun?"),
                        Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
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
