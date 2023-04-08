import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color:  const Color(0xfff2f3f5),
          child: Container(
            height: 212,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 10.0),
                  spreadRadius: -1,
                  blurRadius: 20
                )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                TouchIconWidget(icon: Icons.home, color: Colors.blue,),
                TouchIconWidget(icon: Icons.favorite, color: Colors.red,),
                TouchIconWidget(icon: Icons.camera_alt, color: Colors.amber,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TouchIconWidget extends StatefulWidget {
  final IconData icon;
  final Color color ;
  const TouchIconWidget({required this.icon ,Key? key, required this.color}) : super(key: key);

  @override
  State<TouchIconWidget> createState() => _TouchIconWidgetState();
}

class _TouchIconWidgetState extends State<TouchIconWidget> {
  bool touched = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value){

          touched = true;
          setState(() {

          });

      },
      onExit: (value){

          touched = false;
          setState(() {

          });

      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          color: touched ? widget.color : widget.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0)
          ),
          color: Colors.transparent,
          child: IconButton(
            splashColor: touched ? widget.color : widget.color.withOpacity(0.2),
              splashRadius: 25,
              onPressed: (){},
              icon: Icon(widget.icon,color: touched ? Colors.white :widget.color,)),
        ),
      ),
    );
  }
}

