import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class Numbers extends StatelessWidget{

  List<String> mp3Uri;

  List<String> _sounds = [
    'audios/number_one.mp3',
    'audios/number_two.mp3',
    'audios/number_three.mp3',
    'audios/number_four.mp3',
    'audios/number_five.mp3',
    'audios/number_six.mp3',
    'audios/number_seven.mp3',
    'audios/number_eight.mp3',
    'audios/number_nine.mp3',
    'audios/number_ten.mp3'
  ];

  List<String> _images = [
    'images/number_one.png',
    'images/number_two.png',
    'images/number_three.png',
    'images/number_four.png',
    'images/number_five.png',
    'images/number_six.png',
    'images/number_seven.png',
    'images/number_eight.png',
    'images/number_nine.png',
    'images/number_ten.png'
  ];

  List<String> _english_words = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten'
  ];

  List<String> _miwok_words = [
    'lutti',
    'otiiko',
    'tolookosu',
    'oyyisa',
    'massokka',
    'temmokka',
    'kenekaku',
    'kawinta',
    'wo\'e',
    'na\'aacha'
  ];

  Numbers(this.mp3Uri);

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
                  color: Colors.orange,
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