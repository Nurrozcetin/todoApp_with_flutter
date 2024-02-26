

class ToDo {
  String id;
  String toDoText;
  bool isDone;

  ToDo({required this.id, required this.toDoText, this.isDone = false});

  static List<ToDo> toDoList() {
    return [
      ToDo(id: '01', toDoText: 'Wake Up', isDone: true),
      ToDo(id: '02', toDoText: 'Exercise', isDone: true),
      ToDo(id: '03', toDoText: 'Breakfast', isDone: false),
      ToDo(id: '04', toDoText: 'Work', isDone: false),
      ToDo(id: '05', toDoText: 'Flutter project', isDone: true),
      ToDo(id: '06', toDoText: 'Dinner Time', isDone: false),
    ];
  }
}
