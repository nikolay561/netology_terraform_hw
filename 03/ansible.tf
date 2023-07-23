resource "local_file" "hosts" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
       webservers =  yandex_compute_instance.web
       databases = yandex_compute_instance.vm
       storage = [yandex_compute_instance.storage]
    }
  )
  filename = "${abspath(path.module)}/hosts"
}
