class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Todo(this._title, this._date, this._priority, [this._description]);
  Todo.withId(this._id, this._title, this._date, this._priority, [this._description]);
}