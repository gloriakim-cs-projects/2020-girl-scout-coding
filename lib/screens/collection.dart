import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/default_theme.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/images_by_grade.dart';

import 'package:girl_scout_simple/components/globals.dart';
import 'package:girl_scout_simple/components/badge_container.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';

class Collection extends StatefulWidget {
  static String id = '/Collection';

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme().theme,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "ALL"),
                Tab(text: "DAISY"),
                Tab(text: "BROWNIE"),
                Tab(text: "JUNIOR"),
                Tab(text: "CADETTE"),
                Tab(text: "SENIOR"),
                Tab(text: "AMBASSADOR"),
              ],
            ),
            title: const Text(
              'Badges',
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            actions: <Widget>[
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.search, color: kBlackColor,),),
              SizedBox(width: 10.0),
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.apps, color: kBlackColor,),),
              SizedBox(width: 10.0),
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.format_list_bulleted, color: kBlackColor,),),
              SizedBox(width: 10.0),
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.get_app, color: kBlackColor,),),
              SizedBox(width: 10.0),
            ],
            backgroundColor: kWhiteColor,

          ),
          backgroundColor: kLightGreyBackgroundColor,
          //Note: ListView makes the page vertically scrollable.
          body: TabBarView(
            children: [
              Column(
                  children: <Widget>[
                    ReusableCard(
                      title: 'Badges', subtitle: 'All', addIcon: true,
                      cardChild: Column(
                        children: <Widget>[
                          ListView(
                            shrinkWrap: true,
                            children: getBadgeWidgetList(gradeEnum.ALL)
                          ),
                        ],
                      ),
                    ),

                    ///THIS IS USED FOR PATCHES
                    ReusableCard(
                      title: 'Patches', subtitle: 'All', addIcon: true,
                      cardChild:
                      ListView(
                          shrinkWrap: true,
                          children: getBadgeWidgetList(gradeEnum.ALL)
                      ),
                    ),
                  ]
              ),
              Column(
                  children: <Widget>[
                    ReusableCard(
                      title: 'Badges', subtitle: 'Daisy', addIcon: true,
                      cardChild: Column(
                        children: <Widget>[
                          ListView(
                              shrinkWrap: true,
                              children: getBadgeWidgetList(gradeEnum.DAISY)
                          ),
                        ],
                      ),
                    ),

                    ///THIS IS USED FOR PATCHES
                    ReusableCard(
                      title: 'Patches', subtitle: 'Daisy', addIcon: true,
                      cardChild:
                      ListView(
                          shrinkWrap: true,
                          children: getBadgeWidgetList(gradeEnum.DAISY)
                      ),
                    ),
                  ]
              ),
              Column(
                  children: <Widget>[
                    ReusableCard(
                      title: 'Badges', subtitle: 'Brownie', addIcon: true,
                      cardChild: Column(
                        children: <Widget>[
                          ListView(
                              shrinkWrap: true,
                              children: getBadgeWidgetList(gradeEnum.BROWNIE)
                          ),
                        ],
                      ),
                    ),

                    ///THIS IS USED FOR PATCHES
                    ReusableCard(
                      title: 'Patches', subtitle: 'Brownie', addIcon: true,
                      cardChild:
                      ListView(
                          shrinkWrap: true,
                          children: getBadgeWidgetList(gradeEnum.BROWNIE)
                      ),
                    ),
                  ]
              ),
              Column(
                  children: <Widget>[
                    ReusableCard(
                      title: 'Badges', subtitle: 'Junior', addIcon: true,
                      cardChild: Column(
                        children: <Widget>[
                          ListView(
                              shrinkWrap: true,
                              children: getBadgeWidgetList(gradeEnum.JUNIOR)
                          ),
                        ],
                      ),
                    ),

                    ///THIS IS USED FOR PATCHES
                    ReusableCard(
                      title: 'Patches', subtitle: 'Junior', addIcon: true,
                      cardChild:
                      ListView(
                          shrinkWrap: true,
                          children: getBadgeWidgetList(gradeEnum.JUNIOR)
                      ),
                    ),
                  ]
              ),
              Column(
                  children: <Widget>[
                    ReusableCard(
                      title: 'Badges', subtitle: 'Cadette', addIcon: true,
                      cardChild: Column(
                        children: <Widget>[
                          ListView(
                              shrinkWrap: true,
                              children: getBadgeWidgetList(gradeEnum.CADETTE)
                          ),
                        ],
                      ),
                    ),

                    ///THIS IS USED FOR PATCHES
                    ReusableCard(
                      title: 'Patches', subtitle: 'Cadette', addIcon: true,
                      cardChild:
                      ListView(
                          shrinkWrap: true,
                          children: getBadgeWidgetList(gradeEnum.CADETTE)
                      ),
                    ),
                  ]
              ),
              Column(
                  children: <Widget>[
                    ReusableCard(
                      title: 'Badges', subtitle: 'Senior', addIcon: true,
                      cardChild: Column(
                        children: <Widget>[
                          ListView(
                              shrinkWrap: true,
                              children: getBadgeWidgetList(gradeEnum.SENIOR)
                          ),
                        ],
                      ),
                    ),

                    ///THIS IS USED FOR PATCHES
                    ReusableCard(
                      title: 'Patches', subtitle: 'Senior', addIcon: true,
                      cardChild:
                      ListView(
                          shrinkWrap: true,
                          children: getBadgeWidgetList(gradeEnum.SENIOR)
                      ),
                    ),
                  ]
              ),
              Column(
                  children: <Widget>[
                    ReusableCard(
                      title: 'Badges', subtitle: 'Ambassador', addIcon: true,
                      cardChild: Column(
                        children: <Widget>[
                          ListView(
                              shrinkWrap: true,
                              children: getBadgeWidgetList(gradeEnum.AMBASSADOR)
                          ),
                        ],
                      ),
                    ),

                    ///THIS IS USED FOR PATCHES
                    ReusableCard(
                      title: 'Patches', subtitle: 'Ambassador', addIcon: true,
                      cardChild:
                      ListView(
                          shrinkWrap: true,
                          children: getBadgeWidgetList(gradeEnum.AMBASSADOR)
                      ),
                    ),
                  ]
              ),],
          ),
        ),
      ),
    );
  }
}
