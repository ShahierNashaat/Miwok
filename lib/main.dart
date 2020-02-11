import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwok/tabs/numbers.dart';
import 'package:miwok/tabs/family.dart';
import 'package:miwok/tabs/colorss.dart';
import 'package:miwok/tabs/phrases.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';


void main(){
  runApp(MaterialApp(
    title: 'Miwok',
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget{

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin{

  TabController controller;

  List<String> Numbers_sounds = [
    'number_one.mp3',
    'number_two.mp3',
    'number_three.mp3',
    'number_four.mp3',
    'number_five.mp3',
    'number_six.mp3',
    'number_seven.mp3',
    'number_eight.mp3',
    'number_nine.mp3',
    'number_ten.mp3'
  ];
  List<String> Numbers_mp3Uri = [];

  List<String> Family_sounds = [
    'family_father.mp3',
    'family_mother.mp3',
    'family_son.mp3',
    'family_daughter.mp3',
    'family_older_brother.mp3',
    'family_younger_brother.mp3',
    'family_older_sister.mp3',
    'family_younger_sister.mp3',
    'family_grandmother.mp3',
    'family_grandfather.mp3'
  ];
  List<String> Family_mp3Uri = [];

  List<String> Colorss_sounds = [
    'color_red.mp3',
    'color_green.mp3',
    'color_brown.mp3',
    'color_gray.mp3',
    'color_black.mp3',
    'color_white.mp3',
    'color_dusty_yellow.mp3',
    'color_mustard_yellow.mp3'
  ];
  List<String> Colorss_mp3Uri = [];

  List<String> Phrases_sounds = [
    'phrase_where_are_you_going.mp3',
    'phrase_what_is_your_name.mp3',
    'phrase_my_name_is.mp3',
    'phrase_how_are_you_feeling.mp3',
    'phrase_im_feeling_good.mp3',
    'phrase_are_you_coming.mp3',
    'phrase_yes_im_coming.mp3',
    'phrase_im_coming.mp3',
    'phrase_lets_go.mp3',
    'phrase_come_here.mp3'
  ];
  List<String> Phrases_mp3Uri = [];

  void _loadSound() async{
    for(int i=0; i<Numbers_sounds.length; i++){
      final ByteData data = await rootBundle.load('audios/${Numbers_sounds[i]}');
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/${Numbers_sounds[i]}');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      Numbers_mp3Uri.add(tempFile.path.toString());
    }

    for(int i=0; i<Family_sounds.length; i++){
      final ByteData data = await rootBundle.load('audios/${Family_sounds[i]}');
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/${Family_sounds[i]}');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      Family_mp3Uri.add(tempFile.path.toString());
    }

    for(int i=0; i<Colorss_sounds.length; i++){
      final ByteData data = await rootBundle.load('audios/${Colorss_sounds[i]}');
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/${Colorss_sounds[i]}');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      Colorss_mp3Uri.add(tempFile.path.toString());
    }

    for(int i=0; i<Phrases_sounds.length; i++){
      final ByteData data = await rootBundle.load('audios/${Phrases_sounds[i]}');
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/${Phrases_sounds[i]}');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      Phrases_mp3Uri.add(tempFile.path.toString());
    }
  }

  @override
  void initState() {
    //print('TabBars length ${getTabBar().tabs.length.toString()}');
    controller = TabController(length: 4, vsync: this);
    _loadSound();
  }


  TabBar getTabBar(){
    return TabBar(
      tabs: <Tab>[
        Tab(
          child: Text(
            'NUMBERS',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        Tab(
          child: Text(
            'FAMILY',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        Tab(
          child: Text(
            'COLORS',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        Tab(
          child: Text(
            'PHRASES',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      ],
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs){
    print('Tabs length ${tabs.length}');
    return TabBarView(
      children: tabs,
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Miwok'),
        backgroundColor: Colors.brown,
        bottom: getTabBar()
      ),
      body: getTabBarView(<Widget>[Numbers(Numbers_mp3Uri),Family(Family_mp3Uri),Colorss(Colorss_mp3Uri),Phrases(Phrases_mp3Uri)]),
    );
  }
}