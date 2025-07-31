terraform {
  required_providers {
    hashicups = {
      source = "hashicorp.com/edu/hashicups"
    }
  }
  required_version = ">= 1.1.0"
}

provider "hashicups" {
  username = "education"
  password = "test123"
  host     = "http://localhost:19090"
}

// hashicups_order 拆分成两部分理解：
// hashicups 表示该资源隶属哪个 provider，order 表示资源真正代表的对象，即订单；二者共同组成 typeName
resource "hashicups_order" "edu" {
  items = [{
    coffee = {
      id = 3
    }
    quantity = 2
    },
    {
      coffee = {
        id = 2
      }
      quantity = 3
  }]
}

output "edu_order" {
  value = hashicups_order.edu
}
