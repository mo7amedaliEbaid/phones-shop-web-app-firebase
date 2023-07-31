import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {

  Future<void>? _launched;
  final GlobalKey<FormState> _messageformKey = GlobalKey<FormState>();

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
/*  ontapsend(BuildContext context) {
    if (_messageformKey.currentState!.validate()) {
      Navigator.of(context).push(DismissibleDialog<void>(
          popUpFields: new PopUpFields(
              "Thanks",
              "Thanks for your message!\nWe will contact you soon",
              true,
              false)));
    }
  }*/
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
     // backgroundColor: scafoldBackground,
      appBar: AppBar(
       // backgroundColor: scafoldBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Contact Us",
        //  style: titleStyle,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Form(
        key: _messageformKey,
        child: ListView(children: [
          SizedBox(height: size.height * 0.09),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _launched = _launchInWebViewOrVC(
                      Uri.parse(""));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  width: size.width * 0.44,
                  height: size.height * 0.24,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.028),
                      Icon(
                        Icons.email_outlined,
                        size: 45,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "Email Address",
                       // style: hintStyle,
                      ),
                      SizedBox(height: size.height * 0.02),
                    /*  Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AutoSizeText(
                          "user@atyabalmarshoud.kw",
                          style: smallStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.05),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                width: size.width * 0.44,
                height: size.height * 0.24,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.028),
                    Icon(
                      Icons.phone,
                      size: 45,
                    ),
                    SizedBox(height: size.height * 0.02),
                    /*Text(
                      "Phone",
                      style: hintStyle,
                    ),*/
                    SizedBox(height: size.height * 0.02),
                   /* Text(
                      "256655677",
                      style: smallStyle,
                    ),*/
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Send us a message'.toUpperCase(),
           //   style: titleStyle,
            ),
          ),
          //SizedBox(height: size.height*0.02),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "" ;/*AppLocalization.of(context)
                      .getTranslatedValue("name_validate")
                      .toString();*/
                }
                return null;
              },
              decoration: InputDecoration(
                //  errorStyle:errorstyle,
                  filled: true,
                //  hintStyle: hintStyle,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "";/* AppLocalization.of(context)
                      .getTranslatedValue("emailvalidate")
                      .toString();*/
                }
                return null;
              },
              decoration: InputDecoration(
                 // errorStyle:errorstyle,
                  filled: true,
                 // hintStyle: hintStyle,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  filled: true,
              //    hintStyle: hintStyle,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Phone Number'),
            ),
          ),
          Container(
            height: size.height*.25,
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Message can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                     // errorStyle:errorstyle,
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Message',
                      /*hintStyle: hintStyle*/),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //ontapsend(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                    'Send'.toUpperCase(),
                    //style: boldWhite
                ),
              ),
            ),
          ),
        //  vertical_space,
        //  vertical_space,
        ]),
      ),
    );
  }
}
