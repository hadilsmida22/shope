class ToDo2 {
  String? id;
  String? todo2Text;
  bool isDone;

  ToDo2({
    required this.id,
    required this.todo2Text,
    this.isDone = true,
  });

  static List<ToDo2> todo2List() {
    return [
      ToDo2(id: '01', todo2Text: 'tomate'),
      ToDo2(id: '02', todo2Text: 'piment vert'),
      ToDo2(
        id: '03',
        todo2Text: 'ail',
      ),
      ToDo2(
        id: '04',
        todo2Text: 'eau de javel',
      ),
      ToDo2(
        id: '05',
        todo2Text: 'savons',
      ),
      ToDo2(
        id: '06',
        todo2Text: 'sumon ',
      ),
    ];
  }
}
