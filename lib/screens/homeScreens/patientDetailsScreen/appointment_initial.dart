//import 'package:docs/appointment/AllHospitals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'search_resultpage.dart';
// import 'doctor_page.dart';
// import 'all_specialist.dart';
import '../../../widgets/reusables.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Doctor \nAppointment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    fontSize: 22,
                  ),
                ),
                SvgPicture.asset(
                  'asset/images/appointment.svg',
                  height: 170,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 45,
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Color(0xFFF9F6F6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SearchPage()),
                //);
              },
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.black12,
                  labelText:
                      'Search for doctors,specialist,hospitals,clinics etc',
                  labelStyle: TextStyle(fontFamily: 'Nunito', fontSize: 13),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Speciality",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AllSpecialist(),
                    //   ),
                    //);
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF808080),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          //container("Cardiologist", "19 doctors"),
          // ListView.builder(
          //   itemBuilder: (ctx, index) => Text('Hello'),
          //   scrollDirection: Axis.horizontal,
          //   //shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   primary: false,
          //   itemCount: 4,
          //   // children: [
          //   //   container("Cardiologist", "19 doctors"),
          //   //   container("Neurologist", "10 doctors"),
          //   //   container("Oncologist", "17 doctors"),
          //   //   container("ENT", "17 doctors"),
          //   // ],
          // ),
          Container(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                container("Cardiologist", "19 doctors"),
                container("Neurologist", "10 doctors"),
                container("Oncologist", "17 doctors"),
                container("ENT", "17 doctors"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hospitals and Clinics",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AllHospitals(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF808080),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                container("", "HAMM"),
                container("", "Dey Nursing"),
                container("", "Star Care"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Doctors",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DoctorPage(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF808080),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Doccard("Dr Hemmant Singh Rathore", "Chest Specialist"),
              Doccard("Dr Hemmant Singh Rathore", "Chest Specialist"),
              Doccard("Dr Hemmant Singh Rathore", "Chest Specialist"),
            ],
          ),
        ],
      ),
    );
  }
}

class Doccard extends StatelessWidget {
  String doccard;
  String specialist;

  Doccard(String doccard, String specialist) {
    this.doccard = doccard;
    this.specialist = specialist;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      height: 110,
      decoration: BoxDecoration(
        color: Color(0xFFf2efef),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doccard,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                specialist,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF808080),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
