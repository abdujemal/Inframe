import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/screens/photographer_path/photographer_update_profile.dart';
import 'package:inframe/screens/seeker_path/seeker_bid_posted.dart';
import 'package:inframe/screens/seeker_path/seeker_dashboard.dart';

class SeekerPostabid extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String uid = FirebaseAuth.instance.currentUser!.uid;




  SeekerPostabid({Key? key}) : super(key: key);

  var eventTypeTEC = TextEditingController();
  var eventDateTEC = TextEditingController();
  var numOfPeopleTEC = TextEditingController();
  var phoneTEC = TextEditingController();
  var priceTEC = TextEditingController();
  var nameTEC = TextEditingController();
  var placeTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const CurvedShape(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 30),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white)),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                      ),
                      child: Text(
                        "Post a bid",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Form(
              key: _formKey,
              child: Column(
                children:  [

                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      validator: (v){
                        if(v!.isEmpty){
                          return "This Field is required";
                        }
                      },
                      controller: eventTypeTEC,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Event Type",
                          hintStyle: TextStyle(color: Color(0xFFABABAB))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      validator: (v){
                        if(v!.isEmpty){
                          return "This Field is required";
                        }
                      },
                      textAlign: TextAlign.center,
                      controller: eventDateTEC,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Event Date",
                          hintStyle: TextStyle(color: Color(0xFFABABAB))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      validator: (v){
                        if(v!.isEmpty){
                          return "This Field is required";
                        }
                      },
                      textAlign: TextAlign.center,
                      controller: placeTEC,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Event Place",
                          hintStyle: TextStyle(color: Color(0xFFABABAB))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      validator: (v){
                        if(v!.isEmpty){
                          return "This Field is required";
                        }
                      },
                      controller: numOfPeopleTEC,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          hintText: "# of people",
                          hintStyle: TextStyle(color: Color(0xFFABABAB))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      validator: (v){
                        if(v!.isEmpty){
                          return "This Field is required";
                        }
                      },
                      controller: nameTEC,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Color(0xFFABABAB))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      validator: (v){
                        if(v!.isEmpty){
                          return "This Field is required";
                        }
                      },
                      controller: phoneTEC,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Phone #",
                          hintStyle: TextStyle(color: Color(0xFFABABAB))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: priceTEC,
                      validator: (v){
                        if(v!.isEmpty){
                          return "This Field is required";
                        }
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kMain),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Price",
                          hintStyle: TextStyle(color: Color(0xFFABABAB))),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: DateTimePicker(
            //     type: DateTimePickerType.dateTimeSeparate,
            //     dateMask: 'd MMM, yyyy',
            //     initialValue: DateTime.now().toString(),
            //     firstDate: DateTime(2000),
            //     lastDate: DateTime(2100),
            //     icon: const Icon(
            //       Icons.event,
            //       color: kMain,
            //     ),
            //     dateLabelText: 'Date',
            //     timeLabelText: "Time",
            //     selectableDayPredicate: (date) {
            //       // Disable weekend days to select from the calendar
            //       if (date.weekday == 8 || date.weekday == 8) {
            //         return false;
            //       }
            //
            //       return true;
            //     },
            //     // ignore: avoid_print
            //     onChanged: (val) => print(val),
            //     validator: (val) {
            //       // ignore: avoid_print
            //       print(val);
            //       return null;
            //     },
            //     // ignore: avoid_print
            //     onSaved: (val) => print(val),
            //   ),
            // ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if(_formKey.currentState!.validate()){
                  var ref = FirebaseDatabase.instance.reference().child("Bids").push();
                  ref.update({
                    "bidId": ref.key.toString(),
                    "uid": uid,
                    "eventType": eventTypeTEC.text,
                    "eventDate": eventDateTEC.text,
                    "eventPlace": placeTEC.text,
                    "numOfPeople": numOfPeopleTEC.text,
                    "name": nameTEC.text,
                    "phone": phoneTEC.text,
                    "price": priceTEC.text,
                    "dateTime": DateTime.now().toString()
                  }).then((value){
                    Get.off(()=>SeekerDashboard());
                  }).catchError((err)=>{
                    Get.snackbar("Error", err.toString())
                  });
                }

                const snackBar = SnackBar(content: Text('Bid Posted'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SeekerBidPosted()));
              },
              child: Card(
                elevation: 5,
                color: kMain,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const SizedBox(
                    width: 170,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Post",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
