class UpdateMonthlyPlanPostModel {
    final String monthlyPlanId;
    final List<DailyPlan> dailyPlans;

    UpdateMonthlyPlanPostModel({
        required this.monthlyPlanId,
        required this.dailyPlans,
    });

}

class DailyPlan {
    final DateTime createdDate;
    final double approxKms;
    final List<String> customerCodes;
    final int? dailyPlanId;

    DailyPlan({
        required this.createdDate,
        required this.approxKms,
        required this.customerCodes,
        this.dailyPlanId,
    });

}
