/// name : "Luke Skywalker"
/// height : "172"
/// mass : "77"
/// hair_color : "blond"
/// skin_color : "fair"
/// eye_color : "blue"
/// birth_year : "19BBY"
/// gender : "male"
/// homeworld : "https://swapi.dev/api/planets/1/"
/// films : ["https://swapi.dev/api/films/1/","https://swapi.dev/api/films/2/","https://swapi.dev/api/films/3/","https://swapi.dev/api/films/6/"]
/// species : []
/// vehicles : ["https://swapi.dev/api/vehicles/14/","https://swapi.dev/api/vehicles/30/"]
/// starships : ["https://swapi.dev/api/starships/12/","https://swapi.dev/api/starships/22/"]
/// created : "2014-12-09T13:50:51.644000Z"
/// edited : "2014-12-20T21:17:56.891000Z"
/// url : "https://swapi.dev/api/people/1/"

class Poeple {
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
  List<dynamic> _species;
  List<String> _vehicles;
  List<String> _starships;
  String _created;
  String _edited;
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
  List<dynamic> get species => _species;
  List<String> get vehicles => _vehicles;
  List<String> get starships => _starships;
  String get created => _created;
  String get edited => _edited;
  String get url => _url;

  Poeple(
      {int id,
      String name,
      String height,
      String mass,
      String hairColor,
      String skinColor,
      String eyeColor,
      String birthYear,
      String gender,
      String homeworld,
      List<String> films,
      List<dynamic> species,
      List<String> vehicles,
      List<String> starships,
      String created,
      String edited,
      String url}) {
    _id = id;
    _name = name;
    _height = height;
    _mass = mass;
    _hairColor = hairColor;
    _skinColor = skinColor;
    _eyeColor = eyeColor;
    _birthYear = birthYear;
    _gender = gender;
    _homeworld = homeworld;
    _films = films;
    _species = species;
    _vehicles = vehicles;
    _starships = starships;
    _created = created;
    _edited = edited;
    _url = url;
  }

  Poeple.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _height = json["height"];
    _mass = json["mass"];
    _hairColor = json["hair_color"];
    _skinColor = json["skin_color"];
    _eyeColor = json["eye_color"];
    _birthYear = json["birth_year"];
    _gender = json["gender"];
    _homeworld = json["homeworld"];
    _films = json["films"] != null ? json["films"].cast<String>() : [];
    _species = json["species"] != null ? json["species"].cast<String>() : [];
    _vehicles = json["vehicles"] != null ? json["vehicles"].cast<String>() : [];
    _starships =
        json["starships"] != null ? json["starships"].cast<String>() : [];
    _created = json["created"];
    _edited = json["edited"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["height"] = _height;
    map["mass"] = _mass;
    map["hair_color"] = _hairColor;
    map["skin_color"] = _skinColor;
    map["eye_color"] = _eyeColor;
    map["birth_year"] = _birthYear;
    map["gender"] = _gender;
    map["homeworld"] = _homeworld;
    map["films"] = _films;
    map["species"] = _species;
    map["vehicles"] = _vehicles;
    map["starships"] = _starships;
    map["created"] = _created;
    map["edited"] = _edited;
    map["url"] = _url;
    return map;
  }

  Map<String, dynamic> toStringData() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["height"] = _height;
    map["mass"] = _mass;
    map["hair_color"] = _hairColor;
    map["skin_color"] = _skinColor;
    map["eye_color"] = _eyeColor;
    map["birth_year"] = _birthYear;
    map["gender"] = _gender;
    map["homeworld"] = _homeworld;
    map["films"] = _films.toString();
    map["species"] = _species.toString();
    map["vehicles"] = _vehicles.toString();
    map["starships"] = _starships.toString();
    map["created"] = _created;
    map["edited"] = _edited;
    map["url"] = _url;
    return map;
  }
}
