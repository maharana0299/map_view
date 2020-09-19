import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
This is made to temporarily generate companies
 */
class CompaniesList {

  List<Widget> getCompanyList() {
    List<Widget> _companyList = [];
    for (int i = 0; i < 10; i++) {
      _companyList.add(CompanyDetailsView());
    }
    return _companyList;
  }

}

class CompanyDetailsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        height: 40.0,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('asset/logo.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            GestureDetector(
              onTap: (){
                print('Clicked');
              },
              child: Column(
                children: [
                  Text("Company Name",style: TextStyle(fontSize: 20.0),),
                  Text('Company Details'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}