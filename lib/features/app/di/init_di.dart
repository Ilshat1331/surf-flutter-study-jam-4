import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'init_di.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void initDi(String env) => sl.init(environment: env);
