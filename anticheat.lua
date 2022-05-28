game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        local character = player.Character or player.CharacterAdded:wait()
        if character then
            while wait() do -- while true do end is best script ever guys, believe me
                local creeper_chaos, best_game_ever = pcall(function() -- "setting my character's parent to nil should disable anticheat!!11!" 🤓
                    local last_position = character:WaitForChild("HumanoidRootPart").Position
                    local fr = wait(2)
                    local new_position = character:WaitForChild("HumanoidRootPart").Position
                    local onjad = ((last_position - new_position).Magnitude)/fr -- best anticheat ever??!?! fr?!?! ong?!?!?
                    if onjad > (character:FindFirstChildWhichIsA("Humanoid").Walkspeed + 0.5) then
                        -- he cheating in lego game :sob: im gana die :sob: :sob:
                    end
                end)
            end 
        end 
    end)
end)
