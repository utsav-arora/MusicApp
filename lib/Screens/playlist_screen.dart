import 'package:flutter/material.dart';
import 'package:music_app/Screens/saved_screen.dart';
import 'package:music_app/music_data.dart';
import 'package:music_app/widgets/playlist_card.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {

  List allSongs=[];
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
    getSongs();
  }

  Future getSongs()async{
    try{
      MusicData musicData=MusicData();
      await musicData.getPlaylist();

      setState(() {
        allSongs=musicData.playlist;
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
        title: const Text('Trending'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SavedScreen())),
              icon:const Icon(Icons.bookmark_border_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          isLoading?
              const Center(child: CircularProgressIndicator(),) :
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(itemBuilder: (BuildContext context ,int index){
                    return PlayListCard(
                        trackName: allSongs[index].trackName,
                        singer: allSongs[index].singer,
                        albumName: allSongs[index].album,
                      id: allSongs[index].id,
                    );
                },
                  itemCount: allSongs.length,
                  shrinkWrap: true,
                  physics:const ClampingScrollPhysics(),
                ),
              ),
          Center(
            child: Text(err),
          )
        ],
      ),
    );
  }
}
