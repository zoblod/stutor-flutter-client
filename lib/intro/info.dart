import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stutor/custom_views/picker_view.dart';
import 'package:stutor/data/models/school.dart';
import 'package:stutor/data/observers/login_observer.dart';

import 'info2.dart';

/* View to get Name and School
 */
class Info extends StatefulWidget {
  const Info({Key? key, required this.observer}) : super(key: key);

  final LoginObserver observer;

  @override
  State<Info> createState() => _Info();
}

class _Info extends State<Info> {
  var universityIndex = 0;
  var selectedGender = 0;
  var genders = ["Male", "Female", "Other"];
  late Future<SchoolList> schools;

  // ignore: unused_field
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  void _universityPicker() async {
    List<School>? temp;
    List<String> list = [];
    await schools.then((value) => temp = value.schools);
    for (var school in temp!) {
      list.add(school.name);
    }
    final index = await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (__, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, _, __) {
              return PickerView(
                list: list,
                type: 'selectedUniversity',
                index: universityIndex,
              );
            }));
    setState(() {
      universityIndex = index;
    });
  }

  void _genderPicker() async {
    final index = await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (__, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, _, __) {
              return PickerView(
                list: genders,
                type: 'selectedGender',
                index: selectedGender,
              );
            }));
    setState(() {
      selectedGender = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // fetch universities
    schools = widget.observer.authService.fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFF382E35),
            image: DecorationImage(
                image: ExactAssetImage('assets/graphics/pad_lines.png'),
                fit: BoxFit.fill),
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
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                                child: SizedBox(
                                  height: 80,
                                  width:
                                      (MediaQuery.of(context).size.width - 50),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Select Your Gender:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _genderPicker();
                                        },
                                        child: Text(
                                          genders[selectedGender],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 20),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                                child: SizedBox(
                                  height: 80,
                                  width:
                                      (MediaQuery.of(context).size.width - 50),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Select Your School:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _universityPicker();
                                        },
                                        child: FutureBuilder<SchoolList>(
                                            future: schools,
                                            builder: (BuildContext context,
                                                AsyncSnapshot<SchoolList>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                return Text(
                                                  snapshot
                                                      .data!
                                                      .schools[universityIndex]
                                                      .name,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20),
                                                  textAlign: TextAlign.start,
                                                );
                                              } else {
                                                return Align(
                                                    alignment: const Alignment(
                                                        0.0, 0.0),
                                                    child: SizedBox(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          2.5),
                                                      height: 20,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.grey,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black12,
                                                                  offset:
                                                                      Offset(
                                                                          3.0,
                                                                          6.0),
                                                                  blurRadius:
                                                                      10.0),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                              }
                                            }), /**/
                                      ),
                                    ],
                                  ),
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
                      onPressed: () async {
                        List<School>? temp;
                        await schools.then((value) => temp = value.schools);

                        // update values in observer before moving to next view
                        widget.observer.user.firstName =
                            widget.observer.firstNameController.text;
                        widget.observer.user.lastName =
                            widget.observer.lastNameController.text;
                        widget.observer.user.school =
                            temp![universityIndex].name;
                        widget.observer.user.status = "student";
                        widget.observer.user.gender = genders[selectedGender];
                        await widget.observer.authService.loginToBackend(
                            widget.observer.user.firstName,
                            widget.observer.user.lastName);
                        if (widget.observer.key.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Info2(
                                        observer: widget.observer,
                                      )));
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
