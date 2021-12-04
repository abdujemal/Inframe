import 'package:flutter/material.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/screens/seeker_path/seeker_issue_reported.dart';

class SeekerHelpCenter extends StatefulWidget {
  const SeekerHelpCenter({Key? key}) : super(key: key);

  @override
  State<SeekerHelpCenter> createState() => _SeekerHelpCenterState();
}

class _SeekerHelpCenterState extends State<SeekerHelpCenter> {
  final formKey = GlobalKey<FormState>();
  final reportabugController = TextEditingController();
  // reportaBug() async {
  //   if (formKey.currentState!.validate()) {
  //     await databaseMethods.reportbug(reportabugController.text);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      color: kMain,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 80)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
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
                          top: 70,
                        ),
                        child: Text(
                          "Help Center",
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
              const Text(
                "Report a issue",
                style: TextStyle(fontSize: 34, color: Color(0xFFABABAB)),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: reportabugController,
                  textAlign: TextAlign.left,
                  maxLines: 12,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                        color: Color(0xFFADA6A6),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      hintText: "Write a breif description of your problem",
                      contentPadding: const EdgeInsets.all(20.0),
                      fillColor: Colors.white70),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeekerIssueReported()));
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
                          "Submit",
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
      ),
    );
  }
}
