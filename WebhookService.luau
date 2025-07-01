--[[
WebhookService 0.0.1

This module was written so that you can easily send messages to discord webhooks through your games.
The project is completely open source :)

]]

local wservice = {}

-->> Services <<--

local http = game:GetService("HttpService")

-->> Tables <<--

local config = {
	["Proxy"] = "",
	
	["Webhooks"] = {
		["Test"] = "webhook_url"
	}
}

-->> Functions <<--

function wservice:sendContent(webhook_name: string, message: string)
	
	if config.Webhooks[webhook_name] then
		local webhook_url = config.Webhooks[webhook_name]
		local new_webhook_url = string.gsub(webhook_url, "https://discord.com", config.Proxy)
		
		local data = {
			["content"] = message
		}

		local newdata = http:JSONEncode(data)

		local req = http:PostAsync(new_webhook_url, newdata, Enum.HttpContentType.ApplicationJson)
	else
		return false
	end
	
end

function wservice:sendEmbed(webhook_name: string, content: string, title: string, description: string, color: "HTML Color Code", ...)
	local args = {http:JSONDecode(...)}
	
	if config.Webhooks[webhook_name] then
		local webhook_url = config.Webhooks[webhook_name]
		local new_webhook_url = string.gsub(webhook_url, "https://discord.com", config.Proxy)

		local data = {
			["content"] = content,
			["embeds"] = {{
				["title"] = title,
				["description"] = description,
				["type"] = "rich",
				["color"] = tonumber(color),
			}}
		}
		
		if #args > 0 then
			for i,v in pairs(args[1]) do
				print(i,v)
				data.embeds[1][i] = v
			end
		end
		
		local newdata = http:JSONEncode(data)
		
		local req = http:PostAsync(new_webhook_url, newdata, Enum.HttpContentType.ApplicationJson)
		
	else
		return false
	end
end

return wservice
