Using Apache Apollo as Message Broker
=====================================

Installing for OSX
------------------

    brew install apollo

Creating the broker
-------------------

    /usr/local/bin/apollo create /usr/local/var/apollo

Running the broker
------------------

    /usr/local/var/apollo/bin/apollo-broker run

The broker listens *any* protocol (included STOMP) on port 61613

Accessing the admin console
---------------------------

Open the following URL: http://127.0.0.1:61680

User: admin
Pass: password

Stopping the broker
-------------------

Press CTRL-C to stop the broker
