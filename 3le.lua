task.spawn(function()
    while true do
        local activateRemote = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemotePromise"):WaitForChild("Remotes"):FindFirstChild("C_ActivateObject")

        if activateRemote then
            local runtimeItems = game.Workspace:WaitForChild("RuntimeItems")

            for _, ammoContainer in pairs(runtimeItems:GetChildren()) do
                if ammoContainer:IsA("Model") and ammoContainer.Name == "ShotgunShells" then
                    local ammo = ammoContainer:FindFirstChild("ShotgunShells")
                    if ammo then
                        local targetPart = ammo:FindFirstChildWhichIsA("BasePart") or ammo

                        local args = { targetPart.Parent }
                        activateRemote:FireServer(unpack(args))
                    end
                end
            end
        end
        task.wait(0.5) -- Keeping your delay between activations
    end
end)
