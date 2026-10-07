resource "local_file" "hello" {

  filename = "${path.module}/hello.txt"

  content  = "Hello, ${var.name}!"

}

 

output "greeting" {

  value = local_file.hello.content

}