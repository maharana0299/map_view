import 'package:flutter/material.dart';

class FilterList {
  List<String> _jobTypesList = [
    'Full Time',
    'Part Time',
    'Work FromHome',
    'Internship'
  ];
  List<String> _experienceList = [
    'Fresher',
    '0-2 yrs',
    '2-5 yrs',
    '5-8 yrs',
    '8-12 yrs',
    '12-15 yrs',
    '15+ yrs',
  ];
  List<String> _industriesList = [
    'IT-Software',
    'Human Resources',
    'Recruitment',
    'Consultancy',
    'Staffing'
    'Information Services',
    'Manufacturing',
    'Internet and E-commerce',
    'Marketing and Advertising',
    'Management Consulting Firms/Strategy',
    'E-commerce',
    'Tours and Travel',
    'Education And Training',
    'Insurance',
    'Financial Services',
    'IT-Hardware and Networking',
    'Education and Teaching',
    'Media and Entertainment',
    'Real Estate',
    'Retail and Wholesale',
    'Food Industry',
    'Health Care',
    'Customer Service',
    'Telecommunications',
    'Advertising',
    'Design Industry',
    'Automobiles',
    'Service',
    'Design Industry',
    'Data Analysis',
    'Legal/Law Firm',
    'Mechanical / Industrial Engineering',
    'Chemical / Petrochemical',
    'Gems and Jewellery',
    'Online Media',
    'Program Development',
    'Tel-com',
    'Apparel/Fashion',
    'Aerospace Industry',
    'Automotive Industry',
    'Gaming',
    'Accounting',
    'Legals',
    'Event Management',
    'Consumer Goods',
    'Hospital and Nursing Homes',
    'Market Research',
    'Plastics',
    'Semiconductor',
    'Waste Management',
    'Hospitality',
    'Computer and Network Security',
    'Electric Utility',
    'Electronics',
    'Photography',
    'Writing and Editing'
  ];

  List<String> get industriesList => _industriesList;

  List<String> get experienceList => _experienceList;

  List<String> get jobTypesList => _jobTypesList;
}
