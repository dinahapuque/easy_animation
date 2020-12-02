import 'package:easy_animation/src/components/custom_text_field.dart';
import 'package:easy_animation/src/models/contact_model.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController(
      text:
          "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png");
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "newContact",
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "New Professional",
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  this.imageUrlController.text,
                  height: 150,
                  width: 150,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: "Name",
                  controller: this.nameController,
                ),
                CustomTextField(
                  hintText: "Role",
                  controller: this.roleController,
                ),
                CustomTextField(
                  hintText: "Image URL",
                  controller: this.imageUrlController,
                ),
                CustomTextField(
                  hintText: "Bio",
                  controller: this.bioController,
                  minLines: 3,
                  maxLines: 3,
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    ContactModel newContact = ContactModel(
                      id: ContactModel.counter++,
                      name: nameController.text,
                      role: roleController.text,
                      imageUrl: imageUrlController.text,
                      bio: bioController.text,
                    );

                    Navigator.pop(context, newContact);
                  },
                  color: Colors.deepOrangeAccent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
