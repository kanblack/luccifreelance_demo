/// maNhanVien : "1"
/// ho : "Nguyen"
/// tenLot : "Văn"
/// ten : "Tien"
/// tenDangNhap : "tiennv"
/// sdt : "0987888988"
/// email : "abc@xys.cd"
/// gioiTinh : "Nam"
/// ngaySinh : "02/09/1945"
/// diaChi : "10/23/43 Mỹ Dình, Hà Nội"
/// thongTinXacThuc : {"maSoGiayTo":"00978092394","ngayCap":"09/23/2012","noiCap":"Hà Nội"}
/// trangThai : "ACTIVE"
/// 2AuthFactor : true
/// note : ""
/// thongTinCongViec : [{"id":"1","boPhan":"Phòng kế toán","quyenHan":"Quản lý"},{"id":"2","boPhan":"Phòng CSKH","quyenHan":"Nhân viên"}]
/// dsDuAn : [{"id":"1","tenDuAn":"Dự án 1","role":"Kế toán trưởng"},{"id":"2","tenDuAn":"Dự án 2","role":"Kế toán phó"}]

class StaffInfoResponsive {
  StaffInfoResponsive({
    String? maNhanVien,
    String? ho,
    String? tenLot,
    String? ten,
    String? tenDangNhap,
    String? sdt,
    String? email,
    String? gioiTinh,
    String? ngaySinh,
    String? diaChi,
    String? chucVu,
    ThongTinXacThucResponsive? thongTinXacThuc,
    String? trangThai,
    bool? AuthFactor,
    String? note,
    List<ThongTinCongViecResponsive>? thongTinCongViec,
    List<DsDuAnResponsive>? dsDuAn,
  }) {
    _maNhanVien = maNhanVien;
    _ho = ho;
    _tenLot = tenLot;
    _ten = ten;
    _tenDangNhap = tenDangNhap;
    _sdt = sdt;
    _email = email;
    _gioiTinh = gioiTinh;
    _ngaySinh = ngaySinh;
    _diaChi = diaChi;
    _thongTinXacThuc = thongTinXacThuc;
    _trangThai = trangThai;
    _AuthFactor = AuthFactor;
    _note = note;
    _thongTinCongViec = thongTinCongViec;
    _dsDuAn = dsDuAn;
    _chucVu = chucVu;
  }

