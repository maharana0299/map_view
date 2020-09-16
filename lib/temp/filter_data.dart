class FilterData {
  List<String> selectedExperience = [];
  List<String> selectedIndustries = [];
  List<String> selectedJobTypes = [];

  @override
  String toString() {
    return 'FilterData{selectedExperience: $selectedExperience, selectedIndustries: $selectedIndustries, selectedJobTypes: $selectedJobTypes}';
  }
}