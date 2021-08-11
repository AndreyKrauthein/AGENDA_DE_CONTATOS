import 'package:agenda_de_contatos/models/contact.dart';
import 'package:agenda_de_contatos/provider/list_of_contacts.dart';
import 'package:agenda_de_contatos/style.dart';
import 'package:agenda_de_contatos/views/details/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus contatos"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
        body: ListView.separated(
            itemBuilder: builder,
            separatorBuilder: (_, index) {
              return Divider();
            },
            itemCount: listOfContacts.length));
  }

  Widget builder(BuildContext _, int index) {
    {
      Contact _contact = listOfContacts.elementAt(index);
      return ListTile(
        leading: IconButton(
          icon: (_contact.isFavorite)
              ? Icon(
                  Icons.star,
                  color: blueThemes,
                )
              : Icon(
                  Icons.star_outline,
                  color: blueThemes,
                ),
          onPressed: () {
            setState(() {
              _contact.isFavorite = !_contact.isFavorite;
            });
          },
        ),
        trailing: IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext _) {
                return Details(_contact);
              }));
            }),
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                _contact.photo,
                width: 40,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _contact.name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: grayTheme),
                ),
                Text(
                  _contact.phone,
                  style: TextStyle(fontSize: 10, color: grayTheme),
                )
              ],
            )
          ],
        ),
      );
    }
  }
}
