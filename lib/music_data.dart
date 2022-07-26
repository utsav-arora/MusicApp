import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/models/playlist_model.dart';

class MusicData{
        List playlist=[];
        String name='';
        String artist='';
        String album='';
        String explicit='';
        String rating='';
        String lyrics='';
        String err='';

        Future getPlaylist()async{
          try{
            var response = await http.get(Uri.parse('https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=311ffc28b5adad9d1e718a63ef982e77'),);
            var jsonData=jsonDecode(response.body);
            // print(jsonData);

            jsonData['message']['body']['track_list'].forEach((element){
              playlist.add(PlaylistModel(
                  album: element['track']['album_name'],
                  id: element['track']['track_id'].toString(),
                  singer: element['track']['artist_name'],
                  trackName: element['track']['track_name'],
              ));

              // print(element['track']['artist_name']);
            });
            // print(jsonData['message']['body']['track_list'][0]['track']['track_name']);
          }

              catch(e){
            print(e.toString());
            err='No Internet';
              }
        }

        Future getDetails(String id)async{
          try{
             var response = await http.get(Uri.parse('https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=311ffc28b5adad9d1e718a63ef982e77'));
             var jsonData=jsonDecode(response.body);
             // print(jsonData);

             name=jsonData['message']['body']['track']['track_name'];
             // print(name);
             artist=jsonData['message']['body']['track']['artist_name'];
             album=jsonData['message']['body']['track']['album_name'];
             if(jsonData['message']['body']['track']['explicit'].toString() == '0'){
               explicit='False';
             }
             else{
               explicit='True';
             }
             rating=jsonData['message']['body']['track']['track_rating'].toString();
          }

              catch(e){
            print(e.toString());
            err='No Internet';

              }
              
        }
        
        Future getLyrics(String id)async{
          
          try{
            var response= await http.get(Uri.parse('https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=311ffc28b5adad9d1e718a63ef982e77'));
            var jsonData=jsonDecode(response.body);
            print(jsonData);
            lyrics=jsonData['message']['body']['lyrics']['lyrics_body'];
          }
              
              catch(e){
            print(e.toString());
            err='No Internet';
              }
        }
}