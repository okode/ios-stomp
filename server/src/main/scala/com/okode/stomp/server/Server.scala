package com.okode.stomp.server

import org.fusesource.stomp.scomp.StompClient
import org.apache.activemq.apollo.stomp.StompFrame

object Server {

  def main(args: Array[String]) {
    val client = new StompClient
    client.connect("localhost", 61613, "admin", "password")
    0 to 100000 foreach((i:Int) => {
      val message = "Hello: " + i
      println(message)
      client.send(destination = "/topic/demo", text = message)
      Thread sleep 10
    })
    client.disconnect()
  }

}