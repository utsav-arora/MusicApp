import 'package:flutter/material.dart';
import 'package:music_app/Screens/playlist_screen.dart';
import 'package:music_app/music_data.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = ColorTween(begin: Colors.grey[400] , end: Colors.black).animate(controller);
    controller.forward();
    controller.addListener(() => setState(() {

    }) );
    MusicData().getPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children:  [
                   const SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(
                      image: NetworkImage('https://img.freepik.com/free-vector/play-vibrant-gradient-typography_53876-93868.jpg?w=996&t=st=1658773851~exp=1658774451~hmac=9348a45f56c98510ef412bf13addbeb2787443916cde128b111dca84c9fed84c',
                      ),
                      fit: BoxFit.fill,
                      height: 100,
                      width: 50,
                    ),
                  ),
                  const  SizedBox(
                    width: 5,
                  ),
                  DefaultTextStyle(
                    style:  const TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 7.0,
                          color: Color(0xFF6070D4),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText('Music App',
                          textStyle: const TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF6070D4)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ButtonWidget(buttonColor: Colors.blueAccent,
                buttonText: 'Hop Inside',
                onPress: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const PlaylistScreen(),),),
            ),
          ],
        ),
      ),
    );
  }
}
