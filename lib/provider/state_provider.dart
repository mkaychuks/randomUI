

import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentStateProvider = StateProvider.autoDispose<int>((ref) => 50);