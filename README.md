# DiscordService: Easier Webhook Communication

Please make an issue if you find any bugs! It helps us immensely.

This doesn't really need documentation, but...

```DiscordService.Convert(webhook : string)```
Returns a Roblox-Discord compatible webhook. Credits to hooks.hyra.io.

```DiscordService.CreateMessage(webhook : string, content : string, name : string?, avatar_url : string?, tts : boolean?)```
Will send a webhook request with the given webhook URL, content and name of the webhook (not required). Make sure to run Convert() on your URL first, or this will not work. Returns a boolean.

```DiscordService.CreateEmbed(webhook: string, username: string?, avatar_url: string?, image_url: string?, title: string?, message: string?)```
Will create a Discord embed using the given parameters, and sends it to the webhook URL. Make sure to run Convert() on your URL first, or this will not work. Returns a boolean.
