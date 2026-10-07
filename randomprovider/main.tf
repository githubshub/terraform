resource "random_pet" "name" {}

resource "local_file" "hello" {}
    output "pet" {
        value = random_pet.name.id
}