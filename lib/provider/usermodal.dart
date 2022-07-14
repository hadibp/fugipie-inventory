import 'package:equatable/equatable.dart';

class Users extends Equatable{
  final String id;
  final String? name;
  final String? email;
  final String? photo;

  const Users({required this.id, this.name, this.email, this.photo});

  static const empty = Users(id: '');

  bool get isEmpty => this ==Users.empty;
  bool get isNotEmpty => this !=Users.empty;
  
  @override
   
  List<Object?> get props => [id , email ,name ,photo];

  

}