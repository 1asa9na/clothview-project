// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names
import 'dart:convert'; // библиотека конвертирования информации
import 'dart:typed_data'; // библиотека с дополнительными типами данных
import 'package:file_picker/file_picker.dart'; // библиотека для загрузки пикч с устройства (работает только на windows app)
import 'dart:io'; // основная библиотека dart
import 'package:dotted_border/dotted_border.dart'; // библиотека пунктирного контура
import 'package:flutter/material.dart'; // библиотека material design
import 'package:carousel_slider/carousel_slider.dart'; // библиотека крутящихся пикч

class InfoCont extends StatelessWidget {
  // класс блока информации (пикча + большой текст + маленький текст)
  final String _text_main;
  final String _text_bottom;
  final IconData _icon;

  InfoCont(this._text_main, this._text_bottom, this._icon);

  @override
  Widget build(BuildContext context) => Flexible(
        flex: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, top: 20, left: 30, right: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Icon(
                      _icon,
                      size: 100,
                      color: Color.fromARGB(255, 225, 56, 56),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _text_main,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(_text_bottom),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      );
}

class MainPage extends StatefulWidget {
  // класс главной (первой страницы)
  @override
  _MPState createState() => _MPState();
}

class _MPState extends State<MainPage> {
  // класс состояния главной страницы
  final URImages = [
    // три пикчи, которые крутятся
    'assets/slide1.jpg',
    'assets/slide2.jpg',
    'assets/slide3.jpg',
  ];
  final team = [
    ["Каждый", 'assets/men.png'],
    ["Охотник", 'assets/men.png'],
    ["Желает", 'assets/men.png'],
    ["Знать", 'assets/men.png'],
    ["Где", 'assets/men.png'],
    ['Сидит', 'assets/men.png'],
    ['Фазан', 'assets/men.png']
  ];

  Widget buildImage(String context, int index) => Container(
        // отрисовка крутящихся пикч
        margin: EdgeInsets.symmetric(horizontal: 0),
        color: Color.fromARGB(255, 250, 250, 250),
        child: Image.asset(context, fit: BoxFit.cover),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        // отрисовка виджета состояния
        appBar: AppBar(
          // верхняя панель
          backgroundColor: Color.fromARGB(255, 225, 56, 56),
          title: Text("Textile View"),
          leading: IconButton(
            // кнопка слева
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.info_sharp))
          ], // панель кнопок справа
          bottom: TabBar(tabs: [
            // разделение экранов (PHOTO и HOME)
            Tab(
              text: "HOME",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "PHOTO",
              icon: Icon(Icons.camera),
            ),
            Tab(
              text: "ABOUT",
              icon: Icon(Icons.person),
            )
          ]),
        ),
        body: TabBarView(children: [
          Column(
            // экран HOME
            children: [
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 20,
                child: Row(
                  // горизонтальный ряд блоков информации (шаги)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    InfoCont(
                        'STEP 1',
                        "Take a photo of a sample of material you want to test.",
                        Icons.camera_alt),
                    Spacer(
                      flex: 1,
                    ),
                    InfoCont(
                        "STEP 2",
                        "Upload photo and choose what to do with it.",
                        Icons.cloud_download),
                    Spacer(
                      flex: 1,
                    ),
                    InfoCont(
                        "STEP 3",
                        "Wait analysis to be completed and download the results.",
                        Icons.done_all),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 20,
                child: CarouselSlider.builder(
                  // крутящиеся пикчи
                  itemCount: 3,
                  options: CarouselOptions(
                      height: 200, autoPlay: true, viewportFraction: 1),
                  itemBuilder: (context, index, realIndex) {
                    final URImage = URImages[index];
                    return buildImage(URImage, index);
                  },
                ),
              ),
            ],
          ),
          Column(
            // экран PHOTO
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                    "STEP 1.\nTake a photo of a sample of material you want to test."),
              ),
            ],
          ),
          // экран ABOUT
          Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 20,
                child: CarouselSlider.builder(
                  // крутящиеся пикчи
                  itemCount: 7,
                  options: CarouselOptions(
                      height: 1000,
                      autoPlay: true,
                      viewportFraction: 0.4,
                      autoPlayInterval: Duration(seconds: 1)),
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        Flexible(
                            flex: 10,
                            child: Image.asset(team[index][1],
                                fit: BoxFit.fitHeight)),
                        Spacer(),
                        Flexible(
                            flex: 4,
                            child: Text(
                              team[index][0],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ]),
        floatingActionButton: Align(
          // плавающая кнопка UPLOAD
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            splashColor: Color.fromARGB(255, 225, 56, 56),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FileUpload()));
            },
            label: Text("UPLOAD .PNG OR .JPG FILE"),
            icon: Icon(Icons.file_upload),
          ),
        ),
      );
}

