import 'package:rcl_app/features/jobs/domain/entities/job.dart';

class JobModel {
  final int id;
  final String title;
  final String? description;
  final String? company;
  final String? location;
  final String? salary;
  final List<String>? requirements;
  final String? contactInfo;
  final DateTime postedDate;

  const JobModel({
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

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    id: (json['id'] as num).toInt(),
    title: json['title'] as String,
    description: json['description'] as String?,
    company: json['company'] as String?,
    location: json['location'] as String?,
    salary: json['salary'] as String?,
    requirements: (json['requirements'] as List<dynamic>?)?.map((e) => e as String).toList(),
    contactInfo: json['contact_info'] as String?,
    postedDate: DateTime.parse(json['posted_date'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'company': company,
    'location': location,
    'salary': salary,
    'requirements': requirements,
    'contact_info': contactInfo,
    'posted_date': postedDate.toIso8601String(),
  };

  Job toEntity() => Job(
    id: id,
    title: title,
    description: description,
    company: company,
    location: location,
    salary: salary,
    requirements: requirements,
    contactInfo: contactInfo,
    postedDate: postedDate,
  );

  factory JobModel.fromEntity(Job entity) => JobModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    company: entity.company,
    location: entity.location,
    salary: entity.salary,
    requirements: entity.requirements,
    contactInfo: entity.contactInfo,
    postedDate: entity.postedDate,
  );
}
