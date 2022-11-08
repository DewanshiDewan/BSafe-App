import 'package:application_1/db/database_provider.dart';
import 'package:application_1/model/Response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter/services.dart';
import 'package:application_1/utilities/constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

// Future<void> main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DB.getDatabaseObj();
//   runApp(MyApp());
// }
//run DB.personDao!.addOneProduct(Product(name: "prod1", price: 200));

// run another command for data retrieval

void main() {
  DatabaseProvider.db.createDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      title: 'Bsafe Application',
      // home: LoginPage(title: 'User Login'),
      home: LoginScreen(title: 'Login Screen'),
    );
  }
}

// class LoginPage extends StatefulWidget {
//   LoginPage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text("User Login"),
//   //     ),
//   //     body: Center(
//   //       child: Text(
//   //         "This is the User Login Page.",
//   //         textAlign: TextAlign.center,
//   //       ),
//   //     ),
//   //     bottomNavigationBar: TextButton(
//   //       child: Text("Next"),
//   //       onPressed: () {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => WelcomePage(title: 'Bsafe Application')),
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           Row(
//     children: [
//       ElevatedButton(
//     onPressed: () async {
//       DB.personDao!.insertPerson(Person(1,"Dewanshi"));
//     },
//     child: Text('Insert Person')),
//     ElevatedButton(
//     onPressed: () async {
//       final result = await DB.personDao!.findUserByName("Dewanshi");
//       print(result);
//     },
//     child: Text('Find answer')),
//     ],
//     ),
//     ]);}
// }



class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        //elevation: 5.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomePage(title: 'Bsafe Application')),
          );
        },
        //padding: EdgeInsets.all(15.0),
        //shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(30.0),
        // ),
        //color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bsafe Application"),
      ),
      body: Center(
        child: Text(
          "Welcome to your Bsafe Audit App",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Bsafe Application')),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String auditor_name = "";
  String designation = "";
  String isSafe = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Form(
        key: _formKey,
        child:
          Survey(
          onNext: (questionResults) {
            auditor_name = questionResults.elementAt(0).answers.elementAt(0);
            designation = questionResults.elementAt(0).answers.elementAt(1);
            isSafe = questionResults.elementAt(0).answers.elementAt(2);
          },

          initialData: [
            Question (
              isMandatory: true,
              question: "Please enter the Auditor's name",
            ),
            Question (
              isMandatory: true,
              question: "Please enter your Designation",
            ),

            Question(
              question: "Did you find the site of visit safe?",
              isMandatory: true,
              answerChoices: {
                "Yes": [
                  Question(
                      question: "Please tell us why?",
                  )
                ],
                "No": [
                  Question(
                    question: "Please tell us what went wrong.",
                  )
                ],
              },
            )
          ],
      ),
      ),
      bottomNavigationBar: TextButton(
        child: const Text("Next"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage(name: auditor_name, desig: designation, safe: isSafe,)),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  String name, desig, safe;
  SecondPage({Key? key, this.title, required this.name, required this.desig, required this.safe}) : super(key: key);

  final String? title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String dropdownvalue = 'Mahadevapura';

  // List of items in our dropdown menu
  var items = [
    'Mahadevapura',
    'Malleshwaram',
    'Dasarahalli',
    'Yeshwanthapura',
    'Yelahanka',
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audit Location"),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(

              // Initial Value
              value: dropdownvalue,
              hint: Text(dropdownvalue),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Next"),
        onPressed: () {
          String name = this.widget.name;
          String desig = this.widget.desig;
          String safe = this.widget.safe;
          String texts = dropdownvalue;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdPage(ddvalue: texts,name: name, desig: desig, safe: safe,)),
          );
        },
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  String ddvalue, name, desig, safe;
  ThirdPage({Key? key, this.title, required this.ddvalue, required this.name, required this.desig, required this.safe}) : super(key: key);

  final String? title;

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  final _formKey = GlobalKey<FormState>();

  bool? check1 = false, check2 = false, check3 = false, check4 = false, check5 = false, check6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Areas visited in Constituency"),
      ),
      body: Center(
        child: Column(
          children: [
        CheckboxListTile( //checkbox positioned at right
          value: check1,
          onChanged: (bool? value) {
            setState(() {
              check1 = value;
            });
          },
          title: Text("Police Station"),
        ),
           CheckboxListTile( //checkbox positioned at right
              value: check2,
              onChanged: (bool? value) {
                setState(() {
                  check2 = value;
                });
              },
              title: Text("Hospital"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check3,
              onChanged: (bool? value) {
                setState(() {
                  check3 = value;
                });
              },
              title: Text("Bus Stop"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check4,
              onChanged: (bool? value) {
                setState(() {
                  check4 = value;
                });
              },
              title: Text("Park"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check5,
              onChanged: (bool? value) {
                setState(() {
                  check5 = value;
                });
              },
              title: Text("Market"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check6,
              onChanged: (bool? value) {
                setState(() {
                  check6 = value;
                });
              },
              title: Text("Public Restroom"),
            ),
          ],),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Submit Survey"),
        onPressed: () {
          String navbar = "";
          if(this.check1 == true) navbar += "Police Station ";
          if(this.check2 == true) navbar += "Hospital ";
          if(this.check3 == true) navbar += "Bus Stop ";
          if(this.check4 == true) navbar += "Park ";
          if(this.check5 == true) navbar += "Market";
          if(this.check6 == true) navbar += "Public Restroom";
          String ddvalue = this.widget.ddvalue;
          Response response = Response(
              auditorName: this.widget.name,
              location: ddvalue,
              areasVisited: navbar,
              designation: this.widget.desig,
              isSafe: this.widget.safe,
          );
          DatabaseProvider.db.insert(response);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EndPage()),
          );
        },
      ),
    );
  }
}

class EndPage extends StatefulWidget {
  EndPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  final _formKey = GlobalKey<FormState>();

  String location ='Null, Press Button';
  String Address = 'search';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thank you"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text(location,style: const TextStyle(color: Colors.black,fontSize: 16),),
            const SizedBox(height: 10,),
            const Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text('${Address}'),
            ElevatedButton(onPressed: () async{
              Position position = await _getGeoLocationPosition();
              location ='Lat: ${position.latitude} , Long: ${position.longitude}';
              GetAddressFromLatLong(position);
            }, child: const Text('Get Location'))
          ],
        ),
        // Text(
        //   "Thank you for your help!",
        //   textAlign: TextAlign.center,
        // ),
      ),
      bottomNavigationBar: TextButton(
        child: const Text("Refill Form"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Bsafe Application')),
          );
        },
      ),
    );
  }
}