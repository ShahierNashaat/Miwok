import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';

class Phrases extends StatelessWidget{

  List<String> mp3Uri;

  List<String> _sounds = [
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

  List<String> _english_words = [
    'Where are you going?',
    'What is your name?',
    'My name is...',
    'How are you feeling?',
    'I\'m feeling good.',
    'Are you coming?',
    'Yes, I\'m coming.',
    'I\'m coming.',
    'Let\'s go.',
    'Come here.'
  ];

  List<String> _miwok_words = [
    'minto wuksus',
    'tinnә oyaase\'nә',
    'oyaaset...',
    'michәksәs?',
    'kuchi achit',
    'әәnәs\'aa?',
    'hәә’ әәnәm',
    'әәnәm',
    'yoowutis',
    'әnni\'nem'
  ];

  Phrases (this.mp3Uri);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _english_words.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.blue,
                  height: 85.0,
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
      } ,
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.black,
          height: 1.0,
        );
      },
    );
  }
}