import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String blyer = "X", winarblyar = "";
  List<String> listBlyer = ["", "", "", "", "", "", "", "", ""];
  List winar = [0, 0, 0, 0, 0, 0, 0, 0];
  bool iswinar = false;
  int x = 0, o = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Score X ${x} "),
          Text("X - O"),
          Text("Score O ${o}"),
        ],
      )),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "the Blayer is $blyer",
            style: const TextStyle(
                color: Color.fromARGB(255, 101, 43, 164),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            "The Onar is ${iswinar ? winarblyar : ""}",
            style: const TextStyle(
                color: Color.fromARGB(255, 101, 43, 164),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisExtent: 160,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: iswinar
                        ? null
                        : () {
                            setState(() {
                              iswinar = getwenar(index);
                              if (listBlyer[index] == "") {
                                if (blyer == "X") {
                                  listBlyer[index] = "X";
                                  blyer = "O";
                                  winarblyar = "X";
                                  if (winar.contains(3)) {
                                    x++;
                                    showAboutDialog(context) {
                                      return AlertDialog(
                                        actions: [Text("wlcome")],
                                      );
                                    }
                                  }
                                } else {
                                  listBlyer[index] = "O";
                                  blyer = "X";
                                  winarblyar = "O";
                                  if (winar.contains(-3)) {
                                    o++;
                                  }
                                }
                              }
                            });
                          },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: const Border.fromBorderSide(
                          BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 107, 21, 213),
                          ),
                        ),
                      ),
                      child: Text(
                        listBlyer[index],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 101, 43, 164),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                blyer = "X";
                listBlyer = ["", "", "", "", "", "", "", "", ""];
                iswinar = false;
                winar = [0, 0, 0, 0, 0, 0, 0, 0];
              });
            },
            label: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.restart_alt_sharp), Text("Restart")],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  getwenar(int i) {
    int sum = blyer == "X" ? 1 : -1;

    int row = i ~/ 3;
    int col = i % 3;
    winar[row] += sum;
    winar[col + 3] += sum;
    if (row == col) {
      winar[6] += sum;
    } else {
      winar[7] += sum;
    }
    if (winar.contains(3) || winar.contains(-3)) {
      return true;
    } else {
      return false;
    }
  }
}
