import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_view/LocationHelper.dart';
import 'package:map_view/screens/filter_screen.dart';
import 'package:map_view/temp/filter_data.dart';
import 'package:map_view/temp/list_of_companies.dart';

import '../constants.dart';


class MyMapView extends StatefulWidget {
  @override
  _MyMapViewState createState() => _MyMapViewState();
}

class _MyMapViewState extends State<MyMapView> {
  bool _showAppbar = true; //this is to show app bar
  Location location = Location();
  Location myInitialLocation;
  Completer<GoogleMapController> _controller = Completer();
  String searchAddress;
  Set<Marker> markers = {};



  Future<void> toAddress(Location location) async {
    final coordinates = new Coordinates(location.latitude, location.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    setState(() {
      searchAddress = first.subLocality;
      _gotoLocation(location.latitude, location.longitude);
      markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(title: "My Location"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ));
      print(markers);
    });
  }

  void getLocation() async {
    await location.getCurrentLocation();
    myInitialLocation = location;
    print(myInitialLocation);
    //temp
    populateMarker();
    toAddress(location);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    // print(filterData);
    return Scaffold(
      appBar: _showAppbar
          ? AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {},
        ),
        title: Text("Map View"),
        actions: [
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                _settingModalBottomSheet(context);
                setState(() {
                  _showAppbar = false;
                });
              })
        ],
      )
          : PreferredSize(
        child: Container(),
        preferredSize: Size(0.0, 0.0),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          _googlemap(context),
          GestureDetector(
            onVerticalDragStart: (details) {
              _settingModalBottomSheet(context);
              setState(() {
                _showAppbar = false;
              });
            },
            child: Container(
              height: 50.0,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                ),
              ),
              child: Text(searchAddress ?? ''),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0,right: 20.0),
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              heroTag: 'filter__tag',
                child: Icon(FontAwesomeIcons.filter),
                onPressed: (){
                //todo filter data is returned , perform query to filter data (FilterData class)
                  _navigateAndDisplaySelection(context);
                //    final filterData = (Navigator.push(context, MaterialPageRoute(builder:(context) => FilterMaps() )));
                   // print(filterData);
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.searchLocation),
        onPressed: () {
          // getLocation()
          getLocation();
        },
      ),
    );
  }

  Widget _googlemap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(
                location.latitude ?? 28.5934, location.longitude ?? 77.2223),
            zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
        onCameraMove: ((_position) => updatePosition(_position)),
        onCameraIdle: () async {
          var first;
          final coordinates =
          new Coordinates(location.latitude, location.longitude);
          try {
            var addresses =
            await Geocoder.local.findAddressesFromCoordinates(coordinates);
            first = addresses.first.subLocality;
            setState(() {
              searchAddress = first?? "";
            });
          } catch (e) {
            print(e.toString());
          }
          // print("${first.featureName} : ${first.addressLine}");
        },
      ),
    );
  }

  Marker marker(String locations, LatLng latLng) {
    return Marker(
        markerId: MarkerId('1'),
        position: latLng,
        infoWindow: InfoWindow(title: "My Location"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        draggable: true,
        onDragEnd: (value) {
          setState(() {
            location.longitude = value.longitude;
            location.latitude = value.latitude;
            print(location.latitude);
          });
        });
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long), zoom: 15, tilt: 50.0, bearing: 45.0)));
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext bc) {
          return Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * .60,
            child: Wrap(
              children: <Widget>[
                ListTile(
                  // leading: Icon(FontAwesomeIcons.search,),
                    title: TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        // searchAddress = value.toString();
                        print(searchAddress);
                      },
                      decoration: kTextFieldDecoration,
                      onSubmitted: (value) async {
                        //todo implement searching
                        // // searchAddress = value.toString();
                        // final query = "1600 Amphiteatre Parkway, Mountain View";
                        // var addresses = await Geocoder.local.findAddressesFromQuery(query);
                        // Coordinates first = addresses.first.coordinates;
                        // print(addresses.first.addressLine + " My");
                        // print(searchAddress);
                        Navigator.pop(context);
                      },
                    ),
                    onTap: () => {}),
              ],
            ),
          );
        }).whenComplete(() {
      print("Complete");
      setState(() {
        _showAppbar = true;
      });
    });
  }

  Future<Marker> addFavMarker(LatLng latLng, String name) async {
    return Marker(
        markerId: MarkerId(latLng.latitude.toString()),
        position: LatLng(latLng.latitude, latLng.longitude),
        infoWindow: InfoWindow(title: await findName(latLng)),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        draggable: true,
        onTap: () {
          print('Item Clicked');
          _settingModalBottomSheetForMarker(context, name);
        });
  }

  Future<String> findName(LatLng latlang) async {
    final coordinates = new Coordinates(latlang.latitude, latlang.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    return first.subLocality;
  }

  void populateMarker() async {
    for (int i = 1; i < 12; i++) {
      LatLng latLng = LatLng(
          myInitialLocation.latitude + 0.001 * i, myInitialLocation.longitude);
      String name = await findName(latLng);
      markers.add(await addFavMarker(latLng, name));

      // print('My list /n' + markersList.toString());
      // print(markers);
    }
  }

  void updatePosition(CameraPosition position) async {
    location.latitude = position.target.latitude;
    location.longitude = position.target.longitude;

    markers.add(Marker(
      markerId: MarkerId('1'),
      position: LatLng(location.latitude, location.longitude),
      infoWindow: InfoWindow(title: "My Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      draggable: true,
    ));
  }

  void _settingModalBottomSheetForMarker(context, name) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,

        isDismissible: true,
        builder: (BuildContext bc) {
          return Container(
            color:Colors.transparent,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * .60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          name??' ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Multiple people at this location',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Scrollbar(
                        child: ListView(
                          shrinkWrap: true,
                          // padding: const EdgeInsets.all(20.0),
                          children: CompaniesList().getCompanyList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).whenComplete(() {
      print("Complete");
      setState(() {
        _showAppbar = true;
      });
    });
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => FilterMaps()),
    );
    print(result);
  }
}
