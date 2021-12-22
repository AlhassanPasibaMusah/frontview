// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Create Todo",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    style: Theme.of(context).textTheme.headline2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Todo Title",
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  TextField(
                    controller: bodyController,
                    maxLines: 4,
                    //expands: true,
                    style: Theme.of(context).textTheme.headline2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Body of Todo",
                    ),
                  ),
                  //                   Row(
                  //   children: [
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        labelText: "Start Date",
                        suffixIcon: Icon(Icons.date_range)),
                    onTap: () async {
                      var results = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2024));
//month/day/year: hours:munites: seconds:nanoseconds
                      if (results != null) {
                        setState(() {
                          dateController.value = results as TextEditingValue;
                        });
                      } else {
                        print("no date is selected");
                      }
                    },
                  ),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        labelText: "End Date",
                        suffixIcon: Icon(Icons.date_range)),
                    onTap: () async {
                      DateTime? results = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2024));
//month/day/year: hours:munites: seconds:nanoseconds
                      if (results != null) {
                        setState(() {
                          dateController.value = results as TextEditingValue;
                        });
                      } else {
                        print("no date is selected");
                      }
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.backgroundColor,
                        ),
                        onPressed: () {},
                        child: Text("Create Todo",
                            style: Theme.of(context).textTheme.bodyText2)),
                  )
                  //],
                  //),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
