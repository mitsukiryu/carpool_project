import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'KEYS.env')
abstract class Env {
  @EnviedField(varName: 'MAPAPI')
  static const String mapAPIKey = _Env.mapAPIKey;
}
