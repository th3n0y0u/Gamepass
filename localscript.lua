local MarketplaceService = game:GetService("MarketplaceService")

local gamepassId = 17684371

local function promptPurchase()
	
	local player = game.Players.LocalPlayer
	local hasPass = false
	
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamepassId)
	end)
	
	if hasPass == true then
		print("Player has gamepass")
	else
		MarketplaceService:PromptGamePassPurchase(player, gamepassId)
	end
end

wait(1)
script.Parent.MouseButton1Down:Connect(promptPurchase)
