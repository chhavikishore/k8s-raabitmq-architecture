# resource "rabbitmq_exchange" "test" {
#   name = "test"
#   settings{
#       type = "direct"
#   }
# }

resource "rabbitmq_exchange" "e1" {
  name = "e1"
  settings {
    type = "direct"
  }
}


resource "rabbitmq_exchange" "e2" {
  name = "e2"
  settings {
    type = "direct"
  }
}


resource "rabbitmq_queue" "q1" {
  name = "q1"
  settings {
    durable     = false
    auto_delete = true
  }
}


resource "rabbitmq_binding" "e1e2" {
  source           = "${rabbitmq_exchange.e1.name}"
  vhost            = "/"
  destination      = "${rabbitmq_exchange.e2.name}"
  destination_type = "exchange"
  routing_key      = "r1"
}

resource "rabbitmq_binding" "e2q1" {
  source           = "${rabbitmq_exchange.e2.name}"
  vhost            = "/"
  destination      = "${rabbitmq_queue.q1.name}"
  destination_type = "queue"
  routing_key      = "r1"
}




# resource "rabbitmq_binding" "" {

# }


