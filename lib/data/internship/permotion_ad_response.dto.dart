/*
    This is the DTO of Promotion Advertise ADD data , which we will get from server and show 
    inbetween the list of internship.
*/
class PromotionAdResponseDTO {
  int id;
  String? title;
  String? description;
  String? link;
  PromotionAdResponseDTO(
      {required this.id, this.title, this.description, this.link});
}
