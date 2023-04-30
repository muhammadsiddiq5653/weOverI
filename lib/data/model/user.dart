class User {
  User({
    this.id = -1,
    this.name = '',
    this.email = '',
    this.emailVerifiedAt = '',
    this.forgetPasswordToken = '',
    this.status = '',
    this.providerId = '',
    this.provider = '',
    this.providerAvatar = '',
    this.image = '',
    this.phone = '',
    this.countryId = '',
    this.stateId = '',
    this.cityId = '',
    this.zipCode = '',
    this.address = '',
    this.isVendor = '',
    this.verifyToken = '',
    this.emailVerified = '',
    this.agreePolicy = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      forgetPasswordToken: json['forget_password_token'],
      status: json['status'],
      providerId: json['provider_id'],
      provider: json['provider'],
      providerAvatar: json['provider_avatar'],
      image: json['image'],
      phone: json['phone'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      cityId: json['city_id'],
      zipCode: json['zip_code'],
      address: json['address'],
      isVendor: json['is_vendor'],
      verifyToken: json['verify_token'],
      emailVerified: json['email_verified'],
      agreePolicy: json['agree_policy'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic forgetPasswordToken;
  String status;
  dynamic providerId;
  dynamic provider;
  dynamic providerAvatar;
  dynamic image;
  dynamic phone;
  String countryId;
  String stateId;
  String cityId;
  dynamic zipCode;
  dynamic address;
  String isVendor;
  dynamic verifyToken;
  String emailVerified;
  String agreePolicy;
  String createdAt;
  String updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['forget_password_token'] = forgetPasswordToken;
    map['status'] = status;
    map['provider_id'] = providerId;
    map['provider'] = provider;
    map['provider_avatar'] = providerAvatar;
    map['image'] = image;
    map['phone'] = phone;
    map['country_id'] = countryId;
    map['state_id'] = stateId;
    map['city_id'] = cityId;
    map['zip_code'] = zipCode;
    map['address'] = address;
    map['is_vendor'] = isVendor;
    map['verify_token'] = verifyToken;
    map['email_verified'] = emailVerified;
    map['agree_policy'] = agreePolicy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
