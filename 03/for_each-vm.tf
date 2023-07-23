resource "yandex_compute_instance" "vm" {

  depends_on = [ yandex_compute_instance.web ]

  for_each = { for i in var.vm_resources : i.vm_name => i }

  name        = each.value.vm_name
  platform_id = "standard-v3"
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id  = data.yandex_compute_image.ubuntu.image_id
      size      = each.value.disk
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }
}
