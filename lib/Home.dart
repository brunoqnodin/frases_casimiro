import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  int _fraseAleatoria = 0;
  List _frases = [
    '"Aceitas Pix?" Miguel, Casimiro',
    '"Isso daqui esquece, ta falando da ELITE!" Miguel, Casimiro',
    '"Gigante, isso daqui é gigante" Miguel, Casimiro',
    '"Tipo assim, não tem erro isso daqui, foda!" Miguel, Casimiro',
    '"Sabe o que é isso, são tuas pessimas amizades" Miguel, Casimiro',
    '"E eu comia pra caralho isso dai. Comia de manhã, de tarde, de noite. Comia dormindo, acordado. Puta merda!" Miguel, Casimiro',
    '"Meteu essa?" Miguel, Casimiro'
  ];

  void _aleatorio(){
    setState(() {
      _fraseAleatoria = Random().nextInt(7);
    });
  }

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState(){

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 4.0, end: 12.0).animate(_animationController)..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Frases do Casimiro"),
            Image.asset('assets/logo_caze.png', height: 60,),
          ],
        ),
        centerTitle: true,
        elevation: 10,
        //backgroundColor: Colors.green,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.amber, Colors.green]
            )
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 300,
                width: 300,
                child: Image.asset('assets/logo_caze.png', height: 300,),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  boxShadow: [BoxShadow(
                    color: Colors.green,
                    spreadRadius: _animation.value,
                    blurRadius: _animation.value
                  )],
                ),
              ),
              Text(_frases[_fraseAleatoria], textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black87),),
              ElevatedButton(
                onPressed: _aleatorio,
                child: Text("Clica Nerdola!", style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
