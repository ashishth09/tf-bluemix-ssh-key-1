##############################################################################
# IBM Cloud Provider
##############################################################################
# See the README for details on ways to supply these values
provider "ibmcloud" {
  softlayer_username           = "${var.softlayer_username}"
  softlayer_api_key = "${var.softlayer_api_key}"
}

##############################################################################
# IBM SSH Key: For connecting to VMs
##############################################################################
resource "ibmcloud_infra_ssh_key" "ssh_key" {
  label = "${var.key_label}"
  notes = "${var.key_note}"
  # Public key, so this is completely safe
  public_key = "${var.public_key}"
}

##############################################################################
# Variables
##############################################################################

# Required for the IBM Cloud provider
variable softlayer_username {
  type = "string"
  description = "The SL username"
}
# Required to target the correct SL account
variable softlayer_api_key {
  type = "string"
  description = "The SL API Key"
}

variable public_key {
  description = "Your public SSH key material."
}
variable key_label {
  description = "A label for the SSH key that gets created."
}
variable key_note {
  description = "A note for the SSH key that gets created."
}

##############################################################################
# Outputs
##############################################################################
output "ssh_key_id" {
  value = "${ibmcloud_infra_ssh_key.ssh_key.id}"
}
