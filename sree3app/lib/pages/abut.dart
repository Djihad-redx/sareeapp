
library contactus;

import 'package:flutter/material.dart';
import 'package:sree3app/widget/drawer.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

///Class for adding contact details/profile details as a complete new page in your flutter app.
class ContactUs extends StatelessWidget {
  ///Logo of the Company/individual
  final ImageProvider logo;

  ///Ability to add an image
  final Image image;

  ///Phone Number of the company/individual
  final String phoneNumber;

  ///Text for Phonenumber
  final String phoneNumberText;

  ///Website of company/individual
  final String website;

  ///Text for Website
  final String websiteText;

  ///Email ID of company/individual
  final String email;

  ///Text for Email
  final String emailText;

  ///Twitter Handle of Company/Individual
  final String twitterHandle;

  ///Facebook Handle of Company/Individual
  final String facebookHandle;

  ///Linkedin URL of company/individual
  final String linkedinURL;

  ///Github User Name of the company/individual
  final String githubUserName;

  ///Name of the Company/individual
  final String companyName;

  ///Font size of Company name
  final double companyFontSize;

  ///TagLine of the Company or Position of the individual
  final String tagLine;

  ///Instagram User Name of the company/individual
  final String instagram;

  ///TextColor of the text which will be displayed on the card.
  final Color textColor;

  ///Color of the Card.
  final Color cardColor;

  ///Color of the company/individual name displayed.
  final Color companyColor;

  ///Color of the tagLine of the Company/Individual to be displayed.
  final Color taglineColor;

  ///Constructor which sets all the values.
  ContactUs(
      {@required this.companyName,
        @required this.textColor,
        @required this.cardColor,
        @required this.companyColor,
        @required this.taglineColor,
        @required this.email,
        this.emailText,
        this.logo,
        this.image,
        this.phoneNumber,
        this.phoneNumberText,
        this.website,
        this.websiteText,
        this.twitterHandle,
        this.facebookHandle,
        this.linkedinURL,
        this.githubUserName,
        this.tagLine,
        this.instagram,
        this.companyFontSize});

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 8.0,
          contentPadding: EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => launch('tel:' + phoneNumber),
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text('Call'),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => launch('sms:' + phoneNumber),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Text('Message'),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => launch('https://wa.me/' + phoneNumber),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Text('WhatsApp'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Visibility(
            //   visible: logo != null,
            //  // child:
            //   // CircleAvatar(
            //   //   radius: 50.0,
            //   //   backgroundImage: logo,
            //   // ),
            // ),
            Visibility(
                visible: image != null, child: image ?? SizedBox.shrink()),
            Text(
              companyName,
              style: TextStyle(
                fontFamily: 'DIN Next LT W23',
                fontSize: 25,
                color: companyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Visibility(
            //   visible: tagLine != null,
            //   child: Text(
            //     tagLine ?? "",
            //     style: TextStyle(
            //       color: taglineColor,
            //       fontSize: 20.0,
            //       letterSpacing: 2.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.black,
              thickness: 4,
              indent: 50.0,
              endIndent: 50.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Visibility(
              visible: website != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: cardColor,
                child: ListTile(
                  leading: Icon(Typicons.link),
                  title: Text(
                    websiteText ?? 'الموقع الرسمي',
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'DIN Next LT W23',
                    ),
                  ),
                  onTap: () => launch(website),
                ),
              ),
            ),
            Visibility(
              visible: phoneNumber != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: cardColor,
                child: ListTile(
                  leading: Icon(Typicons.phone),
                  title: Text(
                    phoneNumberText ?? 'رقم الهاتف',
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'DIN Next LT W23',
                    ),
                  ),
                  onTap: () => showAlert(context),
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: cardColor,
              child: ListTile(
                leading: Icon(Typicons.mail),
                title: Text(
                  emailText ?? 'الايميل',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'DIN Next LT W23',
                  ),
                ),
                onTap: () => launch('mailto:' + email),
              ),
            ),
            Visibility(
              visible: twitterHandle != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: cardColor,
                child: ListTile(
                  leading: Icon(Typicons.social_twitter),
                  title: Text(
                    'تويتر',
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'DIN Next LT W23',
                    ),
                  ),
                  onTap: () => launch('https://twitter.com/sree3ksa' ),
                ),
              ),
            ),
            Visibility(
              visible: facebookHandle != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: cardColor,
                child: ListTile(
                  leading: Icon(Typicons.social_facebook),
                  title: Text(
                    'فيس بوك',
                    style: TextStyle(
                      fontFamily: 'DIN Next LT W23',
                      color: textColor,
                    ),
                  ),
                  onTap: () => launch('https://www.facebook.com/sree3ksa1/' ),
                ),
              ),
            ),
            Visibility(
              visible: instagram != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: cardColor,
                child: ListTile(
                  leading: Icon(Typicons.social_instagram),
                  title: Text(
                    'انستكرام',
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'DIN Next LT W23',
                    ),
                  ),
                  onTap: () => launch('https://www.instagram.com/sree3ksa/' + instagram),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 200,

              child: Image.asset('assets/imge/logos/header.png'),

            )
            // Visibility(
            //   visible: githubUserName != null,
            //   child: Card(
            //     clipBehavior: Clip.antiAlias,
            //     margin: EdgeInsets.symmetric(
            //       vertical: 10.0,
            //       horizontal: 25.0,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50.0),
            //     ),
            //     color: cardColor,
            //     child: ListTile(
            //       leading: Icon(Typicons.social_github),
            //       title: Text(
            //         'Github',
            //         style: TextStyle(
            //           color: textColor,
            //         ),
            //       ),
            //       onTap: () => launch('https://github.com/' + githubUserName),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: linkedinURL != null,
            //   child: Card(
            //     clipBehavior: Clip.antiAlias,
            //     margin: EdgeInsets.symmetric(
            //       vertical: 10.0,
            //       horizontal: 25.0,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50.0),
            //     ),
            //     color: cardColor,
            //     child: ListTile(
            //       leading: Icon(Typicons.social_linkedin),
            //       title: Text(
            //         'Linkedin',
            //         style: TextStyle(
            //           color: textColor,
            //         ),
            //       ),
            //       onTap: () => launch(linkedinURL),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

