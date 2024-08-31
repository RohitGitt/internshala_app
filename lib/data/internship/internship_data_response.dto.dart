
class InternshipDataResponseDTO {
  List<InternshipDTO>? internships;
  InternshipDataResponseDTO({this.internships});

  factory InternshipDataResponseDTO.fromJson(Map<String , dynamic> json){
    return InternshipDataResponseDTO(
      internships: (json['internships_meta'] as Map<String, dynamic>?)?.map(
        (k, v) => MapEntry(k, InternshipDTO.fromJson(v)),
      ).values.toList()
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "internships_meta":internships?.map((v) => v.toJson())
    };
  }
}


class InternshipDTO {
  final int? id;
  final String? title;
  final String? employmentType;
  final ApplicationStatusMessage? applicationStatusMessage;
  final String? jobTitle;
  final bool? workFromHome;
  final String? segment;
  final String? segmentLabelValue;
  final String? internshipTypeLabelValue;
  final List<String>? jobSegments;
  final String? companyName;
  final String? companyUrl;
  final bool? isPremium;
  final bool? isPremiumInternship;
  final String? employerName;
  final String? companyLogo;
  final String? type;
  final String? url;
  final int? isInternchallenge;
  final bool? isExternal;
  final bool? isActive;
  final String? expiresAt;
  final String? closedAt;
  final String? profileName;
  final bool? partTime;
  final String? startDate;
  final String? duration;
  final Stipend? stipend;
  final String? salary;
  final String? jobExperience;
  final String? experience;
  final String? postedOn;
  final int? postedOnDateTime;
  final String? applicationDeadline;
  final String? expiringIn;
  final String? postedByLabel;
  final String? postedByLabelType;
  final List<String>? locationNames;
  final List<Location>? locations;
  final String? startDateComparisonFormat;
  final String? startDate1;
  final String? startDate2;
  final bool? isPpo;
  final bool? isPpoSalaryDisclosed;
  final String? ppoSalary;
  final String? ppoSalary2;
  final String? ppoLabelValue;
  final bool? toShowExtraLabel;
  final String? extraLabelValue;
  final bool? isExtraLabelBlack;
  final List<String>? campaignNames;
  final String? campaignName;
  final bool? toShowInSearch;
  final String? campaignUrl;
  final int? campaignStartDateTime;
  final int? campaignLaunchDateTime;
  final int? campaignEarlyAccessStartDateTime;
  final int? campaignEndDateTime;
  final List<Label>? labels;
  final String? labelsApp;
  final List<String>? labelsAppInCard;
  final bool? isCovidWfhSelected;
  final bool? toShowCardMessage;
  final String? message;
  final bool? isApplicationCappingEnabled;
  final String? applicationCappingMessage;
  final List<dynamic>? overrideMetaDetails;
  final bool? eligibleForEasyApply;
  final bool? eligibleForB2bApplyNow;
  final bool? toShowB2bLabel;
  final bool? isInternationalJob;
  final bool? toShowCoverLetter;
  final String? officeDays;

