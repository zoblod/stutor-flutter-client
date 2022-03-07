/*  School Object 
*/
class School {
  var id = "";
  var name = "";
  var abbr = "";
  var logoURL = "";
  var color = "";

  School(this.id, this.name, this.abbr, this.logoURL, this.color);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'abbr': abbr,
        'logoURL': logoURL,
        'color': color,
      };
}
