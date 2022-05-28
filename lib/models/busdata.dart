// ignore_for_file: prefer_typing_uninitialized_variables

class Ticket {
  num iD;
  String imgUrl;
  String name;
  double price;
  num quantity;
  bool hightLight;
  List<String> currenSelectedValueTime;
  List<String> currenValueSelectedCar;
  Ticket(
      {required this.iD,
      required this.imgUrl,
      required this.name,
      required this.price,
      required this.quantity,
      required this.currenSelectedValueTime,
      required this.currenValueSelectedCar,
      this.hightLight = false});

  get gennerateNKLTicket => null;

  static List<Ticket> generateNKLTicket() {
    return [
      Ticket(
        iD: 1,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ຫຼວງພະບາງ',
        price: 150.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1111',
          'ຂຂ 2222',
          'ຄຄ 3333',
          'ງງ 4444',
          'ຈຈ 5555',
          'ສສ 6666',
          'ຊຊ 7777',
          'ຍຍ 8888',
          'ດດ 9999',
          'ຕຕ 1010',
          'ຖຖ 1011',
          'ທທ 1012',
          'ນນ 1013',
          'ບບ 1014',
          'ປປ 1015',
        ],
      ),
      Ticket(
        iD: 2,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ໄຊຍະບູລີ',
        price: 120.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 2121',
          'ຂຂ 2242',
          'ຄຄ 2363',
          'ງງ 2484',
          'ຈຈ 2505',
          'ສສ 2612',
          'ຊຊ 2714',
          'ຍຍ 2816',
          'ດດ 2918',
          'ຕຕ 1011',
          'ຖຖ 1001',
          'ທທ 1002',
          'ນນ 1010',
          'ບບ 1114',
          'ປປ 1115',
        ],
      ),
      Ticket(
        iD: 3,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ຫົວພັນ',
        price: 230.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 0001',
          'ຂຂ 0202',
          'ຄຄ 0303',
          'ງງ 0404',
          'ຈຈ 0505',
          'ສສ 0606',
          'ຊຊ 0707',
          'ຍຍ 0808',
          'ດດ 0909',
          'ຕຕ 0010',
          'ຖຖ 0011',
          'ທທ 0012',
          'ນນ 0013',
          'ບບ 0014',
          'ປປ 0015',
        ],
      ),
      Ticket(
        iD: 4,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ບໍ່ແກ້ວ',
        price: 280.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1110',
          'ຂຂ 2220',
          'ຄຄ 3330',
          'ງງ 4440',
          'ຈຈ 5550',
          'ສສ 6660',
          'ຊຊ 7770',
          'ຍຍ 8880',
          'ດດ 9990',
          'ຕຕ 1000',
          'ຖຖ 1010',
          'ທທ 1112',
          'ນນ 1113',
          'ບບ 1114',
          'ປປ 1115',
        ],
      ),
      Ticket(
        iD: 5,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ຊຽງຂວາງ',
        price: 130.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1100',
          'ຂຂ 2200',
          'ຄຄ 3300',
          'ງງ 4400',
          'ຈຈ 5500',
          'ສສ 6600',
          'ຊຊ 7700',
          'ຍຍ 8800',
          'ດດ 9900',
          'ຕຕ 1000',
          'ຖຖ 1011',
          'ທທ 1012',
          'ນນ 1013',
          'ບບ 1014',
          'ປປ 1015',
        ],
      ),
      Ticket(
        iD: 6,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ອັດຕະປື',
        price: 200.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1000',
          'ຂຂ 2000',
          'ຄຄ 3000',
          'ງງ 4000',
          'ຈຈ 5000',
          'ສສ 6000',
          'ຊຊ 7000',
          'ຍຍ 8000',
          'ດດ 9000',
          'ຕຕ 0010',
          'ຖຖ 2011',
          'ທທ 2012',
          'ນນ 2013',
          'ບບ 2014',
          'ປປ 2015',
        ],
      ),
      Ticket(
        iD: 7,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ຜົ້ງສາລີ',
        price: 250.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 7111',
          'ຂຂ 7222',
          'ຄຄ 7333',
          'ງງ 7444',
          'ຈຈ 7555',
          'ສສ 7666',
          'ຊຊ 0777',
          'ຍຍ 7888',
          'ດດ 7999',
          'ຕຕ 7010',
          'ຖຖ 7011',
          'ທທ 7012',
          'ນນ 7013',
          'ບບ 7014',
          'ປປ 7015',
        ],
      ),
      Ticket(
        iD: 8,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ບໍລິຄຳໄຊ',
        price: 100.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 8111',
          'ຂຂ 8222',
          'ຄຄ 8333',
          'ງງ 8444',
          'ຈຈ 8555',
          'ສສ 8666',
          'ຊຊ 8777',
          'ຍຍ 0888',
          'ດດ 8999',
          'ຕຕ 8010',
          'ຖຖ 8011',
          'ທທ 8012',
          'ນນ 8013',
          'ບບ 8014',
          'ປປ 8015',
        ],
      ),
      Ticket(
        iD: 9,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ຄຳມ່ວນ',
        price: 85.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 9111',
          'ຂຂ 9222',
          'ຄຄ 9333',
          'ງງ 9444',
          'ຈຈ 9555',
          'ສສ 9666',
          'ຊຊ 9777',
          'ຍຍ 9888',
          'ດດ 0999',
          'ຕຕ 9010',
          'ຖຖ 9011',
          'ທທ 9012',
          'ນນ 9013',
          'ບບ 9014',
          'ປປ 9015',
        ],
      ),
      Ticket(
        iD: 10,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ສະຫວັນນະເຂດ',
        price: 110.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1011',
          'ຂຂ 2022',
          'ຄຄ 3033',
          'ງງ 4044',
          'ຈຈ 5055',
          'ສສ 6066',
          'ຊຊ 7077',
          'ຍຍ 8088',
          'ດດ 9099',
          'ຕຕ 1010',
          'ຖຖ 1011',
          'ທທ 1012',
          'ນນ 1013',
          'ບບ 1014',
          'ປປ 1015',
        ],
      ),
      Ticket(
        iD: 11,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ວຽງຈັນ',
        price: 100.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1111',
          'ຂຂ 2122',
          'ຄຄ 3133',
          'ງງ 4144',
          'ຈຈ 5155',
          'ສສ 6166',
          'ຊຊ 7177',
          'ຍຍ 8188',
          'ດດ 9199',
          'ຕຕ 1110',
          'ຖຖ 1111',
          'ທທ 1112',
          'ນນ 1113',
          'ບບ 1114',
          'ປປ 1115',
        ],
      ),
      Ticket(
        iD: 12,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ສາລະວັນ',
        price: 150.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1211',
          'ຂຂ 2222',
          'ຄຄ 3233',
          'ງງ 4244',
          'ຈຈ 5255',
          'ສສ 6266',
          'ຊຊ 7277',
          'ຍຍ 8288',
          'ດດ 9299',
          'ຕຕ 1210',
          'ຖຖ 1211',
          'ທທ 1212',
          'ນນ 1213',
          'ບບ 1214',
          'ປປ 1215',
        ],
      ),
      Ticket(
        iD: 13,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ເຊກອງ',
        price: 190.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1311',
          'ຂຂ 2322',
          'ຄຄ 3333',
          'ງງ 4344',
          'ຈຈ 5355',
          'ສສ 6366',
          'ຊຊ 7377',
          'ຍຍ 8388',
          'ດດ 9399',
          'ຕຕ 1310',
          'ຖຖ 1311',
          'ທທ 1312',
          'ນນ 1313',
          'ບບ 1314',
          'ປປ 1315',
        ],
      ),
      Ticket(
        iD: 14,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ຈຳປາສັກ',
        price: 130.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1411',
          'ຂຂ 2422',
          'ຄຄ 3433',
          'ງງ 4444',
          'ຈຈ 5455',
          'ສສ 6466',
          'ຊຊ 7477',
          'ຍຍ 8488',
          'ດດ 9499',
          'ຕຕ 1410',
          'ຖຖ 1411',
          'ທທ 1412',
          'ນນ 1413',
          'ບບ 1414',
          'ປປ 1415',
        ],
      ),
      Ticket(
        iD: 15,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ໄຊສົມບູນ',
        price: 80.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1511',
          'ຂຂ 2522',
          'ຄຄ 3533',
          'ງງ 4544',
          'ຈຈ 5555',
          'ສສ 6566',
          'ຊຊ 7577',
          'ຍຍ 8588',
          'ດດ 9599',
          'ຕຕ 1510',
          'ຖຖ 1511',
          'ທທ 1512',
          'ນນ 1513',
          'ບບ 1514',
          'ປປ 1515',
        ],
      ),
      Ticket(
        iD: 16,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ຫຼວງນຳ້ທາ',
        price: 220.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1611',
          'ຂຂ 2622',
          'ຄຄ 3633',
          'ງງ 4644',
          'ຈຈ 5655',
          'ສສ 6666',
          'ຊຊ 7677',
          'ຍຍ 8688',
          'ດດ 9699',
          'ຕຕ 1610',
          'ຖຖ 1611',
          'ທທ 1612',
          'ນນ 1613',
          'ບບ 1614',
          'ປປ 1615',
        ],
      ),
      Ticket(
        iD: 17,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ນະຄອນຫຼວງ-ອຸດົມໄຊ',
        price: 190.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1711',
          'ຂຂ 2722',
          'ຄຄ 3733',
          'ງງ 4744',
          'ຈຈ 5755',
          'ສສ 6766',
          'ຊຊ 7777',
          'ຍຍ 8788',
          'ດດ 9799',
          'ຕຕ 1710',
          'ຖຖ 1711',
          'ທທ 1712',
          'ນນ 1713',
          'ບບ 1714',
          'ປປ 1715',
        ],
      ),
    ];
  }

  static List<Ticket> generateTKHTicket() {
    return [
      Ticket(
        iD: 18,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ຫຼວງພະບາງ-ນະຄອນຫຼວງ',
        price: 150.000,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1811',
          'ຂຂ 2822',
          'ຄຄ 3833',
          'ງງ 4844',
          'ຈຈ 5855',
          'ສສ 6866',
          'ຊຊ 7877',
          'ຍຍ 8888',
          'ດດ 9899',
          'ຕຕ 1810',
          'ຖຖ 1811',
          'ທທ 1812',
          'ນນ 1813',
          'ບບ 1814',
          'ປປ 1815',
        ],
      ),
      Ticket(
        iD: 19,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ໄຊຍະບູລີ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1911',
          'ຂຂ 2922',
          'ຄຄ 3933',
          'ງງ 4944',
          'ຈຈ 5955',
          'ສສ 6966',
          'ຊຊ 7977',
          'ຍຍ 8988',
          'ດດ 9999',
          'ຕຕ 1910',
          'ຖຖ 1911',
          'ທທ 1912',
          'ນນ 1913',
          'ບບ 1914',
          'ປປ 1915',
        ],
      ),
      Ticket(
        iD: 20,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ຫົວພັນ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1101',
          'ຂຂ 2202',
          'ຄຄ 3303',
          'ງງ 4404',
          'ຈຈ 5505',
          'ສສ 6606',
          'ຊຊ 7707',
          'ຍຍ 8808',
          'ດດ 9909',
          'ຕຕ 1000',
          'ຖຖ 1001',
          'ທທ 1002',
          'ນນ 1003',
          'ບບ 1004',
          'ປປ 1005',
        ],
      ),
      Ticket(
        iD: 21,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ບໍ່ແກ້ວ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1111',
          'ຂຂ 2212',
          'ຄຄ 3313',
          'ງງ 4414',
          'ຈຈ 5515',
          'ສສ 6616',
          'ຊຊ 7717',
          'ຍຍ 8818',
          'ດດ 9919',
          'ຕຕ 1010',
          'ຖຖ 1011',
          'ທທ 1012',
          'ນນ 1013',
          'ບບ 1014',
          'ປປ 1015',
        ],
      ),
      Ticket(
        iD: 22,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ຊຽງຂວາງ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1121',
          'ຂຂ 2222',
          'ຄຄ 3323',
          'ງງ 4424',
          'ຈຈ 5525',
          'ສສ 6626',
          'ຊຊ 7727',
          'ຍຍ 8828',
          'ດດ 9929',
          'ຕຕ 1020',
          'ຖຖ 1021',
          'ທທ 1022',
          'ນນ 1023',
          'ບບ 1024',
          'ປປ 1025',
        ],
      ),
      Ticket(
        iD: 23,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ອັດຕະປື-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1131',
          'ຂຂ 2232',
          'ຄຄ 3333',
          'ງງ 4434',
          'ຈຈ 5535',
          'ສສ 6636',
          'ຊຊ 7737',
          'ຍຍ 8838',
          'ດດ 9939',
          'ຕຕ 1030',
          'ຖຖ 1031',
          'ທທ 1032',
          'ນນ 1033',
          'ບບ 1034',
          'ປປ 1035',
        ],
      ),
      Ticket(
        iD: 24,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ຜົ້ງສາລີ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1141',
          'ຂຂ 2242',
          'ຄຄ 3343',
          'ງງ 4444',
          'ຈຈ 5545',
          'ສສ 6646',
          'ຊຊ 7747',
          'ຍຍ 8848',
          'ດດ 9949',
          'ຕຕ 1040',
          'ຖຖ 1041',
          'ທທ 1042',
          'ນນ 1043',
          'ບບ 1044',
          'ປປ 1045',
        ],
      ),
      Ticket(
        iD: 25,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ບໍລິຄຳໄຊ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1151',
          'ຂຂ 2252',
          'ຄຄ 3353',
          'ງງ 4454',
          'ຈຈ 5555',
          'ສສ 6656',
          'ຊຊ 7757',
          'ຍຍ 8858',
          'ດດ 9959',
          'ຕຕ 1050',
          'ຖຖ 1051',
          'ທທ 1052',
          'ນນ 1053',
          'ບບ 1054',
          'ປປ 1055',
        ],
      ),
      Ticket(
        iD: 26,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ຄຳມ່ວນ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1161',
          'ຂຂ 2262',
          'ຄຄ 3363',
          'ງງ 4464',
          'ຈຈ 5565',
          'ສສ 6606',
          'ຊຊ 7767',
          'ຍຍ 8868',
          'ດດ 9969',
          'ຕຕ 1060',
          'ຖຖ 1061',
          'ທທ 1062',
          'ນນ 1063',
          'ບບ 1064',
          'ປປ 1065',
        ],
      ),
      Ticket(
        iD: 27,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ສະຫວັນນະເຂດ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1171',
          'ຂຂ 2272',
          'ຄຄ 3373',
          'ງງ 4474',
          'ຈຈ 5575',
          'ສສ 6676',
          'ຊຊ 7707',
          'ຍຍ 8878',
          'ດດ 9979',
          'ຕຕ 1070',
          'ຖຖ 1071',
          'ທທ 1072',
          'ນນ 1073',
          'ບບ 1074',
          'ປປ 1075',
        ],
      ),
      Ticket(
        iD: 28,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ວຽງຈັນ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1181',
          'ຂຂ 2282',
          'ຄຄ 3383',
          'ງງ 4484',
          'ຈຈ 5585',
          'ສສ 6686',
          'ຊຊ 7787',
          'ຍຍ 8808',
          'ດດ 9989',
          'ຕຕ 1080',
          'ຖຖ 1081',
          'ທທ 1082',
          'ນນ 1083',
          'ບບ 1084',
          'ປປ 1085',
        ],
      ),
      Ticket(
        iD: 29,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ສາລະວັນ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1191',
          'ຂຂ 2292',
          'ຄຄ 3393',
          'ງງ 4494',
          'ຈຈ 5595',
          'ສສ 6696',
          'ຊຊ 7797',
          'ຍຍ 8898',
          'ດດ 9909',
          'ຕຕ 1090',
          'ຖຖ 1091',
          'ທທ 1092',
          'ນນ 1093',
          'ບບ 1094',
          'ປປ 1095',
        ],
      ),
      Ticket(
        iD: 30,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ເຊກອງ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1101',
          'ຂຂ 2202',
          'ຄຄ 3303',
          'ງງ 4404',
          'ຈຈ 5505',
          'ສສ 6606',
          'ຊຊ 7707',
          'ຍຍ 8808',
          'ດດ 9909',
          'ຕຕ 1000',
          'ຖຖ 1001',
          'ທທ 1002',
          'ນນ 1003',
          'ບບ 1004',
          'ປປ 1005',
        ],
      ),
      Ticket(
        iD: 31,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ຈຳປາສັກ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 1113',
          'ຂຂ 2223',
          'ຄຄ 3330',
          'ງງ 4443',
          'ຈຈ 5553',
          'ສສ 6663',
          'ຊຊ 7773',
          'ຍຍ 8883',
          'ດດ 9993',
          'ຕຕ 1013',
          'ຖຖ 1013',
          'ທທ 1013',
          'ນນ 1013',
          'ບບ 1013',
          'ປປ 1013',
        ],
      ),
      Ticket(
        iD: 32,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ໄຊສົມບູນ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 3111',
          'ຂຂ 3222',
          'ຄຄ 0333',
          'ງງ 3444',
          'ຈຈ 3555',
          'ສສ 3666',
          'ຊຊ 3777',
          'ຍຍ 3888',
          'ດດ 3999',
          'ຕຕ 3010',
          'ຖຖ 3011',
          'ທທ 3012',
          'ນນ 3013',
          'ບບ 3014',
          'ປປ 3015',
        ],
      ),
      Ticket(
        iD: 33,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ຫຼວງນຳ້ທາ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 3311',
          'ຂຂ 3322',
          'ຄຄ 0033',
          'ງງ 3344',
          'ຈຈ 3355',
          'ສສ 3366',
          'ຊຊ 3377',
          'ຍຍ 3388',
          'ດດ 3399',
          'ຕຕ 3310',
          'ຖຖ 3311',
          'ທທ 3312',
          'ນນ 3313',
          'ບບ 3314',
          'ປປ 3315',
        ],
      ),
      Ticket(
        iD: 34,
        imgUrl: 'assets/images/buslogo.png',
        name: 'ອຸດົມໄຊ-ນະຄອນຫຼວງ',
        price: 12,
        quantity: 1,
        hightLight: true,
        currenSelectedValueTime: [
          "8:00",
          "9:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
          "17:00",
          "18:00",
          "19:00",
          "20:00",
          "21:00",
          "22:00",
        ],
        currenValueSelectedCar: [
          'ກກ 3411',
          'ຂຂ 3522',
          'ຄຄ 3633',
          'ງງ 3744',
          'ຈຈ 3855',
          'ສສ 3966',
          'ຊຊ 7077',
          'ຍຍ 8088',
          'ດດ 9099',
          'ຕຕ 1210',
          'ຖຖ 1311',
          'ທທ 1412',
          'ນນ 1513',
          'ບບ 1614',
          'ປປ 1715',
        ],
      ),
    ];
  }
}
