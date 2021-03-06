import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/screens/add.dart';
import 'package:girl_scout_simple/screens/addBadge.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.parentPage, this.title, this.subtitle, @required this.addIcon, @required this.cardChild});
  final String parentPage;
  final String title;
  final String subtitle;
  final Widget cardChild;
  final bool addIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(
          color: kLightGreyColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            parentPage == 'Setting' ? ExcludeTitle() : IncludeTitle(title: title, subtitle: subtitle, addIcon: addIcon),
            //show only if subtitle is not null ('')
            subtitle == '' ? SizedBox(height: 0.0) : SizedBox(height: 10.0),
            subtitle == '' ? SizedBox() : Text(subtitle, style: Theme.of(context).textTheme.bodyText2),
            subtitle == '' ? SizedBox(height: 0.0) : SizedBox(height: 15.0),
            cardChild,
          ],
        ),
      ),
    );
  }
}

class ExcludeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

class IncludeTitle extends StatelessWidget {

  IncludeTitle({@required this.title, @required this.subtitle, @required this.addIcon});
  final String title;
  final String subtitle;
  final bool addIcon;

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          //Note: Place empty container if add icon is not needed.
          addIcon == false ? Container() :
          GestureDetector( onTap: () {
            //move to add
            //TODO: Figure out why this is not working >>>>>> Navigator.pushNamed(context, Add.id);
            (title == 'Badges') ? Navigator.push(context, MaterialPageRoute(builder: (context) =>  new AddBadge(title: 'Add Badge'))) :
            (title == 'Patches') ? Navigator.push(context, MaterialPageRoute(builder: (context) =>  new AddBadge(title: 'Add Patch'))) :
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  new Add(title: 'Add Member')));
            //Navigator.pop(context, "hi");
          }, child: Icon(Icons.add_circle), ),
        ],
      );
  }
}
