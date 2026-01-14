class HomeRemoteDatasource {
  Future<List<Map<String, dynamic>>> getBanner() async {
    await Future.delayed(Duration(seconds: 2));
    //mock data
    return [
      {
        'id': 1,
        'imageUrl':
            'https://tse4.mm.bing.net/th/id/OIP.OfxO3gohceTDs-7mfXHVFwHaEQ?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
    ];
  }
}
