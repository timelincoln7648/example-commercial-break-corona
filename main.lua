local combre = require "plugin.combre"
local widget = require "widget"
display.setStatusBar(display.HiddenStatusBar)

local COMBRE_APP_KEY = "9bbb35dc05c501ef179bcf74c8790dfb421f60e8"
local hasInitialized = false
local showCloseButton = "true"
local showCountdownScreen = "true"

local defaultFontSize = 12
local defaultFill = {default = {0.5, 0.5, 0.5, 0.8}, over = {0.5, 0.5, 0.5, 1}}
local defaultLabelColor = {default = {0, 0, 0, 1}, over = {0, 0, 0, 1}}

local messageText = display.newText({
    text = "Message",
    fontSize = defaultFontSize - 2,
    align = "right",
    x = display.contentWidth / 2,
    y = 50,
    width = display.contentWidth - 100
});

local function combreListener(event)
    if (event.phase == 'init') then
        hasInitialized = true
        messageText.text = "Combre initialized successfully"
    elseif (event.phase == 'available') then
        messageText.text = "Combre Available:" .. tostring(event.available)
    elseif (event.phase == 'complete') then
        messageText.text = "Completed. Max:" .. tostring(event.max_ads)
            .. " Success:" .. tostring(event.success_ads)
    elseif (event.phase == 'adblock') then
        messageText.text = "Ad Block exists:" .. tostring(event.available)
    elseif (event.phase == 'precache') then
        messageText.text = "Combre pre caching is set"
    end
end

combre.setEventListener(combreListener);
combre.init(COMBRE_APP_KEY)

--
-- Callback for Play N Videos buttons defined below
--
local function onCombreButton(event)
    local numVideos = "2"
    if (hasInitialized == true) then
        local label = event.target:getLabel()
        local tmp = string.match(label, "%d+")
        if (tmp) then
            numVideos = tostring(tmp)
        end
        combre.showVideoAd(numVideos, showCloseButton, showCountdownScreen)
    else
        messageText.text = "sdk not initalized; no videos available"
    end
end

--
-- Buttons to play 1, 3 or 5 videos
--
local combreOneButton = widget.newButton({
    shape = "roundedRect",
    x = display.contentWidth / 2,
    y = 150,
    label = "Play 1 Video",
    cornerRadius = 2,
    fillColor = defaultFill,
    labelColor = defaultLabelColor,
    onRelease = onCombreButton,
    fontSize = defaultFontSize,
    height = 25
})

local combreThreeButton = widget.newButton({
    shape = "roundedRect",
    x = display.contentWidth / 2,
    y = 180,
    label = "Play 3 Videos",
    cornerRadius = 2,
    fillColor = defaultFill,
    labelColor = defaultLabelColor,
    onRelease = onCombreButton,
    fontSize = defaultFontSize,
    height = 25
})

local combreFiveButton = widget.newButton({
    shape = "roundedRect",
    x = display.contentWidth / 2,
    y = 210,
    label = "Play 5 Videos",
    cornerRadius = 2,
    fillColor = defaultFill,
    labelColor = defaultLabelColor,
    onRelease = onCombreButton,
    fontSize = defaultFontSize,
    height = 25
})

--
-- Combre isAvailable button and callback
--
local function onAvailableButton()
    combre.isCommercialBreakAvailable()
end
local availabilityButton = widget.newButton({
    shape = "roundedRect",
    x = display.contentWidth / 2,
    y = display.contentHeight / 2 + 10,
    label = "Combre Availability",
    cornerRadius = 2,
    fillColor = defaultFill,
    labelColor = defaultLabelColor,
    onRelease = onAvailableButton,
    fontSize = defaultFontSize,
    height = 25
})


--
-- Buttons to toggle showing close button and countdown screen. Callbacks.
--
local function setCloseButtonText(button)
    if showCloseButton == "true" then
        button:setLabel("Hide Close Button")
    else
        button:setLabel("Show Close Button")
    end
end
local function onToggleCloseButton(event)
    if showCloseButton == "true" then
        showCloseButton = "false"
    else
        showCloseButton = "true"
    end

    setCloseButtonText(event.target)
end
local toggleCloseButton = widget.newButton({
    shape = "roundedRect",
    x = display.contentWidth / 2,
    y = display.contentHeight / 2 + 140,
    cornerRadius = 2,
    fillColor = defaultFill,
    labelColor = defaultLabelColor,
    onRelease = onToggleCloseButton,
    fontSize = defaultFontSize,
    height = 25
})
setCloseButtonText(toggleCloseButton)

local function setCountdownButtonText(button)
    if showCountdownScreen == "true" then
        button:setLabel("No Countdown")
    else
        button:setLabel("Show Countdown")
    end
end

local function onToggleCountdownButton(event)
    if showCountdownScreen == "true" then
        showCountdownScreen = "false"
    else
        showCountdownScreen = "true"
    end

    setCountdownButtonText(event.target)
end

local toggleCountdownButton = widget.newButton({
    shape = "roundedRect",
    x = display.contentWidth / 2,
    y = display.contentHeight / 2 + 170,
    cornerRadius = 2,
    fillColor = defaultFill,
    labelColor = defaultLabelColor,
    onRelease = onToggleCountdownButton,
    fontSize = defaultFontSize,
    height = 25
})
setCountdownButtonText(toggleCountdownButton)
