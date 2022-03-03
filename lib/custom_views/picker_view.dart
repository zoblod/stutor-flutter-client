import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickerView extends StatefulWidget {
  const PickerView(
      {Key? key, required this.list, required this.type, required this.index})
      : super(key: key);

  final List<String> list;
  final String type;
  final int index;

  @override
  State<PickerView> createState() => _PickerView();
}

class _PickerView extends State<PickerView> {
  var selectedIndex = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // ignore: unused_field
  late Future<int> _selected;

  Future<void> _selectOption(int index) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _selected = prefs.setInt(widget.type, index).then((bool success) {
        selectedIndex = index;
        return index;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _selected = _prefs.then((SharedPreferences prefs) {
      setState(() {
        selectedIndex = prefs.getInt(widget.type)!;
      });
      return prefs.getInt(widget.type) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Center(
            child: SizedBox(
              width: (MediaQuery.of(context).size.width - 50),
              height: (MediaQuery.of(context).size.height / 1.6),
              child: SafeArea(
                bottom: true,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  child: ListView.builder(
                    itemCount: widget.list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(widget.list[index],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                            )),
                        selectedColor: selectedIndex == index
                            ? const Color(0xFFCB556F)
                            : null,
                        selected: selectedIndex == index ? true : false,
                        onTap: () {
                          _selectOption(index);
                          Navigator.of(context).pop(index);
                        },
                      );
                    },
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
