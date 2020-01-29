import 'package:flutter_modular/config/environment/env_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/utility/saver/saver.dart';
import 'package:flutter_modular/utility/saver/saver_keys.dart';

class Env {
  Env._();
  static final Env instance = Env._();

  factory Env() {
    return instance;
  }

  String baseUrl;
  String baseAuthUrl;
  String baseUrlGql;
  String basicAuth;
  String clientSecret;
  String clientId;
  String geofazzUrl;
  EnvType environmentType;
  String dbName;
  int dbVersion;
  String dbKycName;
  int dbKycVersion;

  void setLive() {
    baseUrl = 'https://secure.fazzcard.com';
    baseAuthUrl = 'https://secure.fazzcard.com/heimdall';
    baseUrlGql = 'https://gql.fazzcard.com/';
    basicAuth =
        'Basic 55a93702ce525d8ac047f5fb402caf28daef7bf4e8a5f92cfa62a4442cf04746';
    clientSecret = '';
    clientId = 'O3NVE01LO54LAVM5TM62NQOMMGH5IDH6';
    geofazzUrl = 'https://secure.payfazz.com/geofazz/v1';
    environmentType = EnvType.LIVE;
    dbName = 'dbLive.db';
    dbVersion = 2;
    dbKycName = 'dbKycLive.db';
    dbKycVersion = 1;
  }

  void setStaging() {
    baseUrl = 'https://test1.fazzcard.com';
    baseAuthUrl = 'https://test1.fazzcard.com/heimdall';
    baseUrlGql = 'https://gql.test1.fazzcard.com/';
    basicAuth =
        'Basic 55a93702ce525d8ac047f5fb402caf28daef7bf4e8a5f92cfa62a4442cf04746';
    clientSecret = '';
    clientId = 'O3NVE01LO54LAVM5TM62NQOMMGH5IDH6';
    environmentType = EnvType.STAGING;
    dbName = 'dbStaging.db';
    dbVersion = 2;
    dbKycName = 'dbKycStaging.db';
    dbKycVersion = 1;
    geofazzUrl =
        'https://secure.canfazz.com/dev-vm-fary0ikahakn0iyx/api/geofazz/v1';
  }

  Future<void> setCustom() async {
    baseUrl = await Saver()
        .retrieve(SaverKeys.baseUrlKey)
        .catchError((_) => this.baseUrl);
    baseAuthUrl = await Saver()
        .retrieve(SaverKeys.baseAuthUrlKey)
        .catchError((_) => this.baseAuthUrl);
    baseUrlGql = await Saver()
        .retrieve(SaverKeys.baseUrlGqlKey)
        .catchError((_) => this.baseUrlGql);
    basicAuth = await Saver()
        .retrieve(SaverKeys.basicAuthKey)
        .catchError((_) => this.basicAuth);
    clientSecret = await Saver()
        .retrieve(SaverKeys.clientSecretKey)
        .catchError((_) => this.clientSecret);
    clientId = await Saver()
        .retrieve(SaverKeys.clientIdKey)
        .catchError((_) => this.clientId);
    environmentType = EnvType.CUSTOM;
  }

  void setTest() {
    baseUrl = 'https://test1.fazzcard.com';
    baseAuthUrl = 'https://test1.fazzcard.com/heimdall';
    baseUrlGql = 'https://gql.test1.fazzcard.com/';
    basicAuth =
        'Basic b3044ea7777761c883d6a09f76fd37d60c08c48db616b22d2bfc30cc0a6e106a';
    clientSecret = 'secret';
    clientId = 'cashfazz-android';
    environmentType = EnvType.TEST;
    dbName = 'dbTest.db';
    dbVersion = 1;
    dbKycName = 'dbKycTest.db';
    dbKycVersion = 1;
  }

  bool isDebug() => environmentType != EnvType.LIVE;
  bool isBuildDebug() => kDebugMode;
  bool isBuildRelease() => kReleaseMode;
}
