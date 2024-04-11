
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sanchit_portfolio/components/animated_progress_indicator.dart';
import 'package:sanchit_portfolio/modals/prov.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
 String cvURL = 'https://drive.google.com/file/d/1xSySY6tJivvx2IX2_HYSeKr79WBntjw_/view?usp=sharing';
 var _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<ThemeModeProv>(context);
    return Drawer(
      child: SafeArea(
        child: Column(

          children: [
            MyInfo(context,thmode),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: "Residence",
                      text: "INDIA",
                    ),
                    AreaInfoText(
                      title: "City",
                      text: "Bangalore",
                    ),
                    AreaInfoText(
                      title: "Age",
                      text: "26",
                    ),
                    Skills(context),
                    SizedBox(height: defaultPadding),
                    Coding(context),
                    Knowledges(context),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    TextButton(
                      onPressed: () {



                            _launchUrl(
                                cvURL);

                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: darkColor,
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.linkedin.com/in/sanchitsaran/");
                            },
                            icon: Image.asset("assets/icons/ld.png"),
                          ),
                          IconButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://github.com/SanchitSaran");
                            },
                            icon: Image.asset("assets/icons/git.png"),
                          ),
                         /* IconButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.youtube.com/channel/UCyRt3BNQhVnYmfwVeMQAOxw");
                            },
                            icon: SvgPicture.asset("assets/icons/yt.svg"),

                          ),
                          IconButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.amazon.in/shop/sanchitsaran");
                            },
                            icon: SvgPicture.asset("assets/icons/yt.svg"),
                          ),IconButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.instagram.com/sanchitsaran/?hl=en");
                            },
                            icon: SvgPicture.asset("assets/icons/yt.svg"),
                          ),*/
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String urls) async {
    final url = urls;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

 Widget MyInfo(BuildContext context,ThemeModeProv thmode) {
    return AspectRatio(
      aspectRatio: 1.25,
      child: Container(
        color: darkColor,
        child: Column(
          children: [
            Spacer(flex: 2),
          /*  Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Switch(
                  value: thmode.lightMode,
                  onChanged: (bool val) {
                    thmode.changeMode();
                  },
                ),
              ],
            ),*/
            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("assets/images/prof.jpeg"),
            ),
            Spacer(),
            Text(
              "Sanchit Saran",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              "MOBILE | WEB | UI/UX | SEO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

 Widget AreaInfoText({String? title, String? text}) {
   return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(color: Colors.white),
          ),
          Text(text!),
        ],
      ),
    );
  }

 Widget Skills(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Skills",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AnimatedCircularProgressIndicator(
                percentage: 0.9,
                label: "Flutter",
              ),
            ),
            SizedBox(width: defaultPadding),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                percentage: 0.85,
                label: "SEO",
              ),
            ),
            SizedBox(width: defaultPadding),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                percentage: 0.8,
                label: "UI/UX",
              ),
            ),
          ],
        ),
      ],
    );
  }

 Widget Coding(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.90,
          label: "Dart",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.70,
          label: "JAVA",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "HTML",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "CSS",
        ),
        /*AnimatedLinearProgressIndicator(
          percentage: 0.62,
          label: "Node JS",
        ),*/
      ],
    );
  }

 Widget Knowledges(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding),
          child: Text(
            "Knowledges",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        KnowledgeText(text: "Flutter, Android, Dart"),
        KnowledgeText(text: "SMM, Keywords, Youtube"),
        KnowledgeText(text: "IDE : Android Studio/Xcode"),
        KnowledgeText(text: "GIT Knowledge, RESTful APIs"),
        KnowledgeText(text: "Agile & Scrum"),
      ],
    );
  }

 Widget KnowledgeText({String? text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          SizedBox(height: 20,width:20,child: Image.asset("assets/icons/chck.png")),
         //  CircleAvatar(
         //    radius: 15,
         //    backgroundColor: Colors.white,
         //    backgroundImage: AssetImage("assets/images/yt.png"),
         //  ),
          SizedBox(width: defaultPadding / 2),
          Text(text!),
        ],
      ),
    );
  }
}