import 'package:easy_animation/src/mocks/contacts.dart';
import 'package:flutter/material.dart';
import 'components/card_item.dart';
import 'models/contact_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> _list;

  @override
  void initState() {
    super.initState();
    _list = contacts;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "newContact",
          onPressed: () async {
            final result = await Navigator.pushNamed(
              context,
              '/add',
            );

            if (result is ContactModel)
              setState(() {
                _list.add(result);
              });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('IT Professional List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ..._list
                    .map(
                      (e) => Dismissible(
                        key: Key("dismissible-" + e.id.toString()),
                        background: Container(color: Colors.black12),
                        onDismissed: (dismissible) {
                          setState(() {
                            _list.removeWhere((c) => c.id == e.id);
                          });
                        },
                        child: CardItem(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: e,
                          ),
                          item: e,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
