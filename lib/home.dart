import 'package:flutter/material.dart';
import 'package:proj_visitcard/qrcodepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController workcontroller = TextEditingController();
  TextEditingController compcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController websitecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple QR code Generator"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Form(
                child: imtext(
                  Icon(Icons.person),
                  "Name and Surname",
                  Color.fromARGB(255, 0, 255, 221),
                  TextInputType.text,
                  namecontroller,
                ),
              ),

              SizedBox(height: 10),
              imtext(
                Icon(Icons.work),
                "Work Position",
                Color.fromARGB(255, 63, 158, 8),
                TextInputType.text,
                workcontroller,
              ),
              SizedBox(height: 10),
              imtext(
                Icon(Icons.account_balance_rounded),
                "Company Name",
                Color.fromARGB(255, 255, 208, 0),
                TextInputType.text,
                compcontroller,
              ),
              SizedBox(height: 10),
              imtext(
                Icon(Icons.call),
                "Phone Number",
                Color.fromARGB(255, 100, 9, 185),
                TextInputType.phone,
                phonecontroller,
              ),
              SizedBox(height: 10),
              imtext(
                Icon(Icons.mail_rounded),
                "E-mail",
                Color.fromARGB(255, 255, 0, 149),
                TextInputType.emailAddress,
                mailcontroller,
              ),
              SizedBox(height: 10),
              imtext(
                Icon(Icons.web),
                "Web site(optional)",
                Color.fromARGB(255, 255, 0, 0),
                TextInputType.emailAddress,
                websitecontroller,
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      if (namecontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Name should don't empty!!!"),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else if (workcontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Work position should don't empty!!!",
                            ),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else if (compcontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Company name should don't empty!!!"),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else if (phonecontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Phone should don't empty!!!"),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else if (mailcontroller.text.isEmpty ||
                          mailcontroller.text.indexOf("@") == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "mail should don't empty and sould have '@' in mail !!! ",
                            ),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else if (websitecontroller.text.isNotEmpty) {
                        if (websitecontroller.text.indexOf(".") == -1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "mail should don't empty and sould have '@' in mail !!! ",
                              ),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => QrCodePage(
                                    namecontroller.text,
                                    workcontroller.text,
                                    compcontroller.text,
                                    phonecontroller.text,
                                    mailcontroller.text,
                                    websitecontroller.text,
                                  ),
                            ),
                          );
                      } else
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => QrCodePage(
                                  namecontroller.text,
                                  workcontroller.text,
                                  compcontroller.text,
                                  phonecontroller.text,
                                  mailcontroller.text,
                                  websitecontroller.text,
                                ),
                          ),
                        );
                    });
                  },
                  child: Center(child: Text("Create QR code")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class imtext extends StatelessWidget {
  final Icon ikon;
  final String hint;
  final Color focusbr;
  final TextInputType txtinput;
  final TextEditingController txtcontroller;
  const imtext(
    this.ikon,
    this.hint,
    this.focusbr,
    this.txtinput,
    this.txtcontroller,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: txtcontroller,
        keyboardType: txtinput,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: ikon,
          hintText: hint,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: focusbr),
          ),
        ),
      ),
    );
  }
}
