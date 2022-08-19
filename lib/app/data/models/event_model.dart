// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

class Event {
  Event({
    required this.id,
    this.description,
    this.place,
    this.reference,
    this.status,
    this.ticketPrice,
    this.totalTickets,
    this.userId,
  });
  String id;
  String? description;
  String? place;
  String? reference;
  String? status;
  int? ticketPrice;
  int? totalTickets;
  String? userId;
}
