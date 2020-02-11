import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';

class Colorss extends StatelessWidget{

  List<String> mp3Uri;

  List<String> _sounds = [
    'color_red.mp3',
    'color_green.mp3',
    'color_brown.mp3',
    'color_gray.mp3',
    'color_black.mp3',
    'color_white.mp3',
    'color_dusty_yellow.mp3',
    'color_mustard_yellow.mp3'
  ];

  List<String> _images = [
    'images/color_red.png',
    'images/color_green.png',
    'images/color_brown.png',
    'images/color_gray.png',
    'images/color_black.png',
    'images/color_white.png',
    'images/color_dusty_yellow.png',
    'images/color_mustard_yellow.png'
  ];

  List<String> _english_words = [
    'red',
    'green',
    'brown',
    'gray',
    'black',
    'white',
    'dusty yellow',
    'mustard yellow'
  ];

  List<String> _miwok_words = [
    'weṭeṭṭi',
    'chokokki',
    'ṭakaakki',
    'ṭopoppi',
    'kululli',
    'kelelli',
    'ṭopiisә',
    'chiwiiṭә'
  ];

  Colorss (this.mp3Uri);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _images.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.black12,
                child: Image.asset(
                  _images[index],
                  height: 85.0,
                ),
              ),
              Expanded(
                child: Container(
                  height: 85.0,
                  color: Colors.purple,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    _miwok_words[index],
                                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    _english_words[index],
                                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          'images/play_arrow.png',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: (){
            AudioPlayer player = AudioPlayer();
            player.play(mp3Uri[index]);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.black,
          height: 1.0,
        );
      },
    );
  }
}