import 'package:flutter/material.dart';
import 'package:money_managment/db/sql_db.dart';
import 'package:money_managment/models/sql_model.dart';

class CreatePrice extends StatefulWidget {
  final String theTableName;
  const CreatePrice({
    super.key,
    required this.theTableName,
  });

  @override
  State<CreatePrice> createState() => _CreatePriceState();
}

class _CreatePriceState extends State<CreatePrice> {
  //make_model_for_add_method
  SqlModels makeModel() {
    final SqlModels theModel = SqlModels(
      title: title.text,
      price: price.text,
      description: description.text,
    );
    return theModel;
  }

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
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
                child: TextField(
                  controller: title,
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
                child: TextField(
                  controller: description,
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
                child: TextField(
                  controller: price,
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
                  await MainSql.instance.addInfo(
                    makeModel(),
                    widget.theTableName,
                  );
                  navigator.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                ),
                child: const Text(
                  "Submit",
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
      ),
    );
  }
}
