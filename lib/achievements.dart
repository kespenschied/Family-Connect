//By: Kole Espenschied
//April 8th, 2019

//**************************************************
//This class holds all the Achievement Page widgets
//**************************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Achievements'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
      body: ListView( //ListView here lets the page scroll as more items are added.
        children: <Widget>[
          AchievementContainerTitle(Colors.green, 'Completed Achievements:'),
          RecentAchievements(),
          AchievementContainerTitle(Colors.orange, 'Achievements In Progress:'),
          InProgressAchievements(),
          AchievementContainerTitle(Colors.red, 'Untouched Achievements:'),
          NoProgressAchievements(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black87,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

//This class builds all the titles for this page, specifically the titles
//"Completed Achievements", "Achievements In Progess", "Untouched Achievements"
class AchievementContainerTitle extends StatelessWidget {
  final Color titleColor;
  final String titleText;

  AchievementContainerTitle(this.titleColor, this.titleText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 25.0,
      color: titleColor,
      child: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

//This class creates all the cards on the page. You specify the achievement Title,
//Subtitle, The left "achievementIcon", the face icons on the right, "rightIcon",
//and the color of said rightIcon
class AchievementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData achievementIcon;
  final IconData rightIcon;
  final Color rightIconColor;

  AchievementCard(this.title, this.subtitle, this.achievementIcon, this.rightIcon, this.rightIconColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: Icon(
            achievementIcon,
            size: 60.0,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          trailing: Icon(
            rightIcon,
            size: 50.0,
            color: rightIconColor,
          ),
        ),
      ),
    );
  }
}


//*******************************************************************************
//The following three classes just build the cards onto the screen, it's not the
//most efficient way, will need to be re-written when actually passing it data.
//I did this early, so I created 3 classes here. A better way to do it would be
//to just create a function that returns a widget. Look in 'journal.dart' for a
//function example.
//*******************************************************************************
class RecentAchievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        AchievementCard('Bookworm', 'You Read 10 Books!', Icons.book, Icons.sentiment_very_satisfied, Colors.green),
        AchievementCard('Bookworm', 'You Read 10 Books!', Icons.book, Icons.sentiment_very_satisfied, Colors.green),
        AchievementCard('Bookworm', 'You Read 10 Books!', Icons.book, Icons.sentiment_very_satisfied, Colors.green),
        AchievementCard('Bookworm', 'You Read 10 Books!', Icons.book, Icons.sentiment_very_satisfied, Colors.green),
        AchievementCard('Bookworm', 'You Read 10 Books!', Icons.book, Icons.sentiment_very_satisfied, Colors.green),
        AchievementCard('Bookworm', 'You Read 10 Books!', Icons.book, Icons.sentiment_very_satisfied, Colors.green),
      ],
    ));
  }
}

class InProgressAchievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        AchievementCard('Homework Destroyer', 'Finish All Homework For The Week!', Icons.school, Icons.sentiment_satisfied, Colors.orange),
        AchievementCard('Homework Destroyer', 'Finish All Homework For The Week!', Icons.school, Icons.sentiment_satisfied, Colors.orange),
        AchievementCard('Homework Destroyer', 'Finish All Homework For The Week!', Icons.school, Icons.sentiment_satisfied, Colors.orange),
        AchievementCard('Homework Destroyer', 'Finish All Homework For The Week!', Icons.school, Icons.sentiment_satisfied, Colors.orange),
        AchievementCard('Homework Destroyer', 'Finish All Homework For The Week!', Icons.school, Icons.sentiment_satisfied, Colors.orange),
      ],
    ));
  }
}

class NoProgressAchievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        AchievementCard('Chore Warrior', 'Finish All Chores Assigned!', Icons.storage, Icons.sentiment_neutral, Colors.red),
        AchievementCard('Chore Warrior', 'Finish All Chores Assigned!', Icons.storage, Icons.sentiment_neutral, Colors.red),
        AchievementCard('Chore Warrior', 'Finish All Chores Assigned!', Icons.storage, Icons.sentiment_neutral, Colors.red),
        AchievementCard('Chore Warrior', 'Finish All Chores Assigned!', Icons.storage, Icons.sentiment_neutral, Colors.red),
        AchievementCard('Chore Warrior', 'Finish All Chores Assigned!', Icons.storage, Icons.sentiment_neutral, Colors.red),
        AchievementCard('Chore Warrior', 'Finish All Chores Assigned!', Icons.storage, Icons.sentiment_neutral, Colors.red),
      ],
    ));
  }
}
