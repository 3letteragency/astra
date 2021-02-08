data "vultr_snapshot" "astra_node" {
  filter {
    name   = "description"
    values = ["astra-node-${var.astra_image_version}"]
  }
}

resource "vultr_instance" "astra_node" {
  count       = var.flight_count
  plan        = var.machine_type
  region      = var.region
  snapshot_id = data.vultr_snapshot.astra_node.id
  label       = "astra-flight-${count.index}"
  hostname    = "astra-flight-${count.index}"

  connection {
    type        = "ssh"
    user        = "root"
    host        = self.main_ip
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "ufw allow ssh",
      "ufw allow from ${data.http.c2_ip.body}/32 to any port 50000",
      "ufw allow from ${data.http.c2_ip.body}/32 to any port 50001",
      "ufw --force enable"
    ]
  }
}
