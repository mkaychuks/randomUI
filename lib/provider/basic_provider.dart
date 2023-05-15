


import 'package:flutter_riverpod/flutter_riverpod.dart';

final myNameProvider = Provider<String>((ref) => "Ifeanyichukwu Achufusi");



List<String> names = List.generate(50, (index) => "Ifeanyi");

final namesProvider = Provider<List<String>>((ref) => names);