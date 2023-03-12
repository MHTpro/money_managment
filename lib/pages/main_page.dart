import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_managment/db/sql_db.dart';
import 'package:money_managment/models/sql_model.dart';
import 'package:money_managment/pages/day_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.black,
                content: const Text(
                  "You can DELETE all your info for new Month",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () async {
                      final snackBer = ScaffoldMessenger.of(context);
                      final navigator = Navigator.of(context);
                      await MainSql.instance.deleteDatabase();

                      snackBer.showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "Your app will be Closed soon",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                      navigator.pop(true);
                      //close the application after 5 sec
                      await Future.delayed(
                        const Duration(seconds: 5),
                        () => SystemNavigator.pop(),
                      );
                    },
                    child: const Text(
                      "Delete All",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Ok",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.attach_money_outlined,
          color: Colors.amber,
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Managment",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          String dayName = "Day ${index + 1}";
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (dayName == "Day 1") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[0],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 2") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[1],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 3") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[2],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 4") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[3],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 5") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[4],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 6") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[5],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 7") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[6],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 8") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[7],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 9") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[8],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 10") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[9],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 11") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[10],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 12") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[11],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 13") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[12],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 14") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[13],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 15") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[14],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 16") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[15],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 17") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[16],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 18") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[17],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 19") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[18],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 20") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[19],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 21") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[20],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 22") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[21],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 23") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[22],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 24") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[23],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 25") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[24],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 26") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[25],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 27") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[26],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 28") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[27],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 29") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[28],
                        );
                      },
                    ),
                  );
                }
                if (dayName == "Day 30") {
                  final navigator = Navigator.of(context);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DayPage(
                          theTableName: listOfTableNames[29],
                        );
                      },
                    ),
                  );
                }
              },
              child: Container(
                height: 70.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.amber,
                ),
                alignment: Alignment.center,
                child: Text(
                  dayName,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.amber.shade100,
            height: 5.0,
            thickness: 2.0,
            indent: 10.0,
            endIndent: 10.0,
          );
        },
        itemCount: 30,
      ),
    );
  }
}
