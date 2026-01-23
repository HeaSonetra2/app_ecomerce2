class HomeRemoteDatasource {
  Future<List<Map<String, dynamic>>> getBanner() async {
    await Future.delayed(Duration(seconds: 2));
    //mock data
    return [
      {'id': '1', 'imageUrl': 'https://www.goselfdrive.co.in/images/car3.j'},
      {
        'id': '2',
        'imageUrl':
            'https://tse4.mm.bing.net/th/id/OIP.mfuZkgTcoskU7ZAVfxNNqQHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
    ];
  }

  Future<List<Map<String, dynamic>>> getFeed() async {
    await Future.delayed(Duration(seconds: 2));

    //dio.get('api/v1/product/feed')
    //mock data
    return [
      {
        'id': '1',
        'name': 'Orange',
        'qty': 7,
        'type': 'pcs',
        'price': 5.5,
        'desc': 'Hello',
        'isFav': false,
        'nutrition': 5.5,
        'review': 4,
        'imageUrl':
            'https://www.dole.com/sites/default/files/styles/512w384h-80/public/media/orange-wissen.jpg?itok=i9A3Dx0Q-22EZBL72',
      },
      {
        'id': '2',
        'name': 'Apple',
        'qty': 7,
        'type': 'pcs',
        'price': 5.5,
        'desc': 'Hello',

        'isFav': false,
        'nutrition': 5.5,
        'review': 4,
        'imageUrl':
            'https://img.freepik.com/free-psd/close-up-delicious-apple_23-2151868338.jpg',
      },
      {
        'id': '3',
        'name': 'Apple',
        'qty': 7,
        'type': 'pcs',
        'price': 5.5,
        'desc': 'Hello',

        'isFav': false,
        'nutrition': 5.5,
        'review': 4,
        'imageUrl':
            'https://img.freepik.com/free-psd/close-up-delicious-apple_23-2151868338.jpg',
      },
    ];
  }

  Future<List<Map<String, dynamic>>> getBestSeller() async {
    await Future.delayed(Duration(seconds: 2));

    //dio.get('api/v1/product/bestseller')
    //mock data
    return [
      {
        'id': '1',
        'name': 'Banana',
        'qty': 7,
        'type': 'pcs',
        'price': 5.5,
        'desc': 'Hello',

        'isFav': false,
        'nutrition': 5.5,
        'review': 4,
        'imageUrl':
            'https://i5.walmartimages.com/asr/a134f2a1-2bb0-4e5c-a594-f84b63ab5928.22241f295458186b2ba0e4ed7d460d52.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
      },
      {
        'id': '2',
        'name': 'Apple',
        'qty': 7,
        'type': 'pcs',
        'price': 5.5,
        'desc': 'Hello',
        'isFav': false,
        'nutrition': 5.5,
        'review': 4.0,
        'imageUrl':
            'https://img.freepik.com/free-psd/close-up-delicious-apple_23-2151868338.jpg',
      },
    ];
  }
  Future<Map<String, dynamic>> getFeedDetail(String Id) async {
    await Future.delayed(Duration(seconds: 2));

    //dio.get('api/v1/product/feed/{id}')
    //mock data
    return {
      'id': Id,
      'name': 'Banana',
      'qty': 7,
      'type': 'pcs',
      'price': 5.5,
      'desc': 'Hello',
      'isFav': false,
      'nutrition': 5.5,
      'review': 4.0,
      'imageUrl':
          'https://i5.walmartimages.com/asr/a134f2a1-2bb0-4e5c-a594-f84b63ab5928.22241f295458186b2ba0e4ed7d460d52.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
    };
  }
}
