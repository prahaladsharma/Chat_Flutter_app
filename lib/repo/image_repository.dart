
import 'dart:convert';
import 'dart:io';

import '../model/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository{

  // getImage network API
  Future<List<PixelfordImage>> getImageNetwork() async {
    try {
      var endPointUrl = Uri.parse('https://pixelford.com/api2/images');
      final response = await http.get(endPointUrl);
      //print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<PixelfordImage> _imageList = decodedList.map((listItem) {
          return PixelfordImage.fromJson(listItem);
        }).toList();
        //print(_imageList[0].urlFullSize);
        return _imageList;
      } else {
        throw Exception('API not successfull!!!');
      }
    } on SocketException{  //This exception will came when internet off during API call
      throw Exception('No Internet connection :(');
    } on HttpException {
      throw HttpException('Couldnt retrive the images! sorry!');
    } on FormatException { //This exception will came when application not able to parsing response.
      throw Exception('Bad request format!');
    } catch(e){
      print(e);
      throw Exception('Unknown Error');
    }
  }
}