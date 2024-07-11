class Horoscope {
  final String _horoscopeName;
  final String _horoscopeDate;
  final String _horoscopeDetail;
  final String _horoscopeIcon;
  final String _horoscopeImage;

  get horoscopeName => this._horoscopeName;

  get horoscopeDate => this._horoscopeDate;

  get horoscopeDetail => this._horoscopeDetail;

  get horoscopeIcon => this._horoscopeIcon;

  get horoscopeImage => this._horoscopeImage;

  Horoscope(this._horoscopeName, this._horoscopeDate, this._horoscopeDetail,
      this._horoscopeIcon, this._horoscopeImage);

  @override
  String toString() {
    return '$_horoscopeName - $_horoscopeDate - $_horoscopeDetail - $_horoscopeIcon - $_horoscopeImage';
  }
}
