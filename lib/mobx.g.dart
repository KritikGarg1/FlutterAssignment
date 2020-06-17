// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mobx on _MobX, Store {
  final _$dateAtom = Atom(name: '_MobX.date');

  @override
  String get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$_MobXActionController = ActionController(name: '_MobX');

  @override
  void initialize() {
    final _$actionInfo = _$_MobXActionController.startAction();
    try {
      return super.initialize();
    } finally {
      _$_MobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(dynamic dt) {
    final _$actionInfo = _$_MobXActionController.startAction();
    try {
      return super.update(dt);
    } finally {
      _$_MobXActionController.endAction(_$actionInfo);
    }
  }
}
