import 'package:flutter/material.dart';

class DormPolicyModel {
  final int maxPerson;
  final bool allowSmoke;
  final bool allowPet;
  final bool allowMarried;
  final bool fullDay;
  final TimeOfDay? closeTime;
  final bool allowVisitor;
  final bool allowOppositeVisitorGender;
  final TimeOfDay? maxVisitTime;
  final int deposit;

  DormPolicyModel({
    required this.maxPerson,
    required this.deposit,
    this.allowSmoke = false,
    this.allowPet = false,
    this.allowMarried = false,
    this.fullDay = false,
    this.closeTime,
    this.allowVisitor = false,
    this.allowOppositeVisitorGender = false,
    this.maxVisitTime,
  });
}
