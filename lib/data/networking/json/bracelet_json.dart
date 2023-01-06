class BracletBleutoothJson {
  Sensors? sensors;
  Data? data;

  BracletBleutoothJson({this.sensors, this.data});

  BracletBleutoothJson.fromJson(Map<String, dynamic> json) {
    sensors =
    json['sensors'] != null ? new Sensors.fromJson(json['sensors']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sensors != null) {
      data['sensors'] = this.sensors!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Sensors {
  int? eDA;
  int? eCG;
  int? pPG;
  int? tEMP;
  int? mOTION;

  Sensors({this.eDA, this.eCG, this.pPG, this.tEMP, this.mOTION});

  Sensors.fromJson(Map<String, dynamic> json) {
    eDA = json['EDA'];
    eCG = json['ECG'];
    pPG = json['PPG'];
    tEMP = json['TEMP'];
    mOTION = json['MOTION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EDA'] = this.eDA;
    data['ECG'] = this.eCG;
    data['PPG'] = this.pPG;
    data['TEMP'] = this.tEMP;
    data['MOTION'] = this.mOTION;
    return data;
  }
}

class Data {
  List<String>? date;
  List<String>? time;
  List<EDA>? eDA;
  List<String>? tEMP;
  List<ECG>? eCG;
  List<Motion>? motion;
  List<String>? pPG;

  Data(
      {this.date,
        this.time,
        this.eDA,
        this.tEMP,
        this.eCG,
        this.motion,
        this.pPG});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'].cast<String>();
    time = json['time'].cast<String>();
    if (json['EDA'] != null) {
      eDA = <EDA>[];
      json['EDA'].forEach((v) {
        eDA!.add(new EDA.fromJson(v));
      });
    }
    tEMP = json['TEMP'].cast<String>();
    if (json['ECG'] != null) {
      eCG = <ECG>[];
      json['ECG'].forEach((v) {
        eCG!.add(new ECG.fromJson(v));
      });
    }
    if (json['Motion'] != null) {
      motion = <Motion>[];
      json['Motion'].forEach((v) {
        motion!.add(new Motion.fromJson(v));
      });
    }
    pPG = json['PPG'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    if (this.eDA != null) {
      data['EDA'] = this.eDA!.map((v) => v.toJson()).toList();
    }
    data['TEMP'] = this.tEMP;
    if (this.eCG != null) {
      data['ECG'] = this.eCG!.map((v) => v.toJson()).toList();
    }
    if (this.motion != null) {
      data['Motion'] = this.motion!.map((v) => v.toJson()).toList();
    }
    data['PPG'] = this.pPG;
    return data;
  }
}

class EDA {
  String? phase;
  String? eDA;

  EDA({this.phase, this.eDA});

  EDA.fromJson(Map<String, dynamic> json) {
    phase = json['phase'];
    eDA = json['EDA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phase'] = this.phase;
    data['EDA'] = this.eDA;
    return data;
  }
}

class ECG {
  String? p;
  String? pRI;
  String? pRS;
  String? q;
  String? r;
  String? qRS;
  String? s;
  String? sTS;
  String? t;
  String? qT;
  String? rR;

  ECG(
      {this.p,
        this.pRI,
        this.pRS,
        this.q,
        this.r,
        this.qRS,
        this.s,
        this.sTS,
        this.t,
        this.qT,
        this.rR});

  ECG.fromJson(Map<String, dynamic> json) {
    p = json['P'];
    pRI = json['PRI'];
    pRS = json['PRS'];
    q = json['Q'];
    r = json['R'];
    qRS = json['QRS'];
    s = json['S'];
    sTS = json['STS'];
    t = json['T'];
    qT = json['QT'];
    rR = json['RR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['P'] = this.p;
    data['PRI'] = this.pRI;
    data['PRS'] = this.pRS;
    data['Q'] = this.q;
    data['R'] = this.r;
    data['QRS'] = this.qRS;
    data['S'] = this.s;
    data['STS'] = this.sTS;
    data['T'] = this.t;
    data['QT'] = this.qT;
    data['RR'] = this.rR;
    return data;
  }
}

class Motion {
  String? ax;
  String? gx;
  String? ay;
  String? gy;
  String? az;
  String? gz;

  Motion({this.ax, this.gx, this.ay, this.gy, this.az, this.gz});

  Motion.fromJson(Map<String, dynamic> json) {
    ax = json['Ax'];
    gx = json['Gx'];
    ay = json['Ay'];
    gy = json['Gy'];
    az = json['Az'];
    gz = json['Gz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ax'] = this.ax;
    data['Gx'] = this.gx;
    data['Ay'] = this.ay;
    data['Gy'] = this.gy;
    data['Az'] = this.az;
    data['Gz'] = this.gz;
    return data;
  }
}
