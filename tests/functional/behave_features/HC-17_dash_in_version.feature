Feature: Report only submission
    Partners, redhat and community users can publish their chart by submitting
    error-free report that was generated by chart-verifier.

    Scenario Outline: [HC-17-001] A partner or redhat associate submits report only with dash in chart version
        Given the vendor "<vendor>" has a valid identity as "<vendor_type>"
        And an error-free report is used in "<report_path>"
        When the user sends a pull request with the report
        Then the user sees the pull request is merged
        And the index.yaml file is updated with an entry for the submitted chart

        @partners @full
        Examples:
            | vendor_type  | vendor    | report_path                                          |
            | partners     | redhat    | tests/data/HC-17/dash-in-version/partner/report.yaml |
        
        @redhat @full
        Examples:
            | vendor_type  | vendor    | report_path                                          |
            | redhat       | redhat    | tests/data/HC-17/dash-in-version/redhat/report.yaml  |

