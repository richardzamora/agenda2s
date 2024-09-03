import 'package:agenda2/domain/models/category.dart';

class Schedule {
  Schedule({this.id, this.title, this.professionalId, this.categories});
  String? id;
  String? title;
  String? professionalId;
  List<Category>? categories;
}
