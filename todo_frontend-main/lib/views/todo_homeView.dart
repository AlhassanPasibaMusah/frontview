// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_app/views/createTodo.dart';
import 'package:todo_app/views/deleteAlert.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex1 = 0;
  void _isSelected(index) {
    setState(() {
      _currentIndex1 = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("TODO App",
            style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex1,
          onTap: _isSelected,
          selectedItemColor: Colors.grey[600],
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle, color: Colors.black),
                label: "Completed Todo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline, color: Colors.black),
                label: "Uncompleted Todo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_applications, color: Colors.black),
                label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black), label: "User")
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CreateTodo()));
          },
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
          child: Icon(Icons.add)),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(index),
              direction: DismissDirection.startToEnd,
              confirmDismiss: (direction) async {
                var results = await showDialog(
                    context: context,
                    builder: (context) => const DeleteAlert());
                return results;
              },
              background:
                  Container(color: Colors.red, child: Icon(Icons.delete)),
              child: ListTile(
                title: Text("Trip to florida",
                    style: Theme.of(context).textTheme.bodyText1),
                subtitle: Text("planing a trip for my family...",
                    style: Theme.of(context).textTheme.bodyText2),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.check_circle)),
              ),
            );
          },
          separatorBuilder: (contex, index) =>
              Divider(color: Theme.of(context).dividerTheme.color, height: 1),
          itemCount: 10),
    );
  }
}