  InternshipDTO({
    this.id,
    this.title,
    this.employmentType,
    this.applicationStatusMessage,
    this.jobTitle,
    this.workFromHome,
    this.segment,
    this.segmentLabelValue,
    this.internshipTypeLabelValue,
    this.jobSegments,
    this.companyName,
    this.companyUrl,
    this.isPremium,
    this.isPremiumInternship,
    this.employerName,
    this.companyLogo,
    this.type,
    this.url,
    this.isInternchallenge,
    this.isExternal,
    this.isActive,
    this.expiresAt,
    this.closedAt,
    this.profileName,
    this.partTime,
    this.startDate,
    this.duration,
    this.stipend,
    this.salary,
    this.jobExperience,
    this.experience,
    this.postedOn,
    this.postedOnDateTime,
    this.applicationDeadline,
    this.expiringIn,
    this.postedByLabel,
    this.postedByLabelType,
    this.locationNames,
    this.locations,
    this.startDateComparisonFormat,
    this.startDate1,
    this.startDate2,
    this.isPpo,
    this.isPpoSalaryDisclosed,
    this.ppoSalary,
    this.ppoSalary2,
    this.ppoLabelValue,
    this.toShowExtraLabel,
    this.extraLabelValue,
    this.isExtraLabelBlack,
    this.campaignNames,
    this.campaignName,
    this.toShowInSearch,
    this.campaignUrl,
    this.campaignStartDateTime,
    this.campaignLaunchDateTime,
    this.campaignEarlyAccessStartDateTime,
    this.campaignEndDateTime,
    this.labels,
    this.labelsApp,
    this.labelsAppInCard,
    this.isCovidWfhSelected,
    this.toShowCardMessage,
    this.message,
    this.isApplicationCappingEnabled,
    this.applicationCappingMessage,
    this.overrideMetaDetails,
    this.eligibleForEasyApply,
    this.eligibleForB2bApplyNow,
    this.toShowB2bLabel,
    this.isInternationalJob,
    this.toShowCoverLetter,
    this.officeDays,
  });

