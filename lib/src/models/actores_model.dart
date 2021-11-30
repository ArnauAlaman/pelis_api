class Cast {
  List<Actor> actores = [];
  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
        actores.add(actor);
    });
  }
}
class Actor {
  int gender;
  int id;
  String name;
  String profilePath;
  double rating;
  String department;
  Actor({
    this.gender,
    this.id,
    this.name,
    this.profilePath,
    this.rating,
    this.department
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {

    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
    rating = json['popularity'];
    department = json['known_for_department'];
  }
  List<Actor> items = [];
  Actor.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final actor = new Actor.fromJsonMap(item);
      if(actor.profilePath != null && actor.id != null && actor.gender != null && actor.name != null) {
        items.add(actor);
      }
    }
  }
  getFoto() {
    if (profilePath == null) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
