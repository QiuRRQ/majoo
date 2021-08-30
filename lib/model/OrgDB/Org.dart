class Org {
  int _id;
  String _name;
  String _height;
  String _mass;
  String _hairColor;
  String _skinColor;
  String _eyeColor;
  String _birthYear;
  String _gender;
  String _homeworld;
  List<String> _films;
  List<String> _species;
  List<String> _vehicles;
  List<String> _starships;
  String _created;
  String _edited;
  String _fav;
  String _url;

  int get id => _id;
  String get name => _name;
  String get height => _height;
  String get mass => _mass;
  String get hairColor => _hairColor;
  String get skinColor => _skinColor;
  String get eyeColor => _eyeColor;
  String get birthYear => _birthYear;
  String get gender => _gender;
  String get homeworld => _homeworld;
  List<String> get films => _films;
  List<String> get species => _species;
  List<String> get vehicles => _vehicles;
  List<String> get starships => _starships;
  String get created => _created;
  String get fav => _fav;
  String get edited => _edited;
  String get url => _url;

  // konstruktor versi 1
  Org(
    // this._id,
    this._name,
    this._height,
    this._mass,
    this._hairColor,
    this._fav,
    this._skinColor,
    // this._eyeColor,
    // this._birthYear,
    // this._gender,
    // this._homeworld,
    // this._films,
    // this._species,
    // this._vehicles,
    // this._starships,
    // this._created,
    // this._edited,
    // this._url
  );

  // konstruktor versi 2: konversi dari Map ke Contact
  Org.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._height = map["height"];
    this._mass = map["mass"];
    this._hairColor = map["hair_color"];
    this._skinColor = map["skin_color"];
    this._eyeColor = map["eye_color"];
    this._birthYear = map["birth_year"];
    this._gender = map["gender"];
    this._homeworld = map["homeworld"];
    // this._films = map["films"] != null ? map["films"].cast<String>() : [];
    // this._species = map["species"];
    // this._vehicles = map["vehicles"];
    // this._starships = map["starships"];
    this._created = map["created"];
    this._fav = map["fav"];
    this._edited = map["edited"];
    this._url = map["url"];
  }

  // setter
  set name(String value) {
    _name = value;
  }

  set fav(String value) {
    _fav = value;
  }

  set height(String value) {
    _height = value;
  }

  set mass(String value) {
    _mass = value;
  }

  set hairColor(String value) {
    _hairColor = value;
  }

  set skinColor(String value) {
    _skinColor = value;
  }

  set eyeColor(String value) {
    _eyeColor = value;
  }

  set birthYear(String value) {
    _birthYear = value;
  }

  set gender(String value) {
    _gender = value;
  }

  set homeworld(String value) {
    _homeworld = value;
  }

  set films(List<String> value) {
    _films = value;
  }

  set species(List<String> value) {
    _species = value;
  }

  set vehicles(List<String> value) {
    _vehicles = value;
  }

  set starships(List<String> value) {
    _starships = value;
  }

  set created(String value) {
    _created = value;
  }

  set edited(String value) {
    _edited = value;
  }

  set url(String value) {
    _url = value;
  }

  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = this._id;
    map["name"] = this._name;
    map["height"] = this._height;
    map["mass"] = this._mass;
    map["hair_color"] = this._hairColor;
    map["skin_color"] = this._skinColor;
    map["eye_color"] = this._eyeColor;
    map["birth_year"] = this._birthYear;
    map["gender"] = this._gender;
    map["homeworld"] = this._homeworld;
    map["films"] = this._films.toString();
    map["species"] = this._species.toString();
    map["vehicles"] = this._vehicles.toString();
    map["starships"] = this._starships.toString();
    map["created"] = this._created;
    map["fav"] = this._fav;
    map["edited"] = this._edited;
    map["url"] = this._url;
    return map;
  }
}
