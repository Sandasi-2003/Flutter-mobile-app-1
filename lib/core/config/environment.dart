enum AppEnvironment { development, staging, production }

extension AppEnvironmentExtension on AppEnvironment {
  String get name {
    switch (this) {
      case AppEnvironment.development:
        return 'development';
      case AppEnvironment.staging:
        return 'staging';
      case AppEnvironment.production:
        return 'production';
    }
  }

  String get fileName {
    switch (this) {
      case AppEnvironment.development:
        return '.env.development';
      case AppEnvironment.staging:
        return '.env.staging';
      case AppEnvironment.production:
        return '.env.production';
    }
  }

  bool get isDevelopment => this == AppEnvironment.development;

  bool get isStaging => this == AppEnvironment.staging;

  bool get isProduction => this == AppEnvironment.production;
}

class EnvironmentConfig {
  EnvironmentConfig._();

  static const String _environment = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'development',
  );

  static AppEnvironment get current {
    switch (_environment) {
      case 'production':
        return AppEnvironment.production;
      case 'staging':
        return AppEnvironment.staging;
      case 'development':
      default:
        return AppEnvironment.development;
    }
  }
}
