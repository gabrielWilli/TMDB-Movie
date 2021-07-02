class FormatDate {
  String formatDate({required String date}) {
    var _dateSplit = date.split('-');
    String? _dateFormatted;

    switch (_dateSplit[1].toString()) {
      case '01':
        return _dateFormatted = '${_dateSplit[2]} de Jan de ${_dateSplit[0]}';
      case '02':
        return _dateFormatted = '${_dateSplit[2]} de Fev de ${_dateSplit[0]}';
      case '03':
        return _dateFormatted = '${_dateSplit[2]} de mar de ${_dateSplit[0]}';
      case '04':
        return _dateFormatted = '${_dateSplit[2]} de Abr de ${_dateSplit[0]}';
      case '05':
        return _dateFormatted = '${_dateSplit[2]} de Mai de ${_dateSplit[0]}';
      case '06':
        return _dateFormatted = '${_dateSplit[2]} de Jun de ${_dateSplit[0]}';
      case '07':
        return _dateFormatted = '${_dateSplit[2]} de Jul de ${_dateSplit[0]}';
      case '08':
        return _dateFormatted = '${_dateSplit[2]} de Ago de ${_dateSplit[0]}';
      case '09':
        return _dateFormatted = '${_dateSplit[2]} de Set de ${_dateSplit[0]}';
      case '10':
        return _dateFormatted = '${_dateSplit[2]} de Out de ${_dateSplit[0]}';
      case '11':
        return _dateFormatted = '${_dateSplit[2]} de Nov de ${_dateSplit[0]}';
      case '12':
        return _dateFormatted = '${_dateSplit[2]} de Dez de ${_dateSplit[0]}';
    }
    return _dateFormatted.toString();
  }
}
