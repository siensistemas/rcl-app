import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final int id;
  final String title;
  final String? description;
  final String? company;
  final String? location;
  final String? salary;
  final List<String>? requirements;
  final String? contactInfo;
  final DateTime postedDate;

  const Job({
    required this.id,
    required this.title,
    this.description,
    this.company,
    this.location,
    this.salary,
    this.requirements,
    this.contactInfo,
    required this.postedDate,
  });

  Job copyWith({
    int? id,
    String? title,
    String? description,
    String? company,
    String? location,
    String? salary,
    List<String>? requirements,
    String? contactInfo,
    DateTime? postedDate,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      company: company ?? this.company,
      location: location ?? this.location,
      salary: salary ?? this.salary,
      requirements: requirements ?? this.requirements,
      contactInfo: contactInfo ?? this.contactInfo,
      postedDate: postedDate ?? this.postedDate,
    );
  }

  @override
  List<Object?> get props => [id, title, description, company, location, salary, requirements, contactInfo, postedDate];
}
