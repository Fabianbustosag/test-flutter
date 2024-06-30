# flutter_application_1

en FoodService getFood, hay que crear la excepciones

que pasa cuando intento eliminar un objeto que no existe

    if (elaborationDate != null) {
      json["elaboration_date"] =
          "${elaborationDate!.year.toString().padLeft(4, '0')}-${elaborationDate!.month.toString().padLeft(2, '0')}-${elaborationDate!.day.toString().padLeft(2, '0')}";
    }

json["elaboration_date"] = elaborationDate != null ? "${elaborationDate!.year.toString().padLeft(4, '0')}-${elaborationDate!.month.toString().padLeft(2, '0')}-${elaborationDate!.day.toString().padLeft(2, '0')}"
    : null;