import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModal {
  String? issueId;
  String? issue;
  String? date;
  String? servicecharge;
  String? name;
  String? phone;

  ServiceModal(
      {this.issueId,
      this.date,
      this.issue,
      this.servicecharge,
      this.name,
      this.phone});

  factory ServiceModal.fromMap( data) {
    
    return ServiceModal(
      issueId: data['issueid']?? '',
      issue: data['issue']?? '',
      date: data['date']?? '',
      servicecharge: data['servicecharge']?? '',
      name: data['name']?? '',
      phone: data['phone']?? '', 
    );
  }
}
