You no longer need to struggle when sending messages to your webhooks over your roblox games. This module gives you a wide range of settings!

**Example usage code:**
```lua
local webhook_service = require(game.ServerScriptService.WebhookService)

-->> Content <<--

webhook_service:sendContent("Announcements", "Hi!")

-->> Embed <<--

local http = game:GetService("HttpService")

local data = {
	["fields"] = {
		{
			["name"] = "__Title__",
			["value"] = "hi",
			["inline"] = true
		},
		{
			["name"] = "__Title__",
			["value"] = "hi",
			["inline"] = true
		}
	}
}

local newdata = http:JSONEncode(data)

webhook_service:sendEmbed("Announcements", "@here", "__Title__", "__Description__", 0x55ff7f, newdata)

```

__The project is completely open source. You can modify it as you like and change it according to your usage :)__
