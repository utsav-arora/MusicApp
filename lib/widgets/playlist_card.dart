import 'package:flutter/material.dart';
// import 'package:music_app/Screens/saved_screen.dart';
// import 'package:music_app/models/saved_model.dart';
import 'package:provider/provider.dart';

import '../Screens/details_screen.dart';
import '../models/saved_data.dart';

class PlayListCard extends StatelessWidget {
  final String trackName;
  final String albumName;
  final String singer;
  final String id;


  const PlayListCard({Key? key,
  required this.trackName,
    required this.singer,
    required this.albumName,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.22,
      child: GestureDetector(
        onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen(id:id),),),
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 10.0),
          margin:const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5.0),),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
                width: 50,
                child: Image(
                  image: NetworkImage('https://www.freepnglogos.com/uploads/music-logo-black-and-white-png-21.png'),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.only( top: 10, left: 10),
                        child: Text(trackName,
                        style:const TextStyle(
                          color: Colors.black,
                          fontSize: 18
                        ),
                        )),
                    Container(
                        padding: const EdgeInsets.only( top: 10, left: 10),
                        child: Text('- $albumName'),),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding:const EdgeInsets.only(right: 10),
                      child: Text(singer,
                        style:const TextStyle(
                            color: Colors.black,
                            fontSize: 15
                        ),
                      ),
                  ),
                  IconButton(onPressed: (){
                    Provider.of<SavedData>(context, listen: false).saveTrack(trackName, id);
                  },
                      icon: const Icon(Icons.bookmark_border_outlined,
                      color: Colors.black,
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
