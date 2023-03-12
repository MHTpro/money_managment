import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_managment/db/sql_db.dart';
import 'package:money_managment/models/sql_model.dart';

class UpdatePage extends StatefulWidget {
  final String theTableName;
  final int? oldModelId;
  const UpdatePage({
    super.key,
    required this.oldModelId,
    required this.theTableName,
  });

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
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

  Future updage() async {
    final model = theModel!.copy(
      price: price,
      title: title,
    );
    return await MainSql.instance.editInfo(
      model,
      widget.theTableName,
    );
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
                        height: 400.0,
                        width: 350.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                initialValue: theModel!.title,
                                onChanged: (value) {
                                  theModel!.title = value;
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: "Title",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  filled: true,
                                  fillColor: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                initialValue: theModel!.description,
                                onChanged: (value) {
                                  theModel!.description = value;
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: "Description",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  filled: true,
                                  fillColor: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                initialValue: theModel!.price,
                                onChanged: (value) {
                                  theModel!.price = value;
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: "Price",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  filled: true,
                                  fillColor: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 35.0,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final navigator = Navigator.of(context);
                                await updage();
                                navigator.pop();
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
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
