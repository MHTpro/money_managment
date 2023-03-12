import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_managment/db/sql_db.dart';
import 'package:money_managment/models/sql_model.dart';
import 'package:money_managment/pages/create_price.dart';
import 'package:money_managment/pages/view_page.dart';

class DayPage extends StatefulWidget {
  final String theTableName;
  const DayPage({
    super.key,
    required this.theTableName,
  });

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  List<SqlModels?>? allData;
  bool isLoading = false;
  refresh() async {
    setState(() {
      isLoading = true;
    });
    await MainSql.instance
        .getAll(widget.theTableName)
        .then((value) => allData = value);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final navigator = Navigator.of(context);
          await navigator.push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CreatePrice(
                  theTableName: widget.theTableName,
                );
              },
            ),
          );
          await refresh();
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Manage your day",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: MainSql.instance.getAll(widget.theTableName),
        builder:
            (BuildContext context, AsyncSnapshot<List<SqlModels>> snapshot) {
          if (!(snapshot.hasData)) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.amber,
                radius: 20.0,
              ),
            );
          }
          return isLoading == true
              ? const SizedBox()
              : allData!.isEmpty
                  ? const Center(
                      child: Text(
                        "No Price",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: allData!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              final navigator = Navigator.of(context);
                              await navigator.push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return ViewInfo(
                                      oldModelId: allData![index]!.id,
                                      theTableName: widget.theTableName,
                                    );
                                  },
                                ),
                              );
                              await refresh();
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
                                allData![index]!.title.toString(),
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
