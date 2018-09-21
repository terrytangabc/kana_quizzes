import 'package:flutter/material.dart';
import 'pages/Scripts.dart';
import 'pages/Quizzes.dart';
import 'pages/Settings.dart';

// KanaQuizzes是一个有状态的组件，因为页面标题，页面内容和页面底部Tab都会改变
class KanaQuizzes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new KanaQuizzesState();
}

class KanaQuizzesState extends State<KanaQuizzes> {
  var _tabIndex = 0;
  var _appBarTitles = ['Kana', 'Quizzes', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: const Color(0xFF0B62B1)
      ),
      home: new Scaffold(
          appBar: new AppBar(
              title: new Text(_appBarTitles[_tabIndex],
                  style: new TextStyle(color: Colors.white)
              ),
              iconTheme: new IconThemeData(color: Colors.white)
          ),

          bottomNavigationBar: new BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: Icon(Icons.view_module),
                  title: Text('Kana')
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  title: Text('Quizzes')
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings')
              ),
            ],
            currentIndex: _tabIndex,
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),

          body: new IndexedStack(
            children: <Widget>[
              new ScriptsPage(),
              new QuizzesPage(),
              new SettingsPage()
            ],
            index: _tabIndex,
          )
      ),
    );
  }
}

void main() {
  runApp(new KanaQuizzes());
}
