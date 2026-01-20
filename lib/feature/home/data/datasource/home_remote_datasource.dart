class HomeRemoteDatasource {
  Future<List<Map<String, dynamic>>> getBanner() async {
    await Future.delayed(Duration(seconds: 2));
    //mock data
    return [
      {'id': '1', 'imageUrl': 'https://www.goselfdrive.co.in/images/car3.jpg'},
      {
        'id': '2',
        'imageUrl':
            'https://tse4.mm.bing.net/th/id/OIP.mfuZkgTcoskU7ZAVfxNNqQHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
    ];
  }
  Future<List<Map<String, dynamic>>> getFeed() async {
    await Future.delayed(Duration(seconds: 2));
    //mock data
    return [
      {
        'id':'1',
        'name':'Banana',
        'qty':7,
        'type':'pcs',
        'price':5.5,
        'imageUrl':'https://upload.wikimedia.org/wikipedia/commons/9/9b/Cavendish_Banana_DS.jpg',
      },
      {
        'id':'2',
        'name':'Apple',
        'qty':7,
        'type':'pcs',
        'price':5.5,
        'imageUrl':'https://img.freepik.com/free-psd/close-up-delicious-apple_23-2151868338.jpg',
      },
      {
        'id':'3',
        'name':'Apple',
        'qty':7,
        'type':'pcs',
        'price':5.5,
        'imageUrl':'https://img.freepik.com/free-psd/close-up-delicious-apple_23-2151868338.jpg',
      },
    ];
  }
}
  