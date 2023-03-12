import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_managment/db/sql_db.dart';
import 'package:money_managment/models/sql_model.dart';
import 'package:money_managment/pages/edit_page.dart';

class ViewInfo extends StatefulWidget {
  final int? oldModelId;
  final String theTableName;
  const ViewInfo({
    super.key,
    required this.oldModelId,
    required this.theTableName,
  });

  @override
  State<ViewInfo> createState() => _ViewInfoState();
}

class _ViewInfoState extends State<ViewInfo> {
  String? title;
  String? price;
  bool isloading = false;

  late SqlModels? theModel;

  Future refresh() async {
    setState(() => isloading = true);
    theModel = await MainSql.instance.getOne(
      widget.oldModelId,
      widget.theTableName,
    );
    setState(() => isloading = false);
  }

  @override
  void initState() {
    refresh();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: FutureBuilder(
        future: MainSql.instance.getOne(widget.oldModelId, widget.theTableName),
        builder: (BuildContext context, AsyncSnapshot<SqlModels> snapshot) {
          if (!(snapshot.hasData)) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.amber,
                radius: 20.0,
              ),
            );
          }
          return isloading == true
              ? const SizedBox()
              : theModel == null
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
                  : Center(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 500.0,
                        width: 400.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Title: ${theModel!.title}",
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Description: ${theModel!.description}",
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Price: ${theModel!.price}",
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 35.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () async {
                                    final navigator = Navigator.of(context);

                                    await navigator.push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return UpdatePage(
                                            oldModelId: theModel!.id,
                                            theTableName: widget.theTableName,
                                          );
                                        },
                                      ),
                                    );
                                    refresh();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amberAccent,
                                  ),
                                  child: const Text(
                                    "Update",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    final navigator = Navigator.of(context);
                                    await MainSql.instance.deleteInfo(
                                      theModel!.id,
                                      widget.theTableName,
                                    );
                                    navigator.pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
