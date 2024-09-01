import 'dart:convert';

import 'package:internshala/core/api_constants.dart';
import 'package:internshala/data/internship/internship_data_response.dto.dart';
import 'package:internshala/data/internship/permotion_ad_response.dto.dart';
import 'package:internshala/data/internship/training_ad_response.dto.dart';
import 'package:internshala/services/api/api.dart';

class InternshipApiService extends Api {
  Future<InternshipDataResponseDTO?> getAllInternshipsData() async {
    return await client.get(ApiConstants.GET_ALL_INTERNSHIPS).then((response) {
      return InternshipDataResponseDTO.fromJson(jsonDecode(response.data));
    });
  }

  /* 
    Here we will make api call to get the permotion or sponsership data.
  */
  Future<PromotionAdResponseDTO?> getPrmotionData() async {
    // make api call to get data here.
    return PromotionAdResponseDTO(
        id: 1,
        title: "Advertisement UI",
        description:
            " Promotion Ads Data will be shown here");
  }

  /* 
    Here we will make api call to get the Training or Certificate data.
  */
  Future<TrainingAdResponseDTO?> getTrainingData() async {
    // make api call to get data here.
    return TrainingAdResponseDTO(
        id: 1,
        title: "Training or Certificate Advestisement UI ",
        description:
            " Here Training or Certificate Ads will be shown");
  }
}
