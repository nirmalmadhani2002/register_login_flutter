import 'package:flutter/material.dart';
import 'package:login_app/Screeen/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {

  GlobalKey<FormState> Formkey = GlobalKey();


  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool checkBoxVal = false;

  String? name;
  String? password;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/redister1.gif"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Form(
                    key: Formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val != name) {
                                return "Please Enter Valid name";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Globals.name = val;
                            },
                            controller: namecontroller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "User Name",
                              filled: true,
                              fillColor: Color(0xff50414D).withOpacity(0.12),
                            ),
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val != password) {
                                return "Please Enter Valid Password";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Globals.password = val;
                            },
                            controller: passwordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "Password",
                              filled: true,
                              fillColor: Color(0xff50414D).withOpacity(0.12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text("Remember me Login"),
                        Checkbox(
                            value: checkBoxVal,
                            onChanged: (val) {
                              setState(() {
                                checkBoxVal = val!;
                              });
                            })
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: SizedBox(
                      width: size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            name = prefs.getString("name");
                            password = prefs.getString("password");

                            if (Formkey.currentState!.validate()) {
                              Formkey.currentState!.save();

                              Navigator.of(context).pushReplacementNamed("/");

                              prefs.setBool("isLogin", true);
                              prefs.setBool("isRemember", checkBoxVal);
                            }
                          },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff50414D),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
