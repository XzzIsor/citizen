import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class InitialProblemDataForm extends StatelessWidget {
  InitialProblemDataForm({Key? key}) : super(key: key);

  final StorageController _storageController = StorageController();
  final ProblemController _problemController = ProblemController();
  final MapController _mapController = MapController();
  final UserController _userController = UserController();
  final ProblemModel _problemModel = ProblemModel(
      descripcion: '',
      direccion: '',
      estado: '0',
      fijado: false,
      multimedia: [],
      titulo: '',
      ubicacion: GeoPoint(0, 0),
      escritor: '');

  final List<XFile> _images = [];

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size;
    final SizedBox _spacer = SizedBox(height: _size.height * 0.02);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _initialData(_size, _spacer),
        _aditionalData(
            _size,
            SizedBox(
              height: _size.height * 0.08,
            ),
            context)
      ],
    );
  }

  Widget _initialData(Size _size, SizedBox _spacer) {
    return Container(
      padding: EdgeInsets.all(_size.height * 0.02),
      height: _size.height * 0.75,
      width: _size.width * 0.44,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                spreadRadius: 5,
                offset: Offset(7, 10))
          ]),
      child: Form(
        child: Column(
          children: [
            _titleField(_size),
            _spacer,
            _imageField(_size),
            _spacer,
            _descriptionField(_size)
          ],
        ),
      ),
    );
  }

  Widget _titleField(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.06,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 164, 98, 226),
          borderRadius: BorderRadius.circular(20)),
      child: CustomTextField(
          label: 'Título',
          icon: Icons.title_rounded,
          hintText: "Descriptivo",
          onChange: (value) {
            _problemModel.titulo = value;
          },
          emailType: false,
          obscureText: false),
    );
  }

  Widget _imageField(Size size) {
    return GestureDetector(
      onTap: () async {
        XFile _imageFromPC = await _storageController.getImageFromDevice();
        _images.add(_imageFromPC);
      },
      child: Container(
          height: size.height * 0.2,
          width: size.width * 0.4,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 88, 114, 148),
              borderRadius: BorderRadius.circular(20)),
          child: const Center(
              child: Text('Agregar Imagen',
                  style: TextStyle(color: Colors.white)))),
    );
  }

  Widget _descriptionField(Size size) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: size.height * 0.41,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 104, 121, 145),
            borderRadius: BorderRadius.circular(20)),
        child: CustomTextField(
            label: 'Descripción',
            icon: Icons.description,
            hintText: 'Descripción detallada',
            onChange: (value) {
              _problemModel.descripcion = value;
            },
            emailType: false,
            obscureText: false,
            maxLines: 15));
  }

  Widget _aditionalData(Size _size, SizedBox _spacer, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_size.height * 0.02),
      height: _size.height * 0.75,
      width: _size.width * 0.25,
      decoration: BoxDecoration(
          color: const Color.fromARGB(223, 24, 3, 23),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                spreadRadius: 5,
                offset: Offset(7, 10))
          ]),
      child: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            _addressField(_size),
            _spacer,
            _writerField(_size),
            SizedBox(height: _size.height * 0.01),
            const MapRegisterProblem(),
            _submitButton(_size, context)
          ],
        ),
      ),
    );
  }

  Widget _writerField(Size size) {
    final name = _userController.authUser.email.split("@");

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.06,
      width: size.width * 0.2,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 164, 98, 226),
          borderRadius: BorderRadius.circular(20)),
      child: CustomTextField(
          initialValue: name[0],
          label: 'Escritor: ',
          icon: Icons.person,
          hintText: "Alias o Nombre",
          onChange: (value) {
            _problemModel.escritor = value;
          },
          emailType: false,
          obscureText: false),
    );
  }

  Widget _addressField(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.06,
      width: size.width * 0.2,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 164, 98, 226),
          borderRadius: BorderRadius.circular(20)),
      child: CustomTextField(
          label: 'Dirección',
          icon: Icons.business_rounded,
          hintText: "Cra. 71 - #65-22",
          onChange: (value) {
            _problemModel.direccion = value;
          },
          emailType: false,
          obscureText: false),
    );
  }

  Widget _submitButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.1,
      child: ElevatedButton(
        onPressed: () async {
          if (_images.isNotEmpty) {
            LatLng point = _mapController.point;
            //List<String> urls = await _storageController.addImagesToStorage(_images);
            _problemModel.ubicacion = GeoPoint(point.latitude, point.longitude);
            _problemModel.multimedia = ["problems/stock.jpg"];
            await _problemController.addProblem(_problemModel);
          }
          Navigator.pushNamed(context, '/');
        },
        child: const Text(
          'Subir',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            primary: const Color.fromARGB(255, 105, 19, 204),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            elevation: 12),
      ),
    );
  }
}