class FileUpload extends StatelessWidget {
  // экран загрузки фото
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // верхняя панель по стандарту, но без разделения экранов
          backgroundColor: Color.fromARGB(255, 225, 56, 56),
          title: Text("Textile View"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.info_sharp))],
        ),
        body: Center(
          child: DottedBorder(
            padding: EdgeInsets.all(100),
            color: Color.fromARGB(255, 225, 56, 56),
            child: ImageCapture(), // блок загрузки фотографии
          ),
        ),
      );
}

class ImageCapture extends StatefulWidget {
  // класс блока загрузки фотографии
  @override
  State<StatefulWidget> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  // состояние класса загрузки фотографии
  Image image = Image.asset('assets/example.png'); // стандартная пикча
  String back = '';
  @override
  Widget build(BuildContext context) => Column(
        // отрисовка состояния
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 10,
            child: image,
          ),
          Spacer(
            flex: 1,
          ),
          TextButton(
            // кнопка загрузки фото, тут самое интересное
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform
                  .pickFiles(); // ожидание, пока пользователь выберет картинку
              if (result == null)
                return; // если не выбрал, то ничего не происходит
              PlatformFile file =
                  result.files.single; // иначе выбирается единственная картинка
              Uint8List bytes = await File(file.path.toString())
                  .readAsBytes(); // и переводится в массив байтов
              image = Image.memory(
                  bytes); // из этих байтов она снова собирается и отрисовывается
              final str = base64.encode(
                  bytes); // переменной str присваивается массив байтов, переведённая в 64-чную систему исчисления(строку)
              final req =
                  '{"texType": ["$str"]}'; // запрос по форме JSON, который отправится на сервер
              try {
                final socket = await Socket.connect(
                    // захэндлить
                    '176.62.66.77',
                    443);
                print(
                    'Connected to: ${socket.remoteAddress.address}:${socket.remotePort}'); // вывод сообщения о подключении
                socket.listen(
                  // соединяемся
                  (Uint8List data) {
                    final serverResponse = String.fromCharCodes(data)
                        .substring(2, String.fromCharCodes(data).length - 2);
                    back = serverResponse;
                    print('Server: $back');
                  },
                  onError: (error) {
                    //  print(error);
                    socket.destroy();
                  },
                  onDone: () {
                    print('Server left.');
                    socket.destroy();
                  },
                );
                await sendMessage(socket, req); // кидаем запрос на сервер
                setState(() {});
                Navigator.push(
                    context, // сразу же переключаемся на третий экран, показ результатов
                    MaterialPageRoute(
                        builder: (context) => ResultView(
                            view: Image.memory(bytes), result: back)));
              } // подключение к серверу
              on SocketException {
                // пускай юзер пососёт
              }
              ;
              setState(() {});
            },
            child: Text("UPLOAD FILE..."), // текст кнопки
          ),
        ],
      );
}

class ResultView extends StatelessWidget {
  Image pic = Image.asset('assets/example.png');
  String text = 'Error';
  ResultView({Image? view, String? result}) {
    pic = view ?? pic;
    text = result ?? text;
    print(text);
  }
  //  экран результатов
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // тут пусто
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 225, 56, 56),
          title: Text("Textile View")),
      body: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 10,
                child: DottedBorder(
                    padding: EdgeInsets.all(100),
                    color: Color.fromARGB(255, 225, 56, 56),
                    child: pic),
              ),
              Spacer(
                flex: 2,
              ),
              Flexible(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 10,
                      child: Text(
                        'Material:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                    ),
                    Spacer(flex: 1),
                    Flexible(
                      flex: 10,
                      child: Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color.fromARGB(255, 225, 56, 56)),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ]),
      ),
    );
  }
}

Future<void> sendMessage(Socket socket, String message) async {
  // функция отправки запроса на сервер
  //print(
  //    'Client: $message'); // в консоли отображается сообщение, которое я отправил
  socket.write(message);
  await Future.delayed(
      Duration(seconds: 4)); // жду две секунды, пока запросы отправляются
}
