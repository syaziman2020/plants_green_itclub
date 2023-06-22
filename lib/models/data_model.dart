class Data {
  Kendali? kendali;
  List<Log>? log;
  Sensor? sensor;

  Data({this.kendali, this.log, this.sensor});

  Data.fromJson(Map<dynamic, dynamic> json) {
    kendali =
        json['kendali'] != null ? new Kendali.fromJson(json['kendali']) : null;
    if (json['log'] != null) {
      log = <Log>[];
      json['log'].forEach((v) {
        log!.add(new Log.fromJson(v));
      });
    }
    sensor =
        json['sensor'] != null ? new Sensor.fromJson(json['sensor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kendali != null) {
      data['kendali'] = this.kendali!.toJson();
    }
    if (this.log != null) {
      data['log'] = this.log!.map((v) => v.toJson()).toList();
    }
    if (this.sensor != null) {
      data['sensor'] = this.sensor!.toJson();
    }
    return data;
  }
}

class Kendali {
  bool? air;
  bool? kapur;
  bool? kipas;

  Kendali({this.air, this.kapur, this.kipas});

  Kendali.fromJson(Map<dynamic, dynamic> json) {
    air = json['air'];
    kapur = json['kapur'];
    kipas = json['kipas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air'] = this.air;
    data['kapur'] = this.kapur;
    data['kipas'] = this.kipas;
    return data;
  }
}

class Log {
  num? kelembapanTanah;
  num? kelembapanUdara;
  num? ph;
  String? waktu;

  Log({this.kelembapanTanah, this.kelembapanUdara, this.ph, this.waktu});

  Log.fromJson(Map<dynamic, dynamic> json) {
    kelembapanTanah = json['kelembapan_tanah'];
    kelembapanUdara = json['kelembapan_udara'];
    ph = json['ph'];
    waktu = json['waktu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kelembapan_tanah'] = this.kelembapanTanah;
    data['kelembapan_udara'] = this.kelembapanUdara;
    data['ph'] = this.ph;
    data['waktu'] = this.waktu;
    return data;
  }
}

class Sensor {
  num? kelembapanTanah;
  num? kelembapanUdara;
  num? ph;

  Sensor({this.kelembapanTanah, this.kelembapanUdara, this.ph});

  Sensor.fromJson(Map<dynamic, dynamic> json) {
    kelembapanTanah = json['kelembapan_tanah'];
    kelembapanUdara = json['kelembapan_udara'];
    ph = json['ph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kelembapan_tanah'] = this.kelembapanTanah;
    data['kelembapan_udara'] = this.kelembapanUdara;
    data['ph'] = this.ph;
    return data;
  }
}
