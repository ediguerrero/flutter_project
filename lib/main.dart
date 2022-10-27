import 'package:flutter/material.dart';

import 'editNote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> notes = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: [
            ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    final note = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditNote(note: notes[index])));
                    setState(() {
                      if (note != null) {
                        notes[index] = note;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      notes[index],
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
            ),
            Text(
              "otrooooooo",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => createNewNote(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: "Notas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Reminder",
            ),
          ],
        ));
  }

  void createNewNote() async {
    final note = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditNote()));
    setState(() {
      notes.add(note);
    });
  }
}

class MyTitleWidet extends StatefulWidget {
  @override
  State<MyTitleWidet> createState() => _MyTitleState();
}

class _MyTitleState extends State<MyTitleWidet> {
  String textVar = "sin presionar";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                textVar = "presionado";
              });
            },
            child: Text("Presioname")),
        Text(textVar)
      ],
    );
  }
}
