class ManufacturerDetails {
  final String manufacturer;
  final String image;
  final String description;

  ManufacturerDetails(
      {required this.manufacturer,
      required this.image,
      required this.description});
}

final List<ManufacturerDetails> carsMock = [
  ManufacturerDetails(
      manufacturer: 'Toyota',
      image:
          'https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1683645145/autoexpress/2023/05/Toyota%20RAV4%20PHEV%20007_wqi243.jpg',
      description:
          'Toyota Motor Corporation is a Japanese multinational automotive manufacturer headquartered in Toyota City, Aichi, Japan. It was founded by Kiichiro Toyoda and incorporated on August 28, 1937. Toyota is one of the largest automobile manufacturers in the world, producing about 10 million vehicles per year.'),
  ManufacturerDetails(
      manufacturer: 'Honda',
      image:
          'https://media.ed.edmunds-media.com/honda/cr-v/2024/oem/2024_honda_cr-v_4dr-suv_ex-l_fq_oem_1_1600.jpg',
      description:
          'Honda Motor Co., Ltd. is a Japanese public multinational conglomerate manufacturer of automobiles, motorcycles, and power equipment, headquartered in Minato, Tokyo, Japan. Honda has been the world\'s largest motorcycle manufacturer since 1959, reaching a production of 400 million by the end of 2019.'),
  ManufacturerDetails(
      manufacturer: 'Ford',
      image:
          "https://image.cnbcfm.com/api/v1/image/107238183-1683642530891-All-New_Ford_Ranger_Raptor_12.jpg?v=1684584001&w=1600&h=900",
      description:
          "Ford Motor Company is an American multinational automobile manufacturer headquartered in Dearborn, Michigan, United States. It was founded by Henry Ford and incorporated on June 16, 1903. The company sells automobiles and commercial vehicles under the Ford brand, and luxury cars under its Lincoln brand."),
  ManufacturerDetails(
      manufacturer: 'Chevrolet',
      image:
          "https://image.cnbcfm.com/api/v1/image/105232079-2018-Chevrolet-Camaro-ZL1-033.jpg?v=1679502991",
      description:
          "Chevrolet is an American automobile division of the manufacturer General Motors. Louis Chevrolet, Arthur Chevrolet and ousted General Motors founder William C. Durant started the company on November 3, 1911 as the Chevrolet Motor Car Company."),
  ManufacturerDetails(
      manufacturer: 'Nissan',
      image:
          "https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1680790692/autoexpress/2023/04/Nissan%20Qashqai%20Tekna%20UK%20019_cjshdd.jpg",
      description:
          "Nissan Motor Co. Ltd., often shortened to Nissan, is a Japanese multinational automobile manufacturer headquartered in Yokohama, Kanagawa Prefecture, Japan."),
  ManufacturerDetails(
      manufacturer: 'Volkswagen',
      image:
          "https://media.ed.edmunds-media.com/volkswagen/tiguan/2022/oem/2022_volkswagen_tiguan_4dr-suv_sel-r-line_fq_oem_1_1600.jpg",
      description:
          "Volkswagen, abbreviated as VW, is a German automobile manufacturer headquartered in Wolfsburg, Lower Saxony, Germany."),
  ManufacturerDetails(
      manufacturer: "Mercedes-Benz",
      image:
          "https://media.ed.edmunds-media.com/mercedes-benz/c-class/2023/oem/2023_mercedes-benz_c-class_sedan_amg-c-43_fq_oem_1_1600.jpg",
      description:
          "Mercedes-Benz, commonly referred to as Mercedes and sometimes as Benz, is a German luxury and commercial vehicle automotive brand established in 1926. Mercedes-Benz AG is headquartered in Stuttgart, Baden-Württemberg, Germany."),
  ManufacturerDetails(
      manufacturer: 'Audi',
      image:
          "https://hips.hearstapps.com/hmg-prod/images/2023-audi-sq5-ultra-blue-metallic-111-64b0459272050.jpg",
      description:
          "Audi AG is a German automotive manufacturer of luxury vehicles headquartered in Ingolstadt, Bavaria, Germany. As a subsidiary of its parent company, the Volkswagen Group, Audi produces vehicles in nine production facilities worldwide."),
  ManufacturerDetails(
      manufacturer: 'Hyundai',
      image:
          "https://www.hyundaicanada.com/-/media/hyundai/feature/hockeysuv/hockeysuvshowcase/suvmodels/2023/2023_kona_1225x690.png",
      description:
          "Hyundai Motor Company, often abbreviated to Hyundai Motors and commonly known as Hyundai, is a South Korean multinational automotive manufacturer headquartered in Seoul, South Korea, and founded in 1967.")
];
