## Synopsis

This sample application demonstrates the core functionality of the **Commercial Break SDK for Corona**. (Abbreviated as "Combre")
## Quickstart

Include the plugin in your settings file: 

~~~lua
plugins =
    {
        ["plugin.combre"] =
        {
            publisherId = "com.appsaholic",
            supportedPlatforms = { iphone=true, android=true }
        }
    }
    
~~~

Create a "combre" object for use in your project

~~~lua
local combre = require "plugin.combre"
~~~~

Remember to init by linking to your Commercial Break API Key

~~~lua
combre.init("your_api_key")
~~~

For more information on obtaining an *API_KEY*, please visit the [Appsaholic Documentation](docs.appsaholic.com).

## Code Example

Starting a Commercial Break is simple 

~~~lua
combre.showVideoAd(numVideos, showCloseButton, showCountdownScreen)
~~~



## Motivation

Using Commercial Break with Corona is easier than ever now that Corona is part of the Perk family of companies. This simple sample app shows how easy it is to start showing high quality brand video ads users will love.

## Installation

1. Install Corona Simulator 
2. Download/clone this repo 
3. Open it in corona simulator
4. Press "Build"

##API Reference

Full documentation for the Commercial Break SDK can be found in the comprehensive [Appsaholic Documentation](http://docs.appsaholic.com/).

##Contributors

For comments or suggestions, please [email us](mailto:help@appsaholic.com).
Made with Love in Austin, Bangalore, and Palo Alto.
