import 'package:flutter/material.dart';
import 'package:splitwise_app/functions/contactlist_fn.dart';
import 'package:splitwise_app/model/contactlist_model.dart';
import 'package:splitwise_app/screens/friends_screen.dart';

class Addcontact extends StatelessWidget {
  Addcontact({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 22, 140, 124)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'name',
                      prefixIcon: Icon(Icons.person),
                      fillColor: const Color.fromARGB(255, 231, 230, 230),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(
                      hintText: 'phone no',
                      prefixIcon: Icon(Icons.phone),
                      fillColor: Color.fromARGB(255, 231, 230, 230),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  maxLength: 10,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  onAddStudentButtonClicked(context);
                  _showPopup(context);
                },
                child: Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 92, 172, 162),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Save',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _number = _numberController.text.trim();
    if (_name.isEmpty || _number.isEmpty) {
      return;
    } else {
      final contact = (name: _name, number: _number);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Friendsscreen(
          contact: ContactList(name: _name, number: _number, isDone: false),
        ),
      ));
    }
    print('$_name $_number');
    final _contact = ContactList(name: _name, number: _number, isDone: false);

    addContact(_contact);
  }

  Future<void> _showPopup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Saved'),
          content: Text('Your Conatct has been successfully completed.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}