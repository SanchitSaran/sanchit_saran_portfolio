import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sanchit_portfolio/modals/Project.dart';
import 'package:sanchit_portfolio/modals/Recommendation.dart';
import 'package:sanchit_portfolio/responsive.dart';
import 'package:sanchit_portfolio/screens/main/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
       Column( crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           HomeBanner(context),
           Summary(context),
           Recommendations(context),
           MyProjects(context),

         ],
       )
      ],
    );
  }

 Widget HomeBanner(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/port.jpg",
            fit: BoxFit.cover,
          ),
          Container(color: darkColor.withOpacity(0.66)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Imagination is more important \nthan knowledge!",
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                      : Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (Responsive.isMobileLarge(context))
                  const SizedBox(height: defaultPadding / 2),
                MyBuildAnimatedText(context),
                SizedBox(height: defaultPadding),
                if (!Responsive.isMobileLarge(context))
                  ElevatedButton(
                    onPressed: () {
                      _launchUrl(
                          "https://www.linkedin.com/in/sanchitsaran/");
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2,
                          vertical: defaultPadding),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      "EXPLORE NOW",
                      style: TextStyle(color: darkColor),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

 Widget MyBuildAnimatedText(BuildContext context) {
   return DefaultTextStyle(
     // it applies same style to all the widgets under it
     style: Theme.of(context).textTheme.subtitle1!,
     maxLines: 1,
     child: Row(
       children:[

         if (!Responsive.isMobileLarge(context))
           SizedBox(width: defaultPadding / 2),
         Text("I build "),
         Responsive.isMobile(context)
             ? Expanded(child: AnimatedText())
             : AnimatedText(),
         if (!Responsive.isMobileLarge(context))
           SizedBox(width: defaultPadding / 2),

       ],
     ),
   );
 }

 Widget  AnimatedText() {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "chat apps with Google Maps an many more.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "complete dating, fitness, travel apps.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "responsive web and mobile app.",
          speed: Duration(milliseconds: 60),
        ),
      ],
    );
  }

 Widget Summary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: SummaryCard(context: context,
                  text: 'Experience of 3.5 years in Mobile App Development with involving software development, testing, implementation, execution and maintenance of application. Responsible for developing mobile applications from scratch for the origination.'
              ),
            ),
          ),
        ],
      ),
    );
  }

 Widget SummaryCard({required String text,required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width *0.7,
      padding: EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),

        ],
      ),
    );
  }

 Widget Recommendations(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.symmetric(vertical: defaultPadding),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           "Professional Experience",
           style: Theme.of(context).textTheme.headline6,
         ),
         const SizedBox(height: defaultPadding),
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children: List.generate(
               demo_recommendations.length,
                   (index) => Padding(
                 padding: const EdgeInsets.only(right: defaultPadding),
                 child: RecommendationCard(
                   recommendation: demo_recommendations[index], context: context,
                 ),
               ),
             ),
           ),
         ),
       ],
     ),
   );
 }

 Widget RecommendationCard({required Recommendation
 recommendation,required BuildContext context}) {
   return Container(
     width: MediaQuery.of(context).size.width * 0.5,
     padding: EdgeInsets.all(defaultPadding),
     color: secondaryColor,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           recommendation.name!,
           style: Theme.of(context).textTheme.subtitle2,
         ),
         Text(recommendation.source!),
         const SizedBox(height: defaultPadding),
         Text(
           recommendation.text!,
           maxLines: 5,
           overflow: TextOverflow.ellipsis,
           style: TextStyle(height: 1.5),
         )
       ],
     ),
   );
 }

 Widget MyProjects(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(
         "My Projects",
         style: Theme.of(context).textTheme.headline6,
       ),
       const SizedBox(height: defaultPadding),
       Responsive(
         mobile: ProjectsGridView(
           crossAxisCount: 1,
           childAspectRatio: 1.7,
         ),
         mobileLarge: ProjectsGridView(crossAxisCount: 2,childAspectRatio: 1.3),
         tablet: ProjectsGridView(childAspectRatio: 1.1,crossAxisCount: 3),
         desktop: ProjectsGridView(crossAxisCount: 3,   childAspectRatio: 1.3,),
       )
     ],
   );
 }

 Widget ProjectsGridView({ required int crossAxisCount,
    required double childAspectRatio}) {
   return GridView.builder(
     shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
     itemCount: demo_projects.length,
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: crossAxisCount,
       childAspectRatio: childAspectRatio,
       crossAxisSpacing: defaultPadding,
       mainAxisSpacing: defaultPadding,
     ),
     itemBuilder: (context, index) => ProjectCard(
       project: demo_projects[index],context: context
     ),
   );
 }

 Widget ProjectCard({Project? project,required BuildContext context}) {
   return Container
     (
     padding: const EdgeInsets.all(defaultPadding),
     color: secondaryColor,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           project!.title!,
           maxLines: 2,
           overflow: TextOverflow.ellipsis,
           style: Theme.of(context).textTheme.subtitle2,
         ),
         Spacer(),
         Text(
           project.description!,
           maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
           overflow: TextOverflow.ellipsis,
           style: TextStyle(height: 1.5),
         ),
         Spacer(),
         TextButton(
           onPressed: () {
             showDialog(context: context, builder: (BuildContext context) {
               return new AlertDialog(
                 content: new Text( project.description!),
               );
             });
           },
           child: Text(
             "Read More >>",
             style: TextStyle(color: primaryColor),
           ),
         ),
       ],
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
}

