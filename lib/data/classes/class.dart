class Class {
  var abbr = "";
  var name = "";
  var number = 0;
  var professorsList = [] as String;

  Class(this.abbr, this.name, this.number);

  Class.withProfessorsList(
      this.abbr, this.name, this.number, this.professorsList);
}
