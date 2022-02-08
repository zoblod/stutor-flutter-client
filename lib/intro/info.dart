import 'package:flutter/material.dart';
import 'package:stutor/data/observers/login_observer.dart';

import 'info2.dart';

class Info extends StatefulWidget {
  const Info({Key? key, required this.observer}) : super(key: key);

  final LoginObserver observer;

  @override
  State<Info> createState() => _Info();
}

class _Info extends State<Info> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(64, 44, 60, 1),
            image: DecorationImage(
                image: ExactAssetImage('assets/graphics/pad_lines.png'),
                fit: BoxFit.fitHeight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20, 30.0, 0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        Text(
                          "Tell us about",
                          textScaleFactor: 3.5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              foreground: Paint()..shader = linearGradient),
                        ),
                        Text(
                          "yourself",
                          textScaleFactor: 3.5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              foreground: Paint()..shader = linearGradient),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Form(
                        key: widget.observer.infoKey,
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 50),
                          child: Column(
                            children: [
                              SizedBox(
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller:
                                      widget.observer.firstNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelText: 'First Name',
                                    labelStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (input) => input != null
                                      ? null
                                      : "Please type at least one character.",
                                ),
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                                child: SizedBox(
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    controller:
                                        widget.observer.lastNameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      labelText: 'Last Name',
                                      labelStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (input) => input != null
                                        ? null
                                        : "Please type at least one character.",
                                  ),
                                  height: 60,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))),
              const Spacer(),
              SafeArea(
                bottom: true,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2),
                    height: 60,
                    child: TextButton(
                      child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Continue',
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )),
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFCB556F)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                      ),
                      onPressed: () {
                        if (widget.observer.key.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Info2()));
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2)
            ],
          )),
    );
  }
}