///Class for adding contact details of the developer in your bottomNavigationBar in your flutter app.
class ContactUsBottomAppBar extends StatelessWidget {
  ///Color of the text which will be displayed in the bottomNavigationBar
  final Color textColor;

  ///Color of the background of the bottomNavigationBar
  final Color backgroundColor;

  ///Email ID Of the company/developer on which, when clicked by the user, the respective mail app will be opened.
  final String email;

  ///Name of the company or the developer
  final String companyName;

  ///Size of the font in bottomNavigationBar
  final double fontSize;

  ContactUsBottomAppBar(
      {@required this.textColor,
        @required this.backgroundColor,
        @required this.email,
        @required this.companyName,
        this.fontSize = 15.0});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: backgroundColor,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Text(
        'Designed and Developed by $companyName ',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: fontSize,fontFamily: 'DIN Next LT W23',),
      ),
      onPressed: () => launch('$email'),
    );
  }
}
class Abut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: ' شركة البيانات المتقدمة',
          textColor: Colors.white,
         // backgroundColor: Colors.teal.shade300,
          email: 'https://advd.com.sa/ar/',
        ),
        backgroundColor: Color(0xfffed700),
        body: ContactUs(
            cardColor: Colors.white,
            textColor: Colors.black,
            logo: AssetImage('assets/imge/logos/header.png'),
            email: 'info@sree3.com',
            companyName: 'شركة سريع المتقدمة',
            companyColor: Colors.black,
            phoneNumber: '+90599260130',
            website: 'https://sree3.com.sa/',
            // githubUserName: 'AbhishekDoshi26',
            // linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
            tagLine: '',
            taglineColor: Colors.black,
            twitterHandle: 'AbhishekDoshi26',
            instagram: '_abhishek_doshi',
            facebookHandle: '_abhishek_doshi'
        ),
        endDrawer: AppDrawer(),
        // appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        //   title: Text(
        //       'حول الشركة', style: TextStyle(color: Colors.black)),
        //   backgroundColor: Color(0xfffed700),),
      ),
    );
  }
}