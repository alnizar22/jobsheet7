import 'package:flutter/material.dart';

class StateTeksUtama extends State<TeksUtama> {
  var listNama = [
    'Budi', 'Andi', 'Sari', 'Rudi',
    'Nurul', 'Huda', 'Lendis', 'Fabri'
  ];
  var listWarna = [
    Colors.red, Colors.purple, Colors.teal, Colors.lime,
    Colors.indigo, Colors.deepPurple, Colors.cyan, Colors.blue, Colors.yellow
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  void switchNama() {
    setState(() {
      index = (index + 1) % listNama.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50, // Mengatur posisi dari atas layar
          right: 80, // Mengatur posisi dari kanan layar
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 30, 50, 30), // Replace with actual values for left, top, right, bottom
            decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(40, 40), // Memberikan bayangan ke samping
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Apa kabar',
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  listNama[index],
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: listWarna[index],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: switchNama,
                  child: Text('Switch Nama'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TeksUtama extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateTeksUtama();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 2,
            offset: Offset(50, 50), // Memberikan bayangan ke samping
          ),
        ],
      ),
      // Add other properties or child widgets here
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Halo Dunia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halo Dunia'),
        ),
        body: SizedBox.expand(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TeksUtama(),
                TeksUtama(),  // Added a second instance of TeksUtama
              ],
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              tooltip: 'Random',
              child: Icon(Icons.refresh),
              onPressed: () {
                final state = context.findAncestorStateOfType<StateTeksUtama>();
                state?.incrementIndex();
              },
            );
          },
        ),
      ),
    ),
  );
}
