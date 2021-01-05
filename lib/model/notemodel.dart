class Note_Model {
  //class data
  int _id ;
  String _title;
  String _content;
  //construct
  Note_Model(dynamic data) {
    _id = data['id'];
    _title = data['title'];
    _content = data['content'];
  }
  //named construct
  Note_Model.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _title = data['title'];
    _content = data['content'];
  }

  //function to strore the data frome app to database
  Map<String, dynamic> tomap() =>
      {'id': _id, 'title': _title, 'content': _content};

  int get id => _id;
  String get title => _title;
  String get content => _content;
}
