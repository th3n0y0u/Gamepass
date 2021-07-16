local MarketplaceService = game:GetService("MarketplaceService")

local gamepassId = 17684371

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, purchasePassID, purchaseSuccess)

	if purchaseSuccess == true and purchasePassID == gamepassId then
		print("bought gamepass")
		player:Kick("Congrats! You have been banned!")
	end
end)

game.Players.PlayerAdded:Connect(function(player)
	local hasPass = false
	
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamepassId)
	end)
	
	if hasPass == true then
		print("bought gamepass")
		player:Kick("I thought you wanted to ban yourself? Note: Please delete the gamepass if you want to unban yourself.")
	end
end)
