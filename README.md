# Домашнее задание к занятию "`Продвинутые методы работы с Terraform`" - `Живарев Игорь`

### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.

------
## Ответ

Процес создание VM

![vm](img/ter-04_01.png)

Подключение к одной из VM по SSH

```
sudo nginx -t

```

![nginx](img/ter-04_02.png)


### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.
6. Сгенерируйте документацию к модулю с помощью terraform-docs.    
 
Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```
------
## Ответ


```
terraform console
>module.vpc

```

![modules](img/ter-04_03.png)


### Задание 3
1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.

------
## Ответ

```
terraform state list 

```

![state list](img/ter-04_04.png)

```
terraform state rm module.vpc 

```

![rm vpc](img/ter-04_05.png)

```
terraform state rm module.test-vm

```

![rm test-vm](img/ter-04_06.png)

```
terraform import module.vpc.yandex_vpc_network.net_name enp05m086394rdkv82rf

```

![import net](img/ter-04_07.png)

```
terraform import module.vpc.yandex_vpc_subnet.subnet_name e9bvoaef382ug0bgecb5 

```

![import subnet](img/ter-04_08.png)

```
terraform import 'module.test-vm.yandex_compute_instance.vm[0]' fhmijvgfs5viutjgrf6g

```

![bvgjhn inst-0](img/ter-04_09.png)

```
terraform import 'module.test-vm.yandex_compute_instance.vm[1]' fhmo3a8fm05f7hp3fkh2

```

![import inst-1](img/ter-04_10.png)


```
terraform plan 

```

![plan](img/ter-04_11.png)
