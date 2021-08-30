import 'package:flutter/material.dart';
import 'package:majoo_test/model/OrgDB/Org.dart';

class EntryForm extends StatefulWidget {
  final Org contact;

  EntryForm(this.contact);

  @override
  EntryFormState createState() => EntryFormState(this.contact);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Org org;

  EntryFormState(this.org);

  TextEditingController nameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController massController = TextEditingController();
  TextEditingController hair_colorController = TextEditingController();
  TextEditingController skin_colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (org != null) {
      nameController.text = org.name;
      heightController.text = org.height;
      massController.text = org.mass;
      hair_colorController.text = org.hairColor;
      skin_colorController.text = org.skinColor;
    }
    //rubah
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          // nama
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                //
              },
            ),
          ),

          // telepon
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
              controller: heightController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                //
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
              controller: massController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                //
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
              controller: hair_colorController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'warna rambut',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                //
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextField(
              controller: skin_colorController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'warna kulit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                //
              },
            ),
          ),
          // tombol button
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: <Widget>[
                // tombol simpan
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'Save',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      if (org == null) {
                        // tambah data
                        org = Org(
                            nameController.text,
                            heightController.text,
                            massController.text,
                            hair_colorController.text,
                            "n",
                            skin_colorController.text);
                      } else {
                        // ubah data
                        org.name = nameController.text;
                        org.height = heightController.text;
                        org.mass = massController.text;
                        org.hairColor = hair_colorController.text;
                        org.skinColor = skin_colorController.text;
                      }
                      // kembali ke layar sebelumnya dengan membawa objek contact
                      Navigator.pop(context, org);
                    },
                  ),
                ),
                Container(
                  width: 5.0,
                ),
                // tombol batal
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'Cancel',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
