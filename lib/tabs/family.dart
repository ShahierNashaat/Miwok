import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';

class Family extends StatelessWidget{

  List<String> mp3Uri;

  List<String> _sounds = [
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

  List<String> _images = [
    'images/family_father.png',
    'images/family_mother.png',
    'images/family_son.png',
    'images/family_daughter.png',
    'images/family_older_brother.png',
    'images/family_younger_brother.png',
    'images/family_older_sister.png',
    'images/family_younger_sister.png',
    'images/family_grandmother.png',
    'images/family_grandfather.png'
  ];

  List<String> _english_words = [
    'father',
    'mother',
    'son',
    'daughter',
    'older brother',
    'younger brother',
    'older sister',
    'younger sister',
    'grandmother',
    'grandfather'
  ];

  List<String> _miwok_words = [
    'әpә',
    'әṭa',
    'angsi',
    'tune',
    'taachi',
    'chalitti',
    'teṭe',
    'kolliti',
    'ama',
    'paapa'
  ];

  Family(this.mp3Uri);

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
                  color: Colors.green,
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