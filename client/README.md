StompClient - A simple iOS STOMP Client
=======================================

Requirements
------------

Ensure you have installed CocoaPods and iOS Sim (from Homebrew):

    $ sudo gem install cocoapods
    $ brew install ios-sim

If needed, update your CocoaPods and Homebrew installation:

    $ sudo gem update cocoapods
    $ brew update
    $ brew upgrade

Building
--------

    $ pod install
    $ ./gradlew build

Running
-------

    $ ios-sim launch build/sym/Release-iphonesimulator/StompClient.app --tall

Hacking
-------

StompClient depends on StompKit from the following repo:

    https://github.com/mobile-web-messaging/StompKit

but currently it's broken when parsing MESSAGE frames from Apache Apollo.
There's a fixed version in the following repo:

    https://github.com/dwsoto/StompKit

When the fixed version were merged into master please update the Podfile replacing:

    pod 'StompKit', :git => 'https://github.com/dwsoto/StompKit.git'

to

    pod 'StompKit', '~> 0.1.0'

