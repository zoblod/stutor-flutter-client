import 'dart:ui';
import 'package:flutter/material.dart';

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
                        selectedColor: widget.index == index
                            ? const Color(0xFFCB556F)
                            : null,
                        selected: widget.index == index ? true : false,
                        onTap: () {
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
