import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'UIkit/error.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridPage(),

    );
  }
}

class ImageSlider extends StatefulWidget {
  final int startIndex;

  ImageSlider({required this.startIndex});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imageUrls = [
    'https://avatars.mds.yandex.net/i?id=6453e582c0f18422f94db6683326f1a5a2bda56f-10641683-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=ceefbf5012a3a4af61ec23c4e2862cc3-5278475-images-thumbs&ref=rim&n=33&w=218&h=250',
    'https://avatars.mds.yandex.net/i?id=383ac2c8886e71c57fbd0fa354141a085b5fc9124e4dfbf2-13104117-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=f04ba8940c43e0bff89932dbd5c64b1568a4115c44a362c0-12517331-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=de31ae917a015e2afc5949e3ffecb958f130fa7b-11353407-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=20fef1f64d06cda94fcabb1c414e480ffe1a2719-10843661-images-thumbs&ref=rim&n=33&w=250&h=250',
    'https://avatars.mds.yandex.net/i?id=10c415a2401e9c97416da3980fe83f7511e0d66c3a3386b8-12935956-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=c6bf7ba3db4b3a2f10635c6c7fa82d3ff37e4edc-3695895-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=3d451bf0ed4eaefb064d207c41654d15438be4be-4034313-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=7741008c94b290ad8500dfea16a9b47d881d8cc7-10107139-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=7b16c954e2334e562888020d8898c754f0f11aa9-12555434-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=67ca6bb8a21cacfb47831f30d5f928d00572d69f-8819226-images-thumbs&n=13',
  ];

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.startIndex;
    _pageController = PageController(
      initialPage: widget.startIndex,
      viewportFraction: 0.8,
    );
  }
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MM yyyy').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            formattedDate, // Отображение текущей даты в центре AppBar
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        actions: <Widget>[
          Text(
            '${_currentPage + 1} / ${imageUrls.length}', // Номер изображения
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 34,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridPage()),
            );// Действие при нажатии на кнопку
          },
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              double containerHeight = _currentPage == index ? 600 : 312;
              double containerWidth = _currentPage == index ? 312 : 390.81;

              return Center(
                child: Container(
                  width: containerWidth, // Ширина контейнера
                  height: containerHeight, // Высота контейнера
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Радиус закругления
                    child: Image.network(
                      imageUrls[index],
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GridPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://avatars.mds.yandex.net/i?id=6453e582c0f18422f94db6683326f1a5a2bda56f-10641683-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=ceefbf5012a3a4af61ec23c4e2862cc3-5278475-images-thumbs&ref=rim&n=33&w=218&h=250',
    'https://avatars.mds.yandex.net/i?id=383ac2c8886e71c57fbd0fa354141a085b5fc9124e4dfbf2-13104117-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=f04ba8940c43e0bff89932dbd5c64b1568a4115c44a362c0-12517331-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=de31ae917a015e2afc5949e3ffecb958f130fa7b-11353407-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=20fef1f64d06cda94fcabb1c414e480ffe1a2719-10843661-images-thumbs&ref=rim&n=33&w=250&h=250',
    'https://avatars.mds.yandex.net/i?id=10c415a2401e9c97416da3980fe83f7511e0d66c3a3386b8-12935956-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=c6bf7ba3db4b3a2f10635c6c7fa82d3ff37e4edc-3695895-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=3d451bf0ed4eaefb064d207c41654d15438be4be-4034313-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=7741008c94b290ad8500dfea16a9b47d881d8cc7-10107139-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=7b16c954e2334e562888020d8898c754f0f11aa9-12555434-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=67ca6bb8a21cacfb47831f30d5f928d00572d69f-8819226-images-thumbs&n=13',
  ];



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.more_vert,
                size: 34,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ErrorPage()),
                              );
                              // Действие при нажатии
                            },
                            child: Text('Кнопка 1'),
                          ),
                          SizedBox(height: 40), // Отступ между кнопками
                          ElevatedButton(
                            onPressed: () {
                              // Действие при нажатии
                            },
                            child: Text('Кнопка 2'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                // Действие при нажатии на кнопку
              },
            ),
          ],
          title: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 40.0),
              width: 148.0,
              height: 34.0,
            child: Image.network(
              'https://www.figma.com/file/SAEYsF78cWzR23vghjyP7y/image/5be6bfe128e859bebe0645d29c89f575f9e4d10a',
              fit: BoxFit.cover,
            ),
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Действие при нажатии на изображение
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageSlider(startIndex: index),
                  ),
                );
              },
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        )
    );
  }
}