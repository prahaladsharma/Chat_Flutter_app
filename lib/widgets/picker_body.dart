import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/repo/image_repository.dart';

import '../model/image_model.dart';

class NetworkImagePickerBody extends StatelessWidget {

  final Function(String) onImageSelected;

  NetworkImagePickerBody({Key? key, required this.onImageSelected}) : super(key: key);

  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24)
        )
      ),
      child: FutureBuilder<List<PixelfordImage>>(
          future: _imageRepo.getImageNetwork(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PixelfordImage>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () { //Here we get image on tap and showing on chat input box.
                        onImageSelected(snapshot.data![index].urlSmallSize);
                      },
                      child: Image.network(snapshot.data![index]
                          .urlSmallSize)); //Image.network:- Creates a widget that displays an [ImageStream] obtained from the network.
                }, gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery
                      .of(context)
                      .size
                      .width * 0.5),
              );
            } else if(snapshot.hasError){
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('This is the error: ${snapshot.error}'),
              );
            }
              //return Image.network(snapshot.data![0].urlSmallSize);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
