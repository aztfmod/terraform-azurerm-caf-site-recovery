locals {
    convention = "random"
    name = "caftest"
    location = "southeastasia"
    prefix = ""
    resource_groups = {
        test = { 
            name     = "test-caf"
            location = "southeastasia" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "CAF"
    }
    solution_plan_map = {
        NetworkMonitoring = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/NetworkMonitoring"
        },
    }

    asr_vault_name = "asr"

    asr_diags = {
        log_analytics_destination_type = "Dedicated"
        log = [
                    # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                    ["AzureBackupReport", true, true, 30],
                    ["CoreAzureBackup", true, true, 30],
                    ["AddonAzureBackupAlerts", true, true, 30],
                    ["AddonAzureBackupJobs", true, true, 30],
                    ["AddonAzureBackupPolicy", true, true, 30],
                    ["AddonAzureBackupProtectedInstance", true, true, 30],
                    ["AddonAzureBackupStorage", true, true, 30],
                    ["AzureSiteRecoveryJobs", true, true, 30],
                    ["AzureSiteRecoveryEvents", true, true, 30],
                    ["AzureSiteRecoveryReplicatedItems", true, true, 30],
                    ["AzureSiteRecoveryReplicationStats", true, true, 30],
                    ["AzureSiteRecoveryRecoveryPoints", true, true, 30],
                    ["AzureSiteRecoveryReplicationDataUploadRate", true, true, 30],
                    ["AzureSiteRecoveryProtectedDiskDataChurn", true, true, 30],
            ]
        metric = [
                #["AllMetrics", 60, True],
        ]
    }
}