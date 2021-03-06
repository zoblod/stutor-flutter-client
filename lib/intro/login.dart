import 'package:flutter/material.dart';
import 'package:stutor/input_validator.dart';
import 'package:stutor/data/observers/login_observer.dart';
import 'package:stutor/intro/info.dart';

/* View to gain user info
      - get First Name
      - get Last Name
      - get University
 */
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  var observer = LoginObserver();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFF282828), //Color.fromRGBO(64, 44, 60, 1),
            image: DecorationImage(
                image: ExactAssetImage('assets/graphics/pad_lines.png'),
                fit: BoxFit.fill),
          ),
          child: Form(
            key: observer.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 5),
                Image.asset(
                  'assets/graphics/original_logo.png',
                  scale: 5,
                ),
                const Spacer(
                  flex: 5,
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 50),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: observer.emailTextController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) => input!.isValidEmail()
                        ? null
                        : "Make sure you have a .edu email",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'enter your school email ( .edu )',
                      labelStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 50),
                  child: TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    style: const TextStyle(color: Colors.white),
                    controller: observer.passwordTextController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) => input!.isValidPassword()
                        ? null
                        : "your password needs at least 6 characters",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Enter a password',
                      labelStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 0.0),
                  child: TextButton(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '  Login',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFCB556F)),
                        splashFactory: NoSplash.splashFactory,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(color: Color(0xFFCB556F)),
                        )),
                        maximumSize: MaterialStateProperty.all<Size>(
                            const Size(95, 50))),
                    onPressed: () async {
                      if (observer.key.currentState!.validate()) {
                        observer.login();
                        // go to home page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Info(
                                      observer: observer,
                                    )));
                      }
                    },
                  ),
                ),
                const Spacer(flex: 4)
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    observer.emailTextController.dispose();
    observer.passwordTextController.dispose();
    super.dispose();
  }
}
