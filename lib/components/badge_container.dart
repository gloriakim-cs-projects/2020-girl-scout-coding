//Hopefully this file will contain all data for members and return a list of widgets
//I am not sure that this is acceptable, but i believe that having all members accessable at a global level is optimal for our program to function efficiently.
//this file contains 8 lists and a couple functions for placing scouts into those lists based on thier level.abstract
//return funtion of this file returns a list of rows, each holding a member and an edit widget. pretty neat right? flutter is great!
import 'dart:io';

import 'package:girl_scout_simple/components/database_operations.dart';
import 'package:girl_scout_simple/components/badge_card.dart';
import 'package:girl_scout_simple/components/globals.dart' as globals;
import 'package:girl_scout_simple/models.dart';


import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

//returns 0 if scout is placed in a list, this can be used my the add_member_card to verify that all fields are filled out
void addBadgeToList(String grade, String name, String description, List<String> requirements, String photoLocation) {
  if (name == '') return null;
  //all other variables should come from a list the user has to chose, meaning that there is no room for empty fields as all fields will be populated with the first choice.

  gradeEnum g;

  switch (grade)
  {
    case 'Daisy':
    case 'DAISY':
      g  = gradeEnum.DAISY;
      break;
    case 'Brownie':
    case 'BROWNIE':
      g  = gradeEnum.BROWNIE;
      break;
    case 'Junior':
    case 'JUNIOR':
      g  = gradeEnum.JUNIOR;
      break;
    case 'Cadette':
    case 'CADETTE':
      g  = gradeEnum.CADETTE;
      break;
    case 'Senior':
    case 'SENIOR':
      g  = gradeEnum.SENIOR;
      break;
    case 'Ambassador':
    case 'AMBASSADOR':
      g = gradeEnum.AMBASSADOR;
      break;
  }

  var newData = new globals.BadgeData(
    grade: g,
    name: name,
    description: description,
    requirements: requirements,
    photoLocation: photoLocation,
  );

  switch (g) {
    case gradeEnum.DAISY:
      globals.daisyListBadge.add(newData);
      break;
    case gradeEnum.BROWNIE:
      globals.brownieListBadge.add(newData);
      break;
    case gradeEnum.JUNIOR:
      globals.juniorListBadge.add(newData);
      break;
    case gradeEnum.CADETTE:
      globals.cadetteListBadge.add(newData);
      break;
    case gradeEnum.SENIOR:
      globals.seniorListBadge.add(newData);
      break;
    case gradeEnum.AMBASSADOR:
      globals.ambassadorListBadge.add(newData);
      break;
  }
  globals.allListBadge.add(newData);
  //db.writeBadgeList(grade); //this needs to work with HIVE
}

int getBadgeNum(String grade, String name) {
  if (grade == '') return null;
  //all other variables should come from a list the user has to chose, meaning that there is no room for empty fields as all fields will be populated with the first choice.

  gradeEnum g;

  switch (grade)
  {
    case 'Daisy':
      g  = gradeEnum.DAISY;
      break;
    case 'Brownie':
      g  = gradeEnum.BROWNIE;
      break;
    case 'Junior':
      g  = gradeEnum.JUNIOR;
      break;
    case 'Cadette':
      g  = gradeEnum.CADETTE;
      break;
    case 'Senior':
      g  = gradeEnum.SENIOR;
      break;
    case 'Ambassador':
      g = gradeEnum.AMBASSADOR;
      break;
  }

  //perform query

  return 0;
}

/*
void deleteMember(gradeEnum grade, BadgeData data)
{
  GirlScoutDatabase db = GirlScoutDatabase();

  switch (grade)
  {
    case gradeEnum.DAISY:
      globals.daisyListBadge.remove(data);
      break;
    case gradeEnum.BROWNIE:
      globals.brownieListBadge.remove(data);
      break;
    case gradeEnum.JUNIOR:
      globals.juniorListBadge.remove(data);
      break;
    case gradeEnum.CADETTE:
      globals.cadetteListBadge.remove(data);
      break;
    case gradeEnum.SENIOR:
      globals.seniorListBadge.remove(data);
      break;
    case gradeEnum.AMBASSADOR:
      globals.ambassadorListBadge.remove(data);
      break;
  }
  globals.allListBadge.remove(data);
  final dir = Directory(data.photoLocation);
  dir.delete(recursive:true); //maybe change to false
  //db.writeBadgeList(grade); //HIVE
}

 */

//this function also add the add member card at the end of the list.
List<Widget> getBadgeWidgetList(gradeEnum grade) {
  var returnList = new List<Widget>();
  var gradeList;

  gradeList = globals.getGradeBadges(grade);

  for (var i in gradeList) {
    returnList.add(new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new BadgeCard(grade: i.grade,
              name: i.name,
              description: i.description,
              requirements: i.requirements,
              quantity: 0,//getBadgeNum(describeEnum(i.grade), i.name),
              photoLocation: i.photoLocation),
        ]));
  }
  return returnList;
}

//this function also add the add member card at the end of the list.
List<Widget> getScoutBadgesWidgetList(String name) {
  var returnList = new List<Widget>();
  var memberBadgesList = globals.db.getMemberBadges(name);

  if (memberBadgesList != null) {
    print('creating member\'s badges widgets');
    for (var i in memberBadgesList) {
      Grade badgeGrade = i.grade.first;
      returnList.add(new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new BadgeCard(grade: badgeGrade.name,
                name: i.name,
                description: i.description,
                requirements: i.requirements,
                quantity: 0,
                //getBadgeNum(describeEnum(i.grade), i.name),
                photoLocation: i.photoPath),
          ]));
    }
  }
  print('returning member\'s badges widgets');
  return returnList;
}

