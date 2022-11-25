import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class FotosPage extends StatefulWidget {
  const FotosPage({super.key});

  @override
  State<FotosPage> createState() => _FotosPageState();
}

class _FotosPageState extends State<FotosPage> {
  List<CameraDescription> cameras = [];
  CameraController? controller;
  XFile? imagem;
  Size? size;

  void initiState() {
    super.initState();
    _loadCameras();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadCameras();
  }

  _loadCameras() async {
    try {
      cameras = await availableCameras();
      _startCameras();
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  _startCameras() {
    if (cameras.isEmpty) {
      print("Camera não encontrada");
    } else {
      _previewCameras(cameras.first);
    }
  }

  _previewCameras(CameraDescription camera) async {
    final CameraController cameraController = CameraController(
        camera, ResolutionPreset.high,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);
    controller = cameraController;

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e.description);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        backgroundColor: const Color.fromARGB(108, 239, 239, 241),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(108, 239, 239, 241),
        child: Center(
          child: _arquivoWidget(),
        ),
      ),
      floatingActionButton: (imagem != null)
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.pop(context),
              label: Text("Finalizar"),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _arquivoWidget() {
    return SizedBox(
      width: size!.width - 50,
      height: size!.height - (size!.height / 3),
      child: imagem == null
          ? _cameraPreviewWidget()
          : Image.file(File(imagem!.path), fit: BoxFit.contain),
    );
  }

  _cameraPreviewWidget() {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return print('camera nao disponivel-------mudar');
    } else {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CameraPreview(controller!),
          _botaoCapturaWidget(),
        ],
      );
    }
  }

  _botaoCapturaWidget() {
    return Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.black.withOpacity(0.5),
          child: IconButton(
            icon: const Icon(
              Icons.camera_enhance,
              color: Colors.white,
              size: 30,
            ),
            onPressed: tirarFoto,
          ),
        ));
  }

  tirarFoto() async {
    final CameraController? cameraController = controller;

    if (cameraController != null && cameraController.value.isInitialized) {
      try {
        XFile file = await cameraController.takePicture();
        if (mounted) setState(() => imagem = file);
      } on CameraException catch (e) {
        print(e.description);
      }
    }
  }
}
