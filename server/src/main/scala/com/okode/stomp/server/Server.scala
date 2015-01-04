/**
 * Copyright 2015 Okode | www.okode.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.okode.stomp.server

import org.fusesource.stomp.scomp.StompClient
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component
import com.typesafe.scalalogging.Logger
import javax.annotation.PostConstruct
import org.springframework.beans.factory.annotation.Value

@Component
class Server {

  private val logger = Logger(LoggerFactory.getLogger(classOf[Server]))
  
  @Value("${stomp.host}")
  private val host: String = null
  
  @Value("${stomp.port}")
  private val port: Int = 0
  
  @Value("${stomp.user}")
  private val user: String = null
  
  @Value("${stomp.pass}")
  private val pass: String = null
  
  @Value("${stomp.topic}")
  private val topic: String = null
  
  @PostConstruct
  def init() {
    val client = new StompClient
    client.connect(host, port, user, pass)
    0 to 100000 foreach((i:Int) => {
      val message = s"Hello: $i"
      logger.info(message)
      client.send(destination = topic, text = message)
      Thread.sleep(10)
    })
    client.disconnect()
  }

}