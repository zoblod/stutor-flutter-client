/* Major Class
*/
class Major {
  var id = "";
  var schoolID = "";
  var name = "";

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'schooldID': schoolID,
      };
}
