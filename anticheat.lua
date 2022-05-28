local ModeratorsList = {"qa", "Roblox"};
-- imagine if a moderator got moderated
local PlayerWarnings = {
	["qa"] = {
		["HighVelocity"] = 0
	}
}
local Anticheat = {
	["MagnitudeAnticheat"] = function(PunishmentTable)

		game:GetService("Players").PlayerAdded:Connect(function(player)
			player.CharacterAdded:Connect(function()
				local character = player.Character or player.CharacterAdded:wait();
				if (character) then

					game:GetService("RunService").Heartbeat:connect(function() -- no performance issues?
						local creeper_chaos, best_game_ever = pcall(function() -- "setting my character's parent to nil should disable anticheat!!11!" 🤓
							for _, mod in pairs(ModeratorsList) do
								if (player.Name == mod) then
									return;
								end
							end
							local last_position = character:WaitForChild("HumanoidRootPart").Position;
							local fr = wait(2); -- aka delta time, lower this number or make it higher depending of whatever you want
							local new_position = character:WaitForChild("HumanoidRootPart").Position;
							local onjad = ((last_position - new_position).Magnitude)/fr; -- best anticheat ever??!?! fr?!?! ong?!?!?
							if (onjad > (character:WaitForChild("Humanoid").Walkspeed + 0.5)) then
								character:WaitForChild("HumanoidRootPart").Position = last_position;
								character:WaitForChild("HumanoidRootPart").Anchored = true;
								wait(PunishmentTable["HighVelocity"]["AnchoredFor...time"]); character:WaitForChild("HumanoidRootPart").Anchored = false;
								print("punish.player.".. player.Name .. ".reason = HighVelocity")
								if (PunishmentTable["HighVelocity"]["EnableWarningSystem"]) then
									if not PlayerWarnings[player.Name] then PlayerWarnings[player.Name] = {}; end
									if not PlayerWarnings[player.Name]["HighVelocity"] then PlayerWarnings[player.Name]["HighVelocity"] = 1; else 
										PlayerWarnings[player.Name]["HighVelocity"] += 1; 
									end
									print("warnings.player.".. player.Name .. ".HighVelocity =".. tostring(PlayerWarnings[player.Name]["HighVelocity"]))
									if PlayerWarnings[player.Name]["HighVelocity"] >= PunishmentTable["HighVelocity"]["KickAfter...warns"] then
										print("Player ".. player.Name .. " has been kicked due to exceeding the maximum amount of warnings")
										player:Kick(PunishmentTable["HighVelocity"]["KickMessage"]);
									end
									coroutine.create(function() 
										wait(PunishmentTable["HighVelocity"]["RemoveWarningAfter...time"]);
										PlayerWarnings[player.Name]["HighVelocity"] -= 1;
									end)
								end
							end
						end)
					end)
				end 
			end)
		end)

	end
}

Anticheat["MagnitudeAnticheat"]({
	["HighVelocity"] = {
		["AnchoredFor...time"] = 2, 
		["EnableWarningSystem"] = true,
		["RemoveWarningAfter...time"] = 900, -- 15 minutes
		["KickAfter...warns"] = 6,
		["KickMessage"] = "You have been kicked for flying or walking at a high velocity, if you think this is an error report this to the discord server"
	}}
)
