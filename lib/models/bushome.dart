import 'package:btbpp/models/busdata.dart';

class Bus {
  Map<String, List<Ticket>> menu;
  Bus(this.menu);
  static Bus generateTicket() {
    return Bus(
      {
        'ນະຄອນຫຼວງ-ຕ່າງແຂວງ': Ticket.generateNKLTicket(),
        'ຕ່າງແຂວງ-ນະຄອນຫຼວງ': Ticket.generateTKHTicket(),
      },
    );
  }
}