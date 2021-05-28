provider "google"{
    project = "gcp-terraform-315018"
    region = "us-central1"
}

resource "google_compute_disk" "default" {
  count = 3
  name  = "test-disk-${count.index}"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  image = "ubuntu-minimal-1604-lts"
  
  provisioner "local-exec"{
      command = "echo disk ${count.index}: ${self.self_link} >> disk_links.txt"
  }
}