class User {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? dialCode;
  String? countryName;
  String? countryCode;
  String? city;
  String? state;
  String? zip;
  String? mobile;
  int? refBy;
  String? profitWallet;
  dynamic image;
  String? address;
  int? status;
  dynamic kycRejectionReason;
  int? kv;
  int? ev;
  int? sv;
  int? profileComplete;
  dynamic verCodeSendAt;
  int? ts;
  int? tv;
  dynamic tsc;
  dynamic sessionData;
  dynamic banReason;
  dynamic provider;
  dynamic providerId;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.dialCode,
    this.countryName,
    this.countryCode,
    this.city,
    this.state,
    this.zip,
    this.mobile,
    this.refBy,
    this.profitWallet,
    this.image,
    this.address,
    this.status,
    this.kycRejectionReason,
    this.kv,
    this.ev,
    this.sv,
    this.profileComplete,
    this.verCodeSendAt,
    this.ts,
    this.tv,
    this.tsc,
    this.sessionData,
    this.banReason,
    this.provider,
    this.providerId,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        firstname: json['firstname'] as String?,
        lastname: json['lastname'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        dialCode: json['dial_code'] as String?,
        countryName: json['country_name'] as String?,
        countryCode: json['country_code'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        zip: json['zip'] as String?,
        mobile: json['mobile'] as String?,
        refBy: json['ref_by'] as int?,
        profitWallet: json['profit_wallet'] as String?,
        image: json['image'] as dynamic,
        address: json['address'] as String?,
        status: json['status'] as int?,
        kycRejectionReason: json['kyc_rejection_reason'] as dynamic,
        kv: json['kv'] as int?,
        ev: json['ev'] as int?,
        sv: json['sv'] as int?,
        profileComplete: json['profile_complete'] as int?,
        verCodeSendAt: json['ver_code_send_at'] as dynamic,
        ts: json['ts'] as int?,
        tv: json['tv'] as int?,
        tsc: json['tsc'] as dynamic,
        sessionData: json['session_data'] as dynamic,
        banReason: json['ban_reason'] as dynamic,
        provider: json['provider'] as dynamic,
        providerId: json['provider_id'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'email': email,
        'dial_code': dialCode,
        'country_name': countryName,
        'country_code': countryCode,
        'city': city,
        'state': state,
        'zip': zip,
        'mobile': mobile,
        'ref_by': refBy,
        'profit_wallet': profitWallet,
        'image': image,
        'address': address,
        'status': status,
        'kyc_rejection_reason': kycRejectionReason,
        'kv': kv,
        'ev': ev,
        'sv': sv,
        'profile_complete': profileComplete,
        'ver_code_send_at': verCodeSendAt,
        'ts': ts,
        'tv': tv,
        'tsc': tsc,
        'session_data': sessionData,
        'ban_reason': banReason,
        'provider': provider,
        'provider_id': providerId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