  factory InternshipDTO.fromJson(Map<String, dynamic> json) {
    return InternshipDTO(
      id: json['id'] as int?,
      title: json['title'] as String?,
      employmentType: json['employment_type'] as String?,
      applicationStatusMessage: json['application_status_message'] != null
          ? ApplicationStatusMessage.fromJson(json['application_status_message'] as Map<String, dynamic>)
          : null,
      jobTitle: json['job_title'] as String?,
      workFromHome: json['work_from_home'] as bool?,
      segment: json['segment'] as String?,
      segmentLabelValue: json['segment_label_value'] as String?,
      internshipTypeLabelValue: json['internship_type_label_value'] as String?,
      jobSegments: (json['job_segments'] as List<dynamic>?)?.map((e) => e as String).toList(),
      companyName: json['company_name'] as String?,
      companyUrl: json['company_url'] as String?,
      isPremium: json['is_premium'] as bool?,
      isPremiumInternship: json['is_premium_internship'] as bool?,
      employerName: json['employer_name'] as String?,
      companyLogo: json['company_logo'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      isInternchallenge: json['is_internchallenge'] as int?,
      isExternal: json['is_external'] as bool?,
      isActive: json['is_active'] as bool?,
      expiresAt: json['expires_at'] as String?,
      closedAt: json['closed_at'] as String?,
      profileName: json['profile_name'] as String?,
      partTime: json['part_time'] as bool?,
      startDate: json['start_date'] as String?,
      duration: json['duration'] as String?,
      stipend: json['stipend'] != null ? Stipend.fromJson(json['stipend'] as Map<String, dynamic>) : null,
      salary: json['salary'] as String?,
      jobExperience: json['job_experience'] as String?,
      experience: json['experience'] as String?,
      postedOn: json['posted_on'] as String?,
      postedOnDateTime: json['postedOnDateTime'] as int?,
      applicationDeadline: json['application_deadline'] as String?,
      expiringIn: json['expiring_in'] as String?,
      postedByLabel: json['posted_by_label'] as String?,
      postedByLabelType: json['posted_by_label_type'] as String?,
      locationNames: (json['location_names'] as List<dynamic>?)?.map((e) => e as String).toList(),
      locations: (json['locations'] as List<dynamic>?)?.map((e) => Location.fromJson(e as Map<String, dynamic>)).toList(),
      startDateComparisonFormat: json['start_date_comparison_format'] as String?,
      startDate1: json['start_date1'] as String?,
      startDate2: json['start_date2'] as String?,
      isPpo: json['is_ppo'] as bool?,
      isPpoSalaryDisclosed: json['is_ppo_salary_disclosed'] as bool?,
      ppoSalary: json['ppo_salary'] as String?,
      ppoSalary2: json['ppo_salary2'] as String?,
      ppoLabelValue: json['ppo_label_value'] as String?,
      toShowExtraLabel: json['to_show_extra_label'] as bool?,
      extraLabelValue: json['extra_label_value'] as String?,
      isExtraLabelBlack: json['is_extra_label_black'] as bool?,
      campaignNames: (json['campaign_names'] as List<dynamic>?)?.map((e) => e as String).toList(),
      campaignName: json['campaign_name'] as String?,
      toShowInSearch: json['to_show_in_search'] as bool?,
      campaignUrl: json['campaign_url'] as String?,
      campaignStartDateTime: json['campaign_start_date_time'] as int?,
      campaignLaunchDateTime: json['campaign_launch_date_time'] as int?,
      campaignEarlyAccessStartDateTime: json['campaign_early_access_start_date_time'] as int?,
      campaignEndDateTime: json['campaign_end_date_time'] as int?,
      labels: (json['labels'] as List<dynamic>?)?.map((e) => Label.fromJson(e as Map<String, dynamic>)).toList(),
      labelsApp: json['labels_app'] as String?,
      labelsAppInCard: (json['labels_app_in_card'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isCovidWfhSelected: json['is_covid_wfh_selected'] as bool?,
      toShowCardMessage: json['to_show_card_message'] as bool?,
      message: json['message'] as String?,
      isApplicationCappingEnabled: json['is_application_capping_enabled'] as bool?,
      applicationCappingMessage: json['application_capping_message'] as String?,
      overrideMetaDetails: json['override_meta_details'] as List<dynamic>?,
      eligibleForEasyApply: json['eligible_for_easy_apply'] as bool?,
      eligibleForB2bApplyNow: json['eligible_for_b2b_apply_now'] as bool?,
      toShowB2bLabel: json['to_show_b2b_label'] as bool?,
      isInternationalJob: json['is_international_job'] as bool?,
      toShowCoverLetter: json['to_show_cover_letter'] as bool?,
      officeDays: json['office_days'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'employment_type': employmentType,
      'application_status_message': applicationStatusMessage?.toJson(),
      'job_title': jobTitle,
      'work_from_home': workFromHome,
      'segment': segment,
      'segment_label_value': segmentLabelValue,
      'internship_type_label_value': internshipTypeLabelValue,
      'job_segments': jobSegments,
      'company_name': companyName,
      'company_url': companyUrl,
      'is_premium': isPremium,
      'is_premium_internship': isPremiumInternship,
      'employer_name': employerName,
      'company_logo': companyLogo,
      'type': type,
      'url': url,
      'is_internchallenge': isInternchallenge,
      'is_external': isExternal,
      'is_active': isActive,
      'expires_at': expiresAt,
      'closed_at': closedAt,
      'profile_name': profileName,
      'part_time': partTime,
      'start_date': startDate,
      'duration': duration,
      'stipend': stipend?.toJson(),
      'salary': salary,
      'job_experience': jobExperience,
      'experience': experience,
      'posted_on': postedOn,
      'postedOnDateTime': postedOnDateTime,
      'application_deadline': applicationDeadline,
      'expiring_in': expiringIn,
      'posted_by_label': postedByLabel,
      'posted_by_label_type': postedByLabelType,
      'location_names': locationNames,
      'locations': locations?.map((loc) => loc.toJson()).toList(),
      'start_date_comparison_format': startDateComparisonFormat,
      'start_date1': startDate1,
      'start_date2': startDate2,
      'is_ppo': isPpo,
      'is_ppo_salary_disclosed': isPpoSalaryDisclosed,
      'ppo_salary': ppoSalary,
      'ppo_salary2': ppoSalary2,
      'ppo_label_value': ppoLabelValue,
      'to_show_extra_label': toShowExtraLabel,
      'extra_label_value': extraLabelValue,
      'is_extra_label_black': isExtraLabelBlack,
      'campaign_names': campaignNames,
      'campaign_name': campaignName,
      'to_show_in_search': toShowInSearch,
      'campaign_url': campaignUrl,
      'campaign_start_date_time': campaignStartDateTime,
      'campaign_launch_date_time': campaignLaunchDateTime,
      'campaign_early_access_start_date_time': campaignEarlyAccessStartDateTime,
      'campaign_end_date_time': campaignEndDateTime,
      'labels': labels?.map((label) => label.toJson()).toList(),
      'labels_app': labelsApp,
      'labels_app_in_card': labelsAppInCard,
      'is_covid_wfh_selected': isCovidWfhSelected,
      'to_show_card_message': toShowCardMessage,
      'message': message,
      'is_application_capping_enabled': isApplicationCappingEnabled,
      'application_capping_message': applicationCappingMessage,
      'override_meta_details': overrideMetaDetails,
      'eligible_for_easy_apply': eligibleForEasyApply,
      'eligible_for_b2b_apply_now': eligibleForB2bApplyNow,
      'to_show_b2b_label': toShowB2bLabel,
      'is_international_job': isInternationalJob,
      'to_show_cover_letter': toShowCoverLetter,
      'office_days': officeDays,
    };
  }
}

class ApplicationStatusMessage {
  final bool? toShow;
  final String? message;
  final String? type;

  ApplicationStatusMessage({
    this.toShow,
    this.message,
    this.type,
  });

  factory ApplicationStatusMessage.fromJson(Map<String, dynamic> json) {
    return ApplicationStatusMessage(
      toShow: json['to_show'] as bool?,
      message: json['message'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'to_show': toShow,
      'message': message,
      'type': type,
    };
  }
}

class Stipend {
  final String? salary;
  final String? tooltip;
  final int? salaryValue1;
  final int? salaryValue2;
  final String? salaryType;
  final String? currency;
  final String? scale;
  final bool? largeStipendText;

  Stipend({
    this.salary,
    this.tooltip,
    this.salaryValue1,
    this.salaryValue2,
    this.salaryType,
    this.currency,
    this.scale,
    this.largeStipendText,
  });

  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      salary: json['salary'] as String?,
      tooltip: json['tooltip'] as String?,
      salaryValue1: json['salaryValue1'] as int?,
      salaryValue2: json['salaryValue2'] as int?,
      salaryType: json['salaryType'] as String?,
      currency: json['currency'] as String?,
      scale: json['scale'] as String?,
      largeStipendText: json['large_stipend_text'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'salary': salary,
      'tooltip': tooltip,
      'salaryValue1': salaryValue1,
      'salaryValue2': salaryValue2,
      'salaryType': salaryType,
      'currency': currency,
      'scale': scale,
      'large_stipend_text': largeStipendText,
    };
  }
}

class Location {
  final String? string;
  final String? link;
  final String? country;
  final String? region;
  final String? locationName;

  Location({
    this.string,
    this.link,
    this.country,
    this.region,
    this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      string: json['string'] as String?,
      link: json['link'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      locationName: json['locationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'string': string,
      'link': link,
      'country': country,
      'region': region,
      'location_name': locationName,
    };
  }
}

class Label {
  final List<String>? labelValue;
  final List<String>? labelMobile;
  final List<String>? labelApp;
  final List<String>? labelsAppInCard;

  Label({
    this.labelValue,
    this.labelMobile,
    this.labelApp,
    this.labelsAppInCard,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      labelValue: (json['label_value'] as List<dynamic>?)?.map((item) => item as String).toList(),
      labelMobile: (json['label_mobile'] as List<dynamic>?)?.map((item) => item as String).toList(),
      labelApp: (json['label_app'] as List<dynamic>?)?.map((item) => item as String).toList(),
      labelsAppInCard: (json['labels_app_in_card'] as List<dynamic>?)?.map((item) => item as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label_value': labelValue,
      'label_mobile': labelMobile,
      'label_app': labelApp,
      'labels_app_in_card': labelsAppInCard,
    };
  }
}

