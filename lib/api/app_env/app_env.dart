/*
 * Copyright (c) Uphead Management 2024.  All rights reserved.
 * No part of this code may be reproduced, distributed, or transmitted in any form or by any means,
 * including photocopying, recording, or other electronic or mechanical methods.
 */




// Enum for environment types
import 'package:Food/api/app_env/prod_env.dart';

enum EnvironmentType {  prod }

abstract class AppEnv {
  String get baseUrl;
  String get environmentName;

  // Singleton instance
  static late final AppEnv _instance;

  static AppEnv get instance => _instance;

  // Factory method to initialize once
  factory AppEnv.init(EnvironmentType envType) {
    _instance = _getEnvironment(envType);
    return _instance;
  }

  static AppEnv _getEnvironment(EnvironmentType envType) {
    switch (envType) {
      case EnvironmentType.prod:
      default:
        return ProdEnv();
    }
  }
}