  StaffInfoResponsive.fromJson(dynamic json) {
    _maNhanVien = json['maNhanVien'];
    _ho = json['ho'];
    _tenLot = json['tenLot'];
    _ten = json['ten'];
    _tenDangNhap = json['tenDangNhap'];
    _sdt = json['sdt'];
    _chucVu = json['chucVu'];
    _email = json['email'];
    _gioiTinh = json['gioiTinh'];
    _ngaySinh = json['ngaySinh'];
    _diaChi = json['diaChi'];
    _thongTinXacThuc = json['thongTinXacThuc'] != null
        ? ThongTinXacThucResponsive.fromJson(json['thongTinXacThuc'])
        : null;
    _trangThai = json['trangThai'];
    _AuthFactor = json['2AuthFactor'];
    _note = json['note'];
    if (json['thongTinCongViec'] != null) {
      _thongTinCongViec = [];
      json['thongTinCongViec'].forEach((v) {
        _thongTinCongViec?.add(ThongTinCongViecResponsive.fromJson(v));
      });
    }
    if (json['dsDuAn'] != null) {
      _dsDuAn = [];
      json['dsDuAn'].forEach((v) {
        _dsDuAn?.add(DsDuAnResponsive.fromJson(v));
      });
    }
  }
  String? _maNhanVien;
  String? _ho;
  String? _tenLot;
  String? _ten;
  String? _tenDangNhap;
  String? _sdt;
  String? _email;
  String? _gioiTinh;
  String? _chucVu;
  String? _ngaySinh;
  String? _diaChi;
  ThongTinXacThucResponsive? _thongTinXacThuc;
  String? _trangThai;
  bool? _AuthFactor;
  String? _note;
  List<ThongTinCongViecResponsive>? _thongTinCongViec;
  List<DsDuAnResponsive>? _dsDuAn;
  StaffInfoResponsive copyWith({
    String? maNhanVien,
    String? ho,
    String? tenLot,
    String? ten,
    String? tenDangNhap,
    String? sdt,
    String? email,
    String? gioiTinh,
    String? ngaySinh,
    String? diaChi,
    String? chucVu,
    ThongTinXacThucResponsive? thongTinXacThuc,
    String? trangThai,
    bool? AuthFactor,
    String? note,
    List<ThongTinCongViecResponsive>? thongTinCongViec,
    List<DsDuAnResponsive>? dsDuAn,
  }) =>
      StaffInfoResponsive(
        maNhanVien: maNhanVien ?? _maNhanVien,
        ho: ho ?? _ho,
        tenLot: tenLot ?? _tenLot,
        ten: ten ?? _ten,
        tenDangNhap: tenDangNhap ?? _tenDangNhap,
        sdt: sdt ?? _sdt,
        email: email ?? _email,
        chucVu: chucVu ?? _chucVu,
        gioiTinh: gioiTinh ?? _gioiTinh,
        ngaySinh: ngaySinh ?? _ngaySinh,
        diaChi: diaChi ?? _diaChi,
        thongTinXacThuc: thongTinXacThuc ?? _thongTinXacThuc,
        trangThai: trangThai ?? _trangThai,
        AuthFactor: AuthFactor ?? _AuthFactor,
        note: note ?? _note,
        thongTinCongViec: thongTinCongViec ?? _thongTinCongViec,
        dsDuAn: dsDuAn ?? _dsDuAn,
      );
  String? get maNhanVien => _maNhanVien;
  String? get ho => _ho;
  String? get tenLot => _tenLot;
  String? get ten => _ten;
  String? get tenDangNhap => _tenDangNhap;
  String? get sdt => _sdt;
  String? get email => _email;
  String? get gioiTinh => _gioiTinh;
  String? get ngaySinh => _ngaySinh;
  String? get diaChi => _diaChi;
  String? get chucVu => _chucVu;
  ThongTinXacThucResponsive? get thongTinXacThuc => _thongTinXacThuc;
  String? get trangThai => _trangThai;
  bool? get AuthFactor => _AuthFactor;
  String? get note => _note;
  List<ThongTinCongViecResponsive>? get thongTinCongViec => _thongTinCongViec;
  List<DsDuAnResponsive>? get dsDuAn => _dsDuAn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maNhanVien'] = _maNhanVien;
    map['ho'] = _ho;
    map['tenLot'] = _tenLot;
    map['ten'] = _ten;
    map['tenDangNhap'] = _tenDangNhap;
    map['sdt'] = _sdt;
    map['email'] = _email;
    map['gioiTinh'] = _gioiTinh;
    map['chucVu'] = _chucVu;
    map['ngaySinh'] = _ngaySinh;
    map['diaChi'] = _diaChi;
    if (_thongTinXacThuc != null) {
      map['thongTinXacThuc'] = _thongTinXacThuc?.toJson();
    }
    map['trangThai'] = _trangThai;
    map['2AuthFactor'] = _AuthFactor;
    map['note'] = _note;
    if (_thongTinCongViec != null) {
      map['thongTinCongViec'] =
          _thongTinCongViec?.map((v) => v.toJson()).toList();
    }
    if (_dsDuAn != null) {
      map['dsDuAn'] = _dsDuAn?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "1"
/// tenDuAn : "Dự án 1"
/// role : "Kế toán trưởng"

class DsDuAnResponsive {
  DsDuAnResponsive({
    String? id,
    String? tenDuAn,
    String? role,
  }) {
    _id = id;
    _tenDuAn = tenDuAn;
    _role = role;
  }

  DsDuAnResponsive.fromJson(dynamic json) {
    _id = json['id'];
    _tenDuAn = json['tenDuAn'];
    _role = json['role'];
  }
  String? _id;
  String? _tenDuAn;
  String? _role;
  DsDuAnResponsive copyWith({
    String? id,
    String? tenDuAn,
    String? role,
  }) =>
      DsDuAnResponsive(
        id: id ?? _id,
        tenDuAn: tenDuAn ?? _tenDuAn,
        role: role ?? _role,
      );
  String? get id => _id;
  String? get tenDuAn => _tenDuAn;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tenDuAn'] = _tenDuAn;
    map['role'] = _role;
    return map;
  }
}

/// id : "1"
/// boPhan : "Phòng kế toán"
/// quyenHan : "Quản lý"

class ThongTinCongViecResponsive {
  ThongTinCongViecResponsive({
    String? id,
    String? boPhan,
    String? quyenHan,
  }) {
    _id = id;
    _boPhan = boPhan;
    _quyenHan = quyenHan;
  }

  ThongTinCongViecResponsive.fromJson(dynamic json) {
    _id = json['id'];
    _boPhan = json['boPhan'];
    _quyenHan = json['quyenHan'];
  }
  String? _id;
  String? _boPhan;
  String? _quyenHan;
  ThongTinCongViecResponsive copyWith({
    String? id,
    String? boPhan,
    String? quyenHan,
  }) =>
      ThongTinCongViecResponsive(
        id: id ?? _id,
        boPhan: boPhan ?? _boPhan,
        quyenHan: quyenHan ?? _quyenHan,
      );
  String? get id => _id;
  String? get boPhan => _boPhan;
  String? get quyenHan => _quyenHan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['boPhan'] = _boPhan;
    map['quyenHan'] = _quyenHan;
    return map;
  }
}

/// maSoGiayTo : "00978092394"
/// ngayCap : "09/23/2012"
/// noiCap : "Hà Nội"

class ThongTinXacThucResponsive {
  ThongTinXacThucResponsive({
    String? maSoGiayTo,
    String? ngayCap,
    String? noiCap,
  }) {
    _maSoGiayTo = maSoGiayTo;
    _ngayCap = ngayCap;
    _noiCap = noiCap;
  }

  ThongTinXacThucResponsive.fromJson(dynamic json) {
    _maSoGiayTo = json['maSoGiayTo'];
    _ngayCap = json['ngayCap'];
    _noiCap = json['noiCap'];
  }
  String? _maSoGiayTo;
  String? _ngayCap;
  String? _noiCap;
  ThongTinXacThucResponsive copyWith({
    String? maSoGiayTo,
    String? ngayCap,
    String? noiCap,
  }) =>
      ThongTinXacThucResponsive(
        maSoGiayTo: maSoGiayTo ?? _maSoGiayTo,
        ngayCap: ngayCap ?? _ngayCap,
        noiCap: noiCap ?? _noiCap,
      );
  String? get maSoGiayTo => _maSoGiayTo;
  String? get ngayCap => _ngayCap;
  String? get noiCap => _noiCap;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maSoGiayTo'] = _maSoGiayTo;
    map['ngayCap'] = _ngayCap;
    map['noiCap'] = _noiCap;
    return map;
  }
}
