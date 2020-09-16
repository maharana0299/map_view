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
        'Human Resources',
        'Manufacturing',
        'Tours and Travel',
        'Education And Training',
        'Insurance',
        'Financial Services',
        'Health Care',
        'Customer Service',
        'Telecommunications',
        'Design Industry',
        'Automobiles',
        'Gaming',
        'Accounting',
        'Legals',
        'Event Management',
  ];



  List<String> get industriesList => _industriesList;

  List<String> get experienceList => _experienceList;

  List<String> get jobTypesList => _jobTypesList;
}




