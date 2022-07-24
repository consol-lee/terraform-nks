terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

provider "ncloud" {
  access_key  = var.access_key
  secret_key  = var.secret_key
  region      = var.region
  site        = var.site
  support_vpc = var.support_vpc
}

data "ncloud_nks_kube_config" "kc"{
  cluster_uuid = ncloud_nks_cluster.cluster.uuid
}

provider "kubernetes" {
  host                   = "${data.ncloud_nks_kube_config.kc.host}"
  cluster_ca_certificate       = "${base64decode(data.ncloud_nks_kube_config.kc.cluster_ca_certificate)}"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["token", "--clusterUuid",  ncloud_nks_cluster.cluster.uuid, "--region", var.ncloud_region]
    command     = "ncp-iam-authenticator"
  }
}