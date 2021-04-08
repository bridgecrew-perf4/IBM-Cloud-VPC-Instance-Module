terraform {
  required_providers {
    ibm = {
      source           = "IBM-Cloud/ibm"
      required_version = "< 1.23"
    }
  }
}
