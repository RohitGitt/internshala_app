/*
    This is the DTO of  Training Advertisement data , which we will get from server and show 
    inbetween the list of internship.
*/

class TrainingAdResponseDTO {
  int id;
  String? title;
  String? description;
  String? link;
  TrainingAdResponseDTO(
      {required this.id, this.title, this.description, this.link});
}
