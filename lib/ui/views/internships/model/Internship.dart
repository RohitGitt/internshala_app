import 'package:internshala/data/internship/internship_data_response.dto.dart';
import 'package:internshala/data/internship/permotion_ad_response.dto.dart';
import 'package:internshala/data/internship/training_ad_response.dto.dart';

abstract class Internship {}

class InternshipData extends Internship {
  InternshipDTO? internships;
  InternshipData({this.internships});
}

class PromotionAdData extends Internship {
  PromotionAdResponseDTO? promotionAdData;
  PromotionAdData({this.promotionAdData});
}

class TrainingAdData extends Internship {
  TrainingAdResponseDTO? trainingAdData;
  TrainingAdData({this.trainingAdData});
}
