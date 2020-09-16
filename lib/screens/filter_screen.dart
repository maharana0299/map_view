import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map_view/temp/filter_data.dart';
import 'package:map_view/temp/list_filters.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class FilterMaps extends StatefulWidget {
  @override
  _FilterMapsState createState() => _FilterMapsState();
}

class _FilterMapsState extends State<FilterMaps> {
  FilterData filterData = FilterData();
  TextEditingController _textController = TextEditingController();

  static List<String> industryList = FilterList().industriesList;
  List<String> changedDataIndustries = List.from(industryList);
  List<bool> isTrue =
      List<bool>.generate(industryList.length, (index) => false);

  static List<String> experienceList = FilterList().experienceList;
  List<String> changedDataExperience = List.from(experienceList);
  List<bool> isTrueExperience =
      List<bool>.generate(experienceList.length, (index) => false);

  static List<String> jobTypesList = FilterList().jobTypesList;
  List<String> changedJobTypes = List.from(jobTypesList);
  List<bool> isTrueJobTypes =
      List<bool>.generate(jobTypesList.length, (index) => false);

  onItemChanged(String value) {
    setState(() {
      changedDataIndustries = industryList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                width: 80.0,
              ),
              FlatButton(
                  onPressed: () {
                    // print(filterData);
                    Navigator.pop(context,filterData);
                  },
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ))
            ],
          ),
          Container(
            color: Colors.grey.shade200,
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Filters',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                width: 80.0,
              ),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FilterMaps();
                      }));
                    });
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ))
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade200,
              child: VerticalTabs(
                indicatorColor: Colors.blue,
                selectedTabBackgroundColor: Colors.grey,
                tabBackgroundColor: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade200,
                disabledChangePageFromContentView: true,
                indicatorSide: IndicatorSide.end,
                tabsWidth: 150,
                tabs: <Tab>[
                  Tab(
                    child: TabView(
                      text: 'Industries',
                    ),
                  ),
                  Tab(
                    child: TabView(
                      text: 'Experience',
                    ),
                  ),
                  Tab(
                    child: TabView(
                      text: 'Job Types',
                    ),
                  ),
                ],
                contents: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              hintText: 'Search Here...',
                            ),
                            onChanged: onItemChanged,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: changedDataIndustries.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return listTileForIndustries(
                                    changedDataIndustries.elementAt(index),
                                    index);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('Experience'),
                        Expanded(
                          child: ListView.builder(
                              itemCount: experienceList.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return listTileForExperience(
                                    experienceList.elementAt(index), index);
                              }),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('Job Types'),
                        Expanded(
                          child: ListView.builder(
                              itemCount: jobTypesList.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return listTileForJobType(
                                    jobTypesList.elementAt(index), index);
                              }),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  CheckboxListTile listTileForIndustries(String data, int index) {
    // bool isTrue = false;
    return CheckboxListTile(
      // leading: Icon(Icons.check_box_outline_blank),
      title: Text(data),
      value: isTrue[index],
      onChanged: (value) {
        setState(() {
          isTrue[index] = value;
          isTrue[index]
              ? filterData.selectedIndustries.add(data)
              : filterData.selectedIndustries.remove(data);
          // print(filterData.selectedIndustries);
        });
      },
    );
  }

  CheckboxListTile listTileForExperience(String data, int index) {
    // bool isTrue = false;
    return CheckboxListTile(
      // leading: Icon(Icons.check_box_outline_blank),
      title: Text(data),
      value: isTrueExperience[index],
      onChanged: (value) {
        setState(() {
          isTrueExperience[index] = value;
          isTrueExperience[index]
              ? filterData.selectedExperience.add(data)
              : filterData.selectedExperience.remove(data);
          // print(filterData.selectedExperience);
        });
      },
    );
  }

  CheckboxListTile listTileForJobType(String data, int index) {
    // bool isTrue = false;
    return CheckboxListTile(
      // leading: Icon(Icons.check_box_outline_blank),
      title: Text(data),
      value: isTrueJobTypes[index],
      onChanged: (value) {
        setState(() {
          isTrueJobTypes[index] = value;
          isTrueJobTypes[index]
              ? filterData.selectedJobTypes.add(data)
              : filterData.selectedJobTypes.remove(data);
          // print(filterData.selectedJobTypes);
        });
      },
    );
  }
}

class TabView extends StatelessWidget {
  final String text;
  TabView({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade500),
        ),
      ),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}


