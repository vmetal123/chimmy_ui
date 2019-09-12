import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'Stories',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Container(
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ProfileBlock(icon: Icon(Icons.add, size: 32.0, color: Colors.white)),
                  ProfileBlock(),
                  ProfileBlock(),
                  ProfileBlock(),
                  ProfileBlock(),
                  ProfileBlock(),
                  ProfileBlock(),
                  ProfileBlock(),
                  ProfileBlock(),
                  ProfileBlock(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          NavigationButton(
            isSelected: _index == 0,
            icon: Icon(Icons.category, color: Colors.grey),
            onPressed: () {
              setState(() {
                _index = 0;
              });
            },
            textButton: 'Home',
          ),
          NavigationButton(
            isSelected: _index == 1,
            icon: Icon(Icons.chat_bubble, color: Colors.grey),
            onPressed: () {
              setState(() {
                _index = 1;
              });
            },
            textButton: 'Chat',
          ),
          NavigationButton(
            isSelected: _index == 2,
            icon: Icon(Icons.multiline_chart, color: Colors.grey),
            onPressed: () {
              setState(() {
                _index = 2;
              });
            },
            textButton: 'Chart',
          ),
          NavigationButton(
            isSelected: _index == 3,
            icon: Icon(Icons.person, color: Colors.grey),
            onPressed: () {
              setState(() {
                _index = 3;
              });
            },
            textButton: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatefulWidget {
  final Icon icon;
  final Function onPressed;
  final String textButton;
  final bool isSelected;

  const NavigationButton({
    Key key,
    this.icon,
    this.onPressed,
    this.textButton,
    this.isSelected,
  }) : super(key: key);

  @override
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: widget.isSelected
              ? Colors.yellow.withOpacity(0.3)
              : Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            widget.icon,
            SizedBox(
              width: 10.0,
            ),
            Text(widget.isSelected ? widget.textButton : '',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}

class ProfileBlock extends StatelessWidget {
  final Icon icon;

  const ProfileBlock({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.blueGrey,
      ),
      child: icon == null ? Container() : icon,
    );
  }
}
