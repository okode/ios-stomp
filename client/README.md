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

    $ ios-sim launch build/sym/Release-iphonesimulator/StompClient.app --devicetypeid "com.apple.CoreSimulator.SimDeviceType.iPhone-4s, 8.1"

