import 'package:flutter/material.dart';
import 'package:music_app/Screens/details_screen.dart';

class SavedCard extends StatefulWidget {
  final String name;
  final String id;
   const SavedCard({Key? key, required this.name , required this.id}) : super(key: key);

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.1,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailsScreen(id: widget.id),
          ),);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[500],
            border: Border.all(color: Colors.white),
            borderRadius:const BorderRadius.all(Radius.circular(8.0))
          ),
          alignment: Alignment.center,
          child: Text(widget.name,
          style:const  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
          ),
        ),
      ),
    );
  }
}
