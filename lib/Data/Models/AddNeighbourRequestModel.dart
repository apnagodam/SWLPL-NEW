import 'dart:convert';

String neighbourModelToMap(Addneighbourrequestmodel data) =>
    json.encode(data.toMap());

class Addneighbourrequestmodel {
  dynamic terminal_id;
  dynamic notes;
  List<NeighbourDetails>? neighbour_array;

  Addneighbourrequestmodel({
    this.terminal_id,
    this.notes,
    this.neighbour_array,
  });

  Map<String, dynamic> toMap() => {
        "terminal_id": terminal_id,
        "notes": notes,
        "neighbour_array": neighbour_array == null
            ? []
            : List<dynamic>.from(neighbour_array!.map((x) => x.toMap())),
      };
}

class NeighbourDetails {
  dynamic name;
  dynamic phone;

  NeighbourDetails({this.name, this.phone});

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
      };
}
