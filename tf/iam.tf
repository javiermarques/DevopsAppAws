resource "aws_iam_user" "guest" {
  name = "guest"
}

resource "aws_iam_user_policy" "guest_ro" {
  name = "guest"
  user = "${aws_iam_user.guest.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "autoscaling-plans:DescribeScalingPlans",
                "autoscaling-plans:GetScalingPlanResourceForecastData",
                "autoscaling-plans:DescribeScalingPlanResources",
                "autoscaling:DescribeAutoScalingNotificationTypes",
                "autoscaling:DescribeLifecycleHookTypes",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeTerminationPolicyTypes",
                "autoscaling:DescribeScalingProcessTypes",
                "autoscaling:DescribePolicies",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeMetricCollectionTypes",
                "autoscaling:DescribeLoadBalancers",
                "autoscaling:DescribeLifecycleHooks",
                "autoscaling:DescribeAdjustmentTypes",
                "autoscaling:DescribeScalingActivities",
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAccountLimits",
                "autoscaling:DescribeScheduledActions",
                "autoscaling:DescribeLoadBalancerTargetGroups",
                "autoscaling:DescribeNotificationConfigurations"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
