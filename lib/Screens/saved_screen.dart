import 'package:flutter/material.dart';
import 'package:music_app/widgets/saved_card.dart';
import 'package:provider/provider.dart';

import '../models/saved_data.dart';

class SavedScreen extends StatefulWidget {

   const SavedScreen({Key? key,}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Tracks'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding:const EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: Provider.of<SavedData>(context, listen: false).saved.length,
            shrinkWrap: true,
            physics:const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index){
              return SavedCard(
                name:Provider.of<SavedData>(context , listen: false).saved[index].name,
                id:Provider.of<SavedData>(context, listen: false).saved[index].id,
              );
            }
        ),
      ),
    );
  }
}
