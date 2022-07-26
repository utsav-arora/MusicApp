import 'package:flutter/material.dart';
import 'package:music_app/music_data.dart';

class DetailsScreen extends StatefulWidget {
   String id;
   DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  String name='';
  String artist='';
  String album='';
  String explicit='';
  String rating='';
  String lyrics='';
  bool isLoading=true;
  String err='';

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
    getLyrics();
  }

  Future getDetails()async{
    try{
      MusicData musicData=MusicData();
      await musicData.getDetails(widget.id);

      setState(() {
        name=musicData.name;
        album=musicData.album;
        rating=musicData.rating;
        explicit=musicData.explicit;
        artist=musicData.artist;
        // allSongs=musicData.playlist;
        // isLoading=false;
      });
    }

    catch(e){
      print(e.toString());
    }

  }

  Future getLyrics()async{
    try{
      MusicData musicData=MusicData();
      await musicData.getLyrics(widget.id);
      setState(() {
          lyrics= musicData.lyrics;
          isLoading=false;
          err=musicData.err;
      });
    }
        catch(e){
      print(e.toString());
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Track Details'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          isLoading?
          const Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20.0, left: 10),
              margin: const EdgeInsets.only(left: 15.0, top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                      const  Text('Name',
                       style: TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                       ),
                       ),
                  Text(name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                 const SizedBox(
                   height: 30.0,
                 ),
                  const Text('Artist',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(artist,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text('Album',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(album,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text('Explicit',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(explicit,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text('Rating',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(rating,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text('Lyrics',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(right: 20.0),
                    child: Text(lyrics,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
          Center(child: Text(err),)
        ],
      ),
    );
  }
}
