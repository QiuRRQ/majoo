import 'package:flutter/material.dart';
import 'package:majoo_test/model/DB/dbHelper.dart';
import 'package:majoo_test/model/OrgDB/Org.dart';
import 'package:majoo_test/model/initalData/people.dart';
import 'package:majoo_test/views/berandatemp2/entryform.dart';
//letak package folder flutter
import 'package:sqflite/sqflite.dart';
//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';
//pendukung program asinkron

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Org> contactList = [];

  @override
  void initState() {
    // TODO: implement initState
    updateListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = [];
    }

    return Scaffold(
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var contact = await navigateToEntryForm(context, 1, null);
          if (contact != null) addContact(contact);
        },
      ),
    );
  }

  Future<Org> navigateToEntryForm(
      BuildContext context, int a, Org contact) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(contact);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: this.contactList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.people),
            ),
            title: Text(
              this.contactList[index].name,
              style: textStyle,
            ),
            subtitle: Text(this.contactList[index].height),
            trailing: Container(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(this.contactList[index].fav == "y"
                        ? Icons.favorite
                        : Icons.favorite_outline_sharp),
                    onTap: () {
                      var org = this.contactList[index];
                      org.fav = "y";
                      if (org != null) editContact(org);
                      setState(() {
                        this.contactList[index].fav = "y";
                      });
                    },
                  ),
                  GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: () {
                      deleteContact(contactList[index]);
                    },
                  )
                ],
              ),
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(
                  context, 2, this.contactList[index]);
              if (contact != null) editContact(contact);
            },
          ),
        );
      },
    );
  }

  //buat contact
  void addContact(Org object) async {
    int result = await dbHelper.insert(org: object);
    if (result > 0) {
      updateListView();
    }
  }

  //edit contact
  void editContact(Org object) async {
    int result = await dbHelper.update(org: object);
    if (result > 0) {
      updateListView();
    }
  }

  //delete contact
  void deleteContact(Org object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  //update contact
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Org>> contactListFuture = dbHelper.getOrgList(filter: "");
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          this.count = contactList.length;
        });
      });
    });
  }
}
