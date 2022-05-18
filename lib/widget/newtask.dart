import 'dart:ffi';

import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  late TextEditingController textEditingControllerTitle;
  late TextEditingController textEditingControllerNote;
  late FocusNode textFocusNodeTitle;
  String textchange = 'Pick Date';
  late FocusNode textFocusNodeNotes;
  DateTime selectedDate = DateTime.now();
  DateTime todayDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  String? startdate, enddate;

  bool _iseditingTitle = false;
  bool _iseditingNote = false;
  @override
  void initState() {
    textEditingControllerNote = TextEditingController();
    textEditingControllerTitle = TextEditingController();
    textEditingControllerNote.text = '';
    textEditingControllerTitle.text = '';
    textFocusNodeNotes = FocusNode();
    textFocusNodeTitle = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'Add New Task',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 8),
                  child: Text(
                    'Title',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: TextField(
                    focusNode: textFocusNodeTitle,
                    textInputAction: TextInputAction.next,
                    controller: textEditingControllerTitle,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _iseditingTitle = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodeTitle.unfocus();
                      FocusScope.of(context).requestFocus(textFocusNodeNotes);
                    },
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey[800]!,
                          width: 3,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.blueGrey[300],
                      ),
                      hintText: "Title",
                      fillColor: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Note',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: TextField(
                    focusNode: textFocusNodeNotes,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: textEditingControllerNote,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _iseditingNote = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodeNotes.unfocus();
                      FocusScope.of(context).requestFocus(textFocusNodeNotes);
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey[800]!,
                          width: 3,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.blueGrey[300],
                      ),
                      hintText: "Note",
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Date',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: const Color.fromARGB(255, 2, 73, 131),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                textchange =
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: Text(
                                textchange,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  //Column for time select
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                              width: double.maxFinite,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 2, 73, 131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15.0,
                                  ),
                                  child: Text(
                                    'Start Time',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                              width: double.maxFinite,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 2, 73, 131),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15.0,
                                  ),
                                  child: Text(
                                    'End Time',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Remind dropdown
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Remind',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //letterSpacing: 3,
                    ),
                  ),
                ),
                //Repeat dropdown
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Repeat',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Button for add
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 8,
                      ),
                      //Column for time select
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary:
                                          const Color.fromARGB(255, 2, 73, 131),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 15.0,
                                      ),
                                      child: Text(
                                        'Start Time',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary:
                                          const Color.fromARGB(255, 2, 73, 131),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 15.0,
                                      ),
                                      child: Text(
                                        'End Time',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.monthsPerYear),
    );
    if (selected != selectedDate) {
      setState(() {
        selectedDate = selected!;
      });
    }
  }
}
