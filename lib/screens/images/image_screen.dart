import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  String? imagePath;
  final Dio _dio = Dio();

  String fileName = 'data';

  Future<void> _pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    imagePath = pickedFile?.path;
    // print('hila');
    setState(() {});
  }

  /// Se le tiene que pasar como parametro el imagePath el content-type debe ser multipart/form-data
  ///  el image.path, podria ser el imagePath filename, imagePath
  /// TENER MUCHO CUIDADO, CUNADO SE MANDE un formdata: tiene que tener lo que pide la api
  /// en este caso solo pide la imgen, no se puede ingresar ningun otro campo mas
  Future<void> _uploadImage() async {
    _dio.options.contentType = 'multipart/form-data';
    // String fileName = image.path.split('/').last; // guarda el nombre de la imagen
    String urlApi = 'http://127.0.0.1:8000/upload_2/';
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imagePath!),
    });
    Response response = await _dio.post(
      urlApi,
      data: formData,
      options: Options(
        followRedirects: false,
        contentType: 'multipart/form-data',
        validateStatus: (status) {
          return status! < 400 || status == 405;
        },
      ),
    );
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subir y Guardar Imagen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imagePath == null
                ? Text('No se ha seleccionado una imagen.')
                : Image.file(
                    File(imagePath!),
                    width: 100,
                  ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Seleccionar Imagen'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Subir Imagen'),
            )
          ],
        ),
      ),
    );
  }
}
