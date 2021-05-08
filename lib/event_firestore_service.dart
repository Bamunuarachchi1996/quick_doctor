import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:quick_doctor/models/event.dart';

DatabaseService<EventModel> eventDBS = DatabaseService<EventModel>(
    "Appointments",
    fromDS: (id, data) => EventModel.fromDS(id, data),
    toMap: (event) => event.toMap());
