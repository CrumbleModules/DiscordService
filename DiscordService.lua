--[[
																																							DISCORDSERVICE
																																				DiscordService is used to send
																																		messages through a Discord webhook
																																								with ease :D
																																								
																																								
																																				CREATED BY EXYRUS AND MATAN!
]]



local module = {}


-- Returns a Roblox-Discord compatible webhook. Credits to hooks.hyra.io.
function module.Convert(webhook : string)
	if string.find(webhook, "https://discord.com") or string.find(webhook, "http://discord.com") then
		webhook = webhook:gsub("discord.com", "hooks.hyra.io")
	elseif string.find(webhook, "https://ptb.discord.com") or string.find(webhook, "http://ptb.discord.com") then
		webhook = webhook:gsub("ptb.discord.com", "hooks.hyra.io")
	elseif string.find(webhook, "https://canary.discord.com") or string.find(webhook, "http://canary.discord.com") then
		webhook = webhook:gsub("canary.discord.com", "hooks.hyra.io")
	end
	return webhook
end

-- Will send a webhook request with the given webhook URL, content and name of the webhook (not required). Make sure to run Convert() on your URL first, or this will not work. Returns a boolean.
function module.CreateMessage(webhook : string, content : string, name : string?, avatar_url : string?, tts : boolean?)
	local http = game:GetService("HttpService")
	local data = http:JSONEncode({
		['content'] = content,
		['username'] = name,
		['avatar_url'] = avatar_url,
		['tts'] = tts
	})
	local success, err = pcall(function()
		http:PostAsync(webhook, data)
	end)
	if success and not err then
		return true
	elseif err then
		return false
	end
end

-- Will create a Discord embed using the given parameters, and sends it to the webhook URL. Make sure to run Convert() on your URL first, or this will not work. Returns a boolean.
function module.CreateEmbed(webhook: string, username: string?, avatar_url: string?, image_url: string?, title: string?, message: string?)
	local http = game:GetService("HttpService")
	local data = http:JSONEncode({
		['content'] = "",
		['username'] = username,
		['avatar_url'] = avatar_url,
		['embeds'] = {{
			["image"] = {["url"] = image_url},
			['title'] = "**"..title.."**",
			['description'] = message,
			['type'] = "rich",
			["color"] = tonumber(0xffffff)
		}}
	})
	local success, err = pcall(function()
		http:PostAsync(webhook, data)
	end)
	if success and not err then
		return true
	elseif err then
		return false
	end
end

return module
