class Api {
  String call (String endpoint){
    late final String _keyApi = '12d88dff511df1bb152186e7132837ac';
    late final String _baseUrlApi = 'https://api.themoviedb.org/3';

    return '$_baseUrlApi/$endpoint?api_key=$_keyApi&language=pt-BR&page=1';
  }
}