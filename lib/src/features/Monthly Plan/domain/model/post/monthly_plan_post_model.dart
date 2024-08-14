class CreateMonthlyPlanPostModel {
    final String planStartDate;
    final String planEndDate;
    final List<DailyPlanPostModel> dailyPlans;

    CreateMonthlyPlanPostModel({
        required this.planStartDate,
        required this.planEndDate,
        required this.dailyPlans,
    });

    Map<String, dynamic> toJson() {
        return {
            'planStartDate': planStartDate,
            'planEndDate': planEndDate,
            'dailyPlans': dailyPlans.map((dailyPlan) => dailyPlan.toJson()).toList(),
        };
    }
}

class DailyPlanPostModel {
    final String createdDate;
    final List<int> farmIds;
    final double approxKms;

    DailyPlanPostModel({
        required this.createdDate,
        required this.farmIds,
        required this.approxKms,
    });

    Map<String, dynamic> toJson() {
        return {
            'createdDate': createdDate,
            'farmIds': farmIds,
            'approxKms': approxKms,
        };
    }
}