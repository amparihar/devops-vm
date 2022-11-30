aws_region="ohio"
aws_regions = {
    ohio = "us-east-2"
}

application="production-adc-inhouse-developed-website"
# server Name
name="APSIAP006"
# Windows_Server-2019-English-Full-SQL_2017_Standard-2022.09.14
ami="ami-0a935f6f9d2f747ff"
#  2 vcpu 8Gb RAM
instance_type="t3.xlarge"

tags = {
    "map-migrated" = "",
    "managed-by"   = "terraform",
    "repository"   = "",
    "contact"      = ""
    "application"  = ""
  }
