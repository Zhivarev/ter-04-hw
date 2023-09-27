#output "yandex_vpc_network" {
#  value = yandex_vpc_network.develop.*.id
#}
#
#output "yandex_vpc_subnet" {
#  value = yandex_vpc_subnet.develop.*.network_id
#}

output "vpc_id" {
  value = yandex_vpc_network.net_name.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet_name.id
}
