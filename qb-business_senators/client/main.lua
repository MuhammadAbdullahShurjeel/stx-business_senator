local QBCore = exports["qb-core"]:GetCoreObject()


RegisterNetEvent("Open:GiveJob:Manu", function()
    local keyboard, id, job, grade = exports["nh-keyboard"]:Keyboard({
        header = "Business Senators (burgershot, catcafe, pizza, beanmachine)", 
        rows = {"Id", "Job", "Grade"}
    })

    if keyboard then
        if id and job and grade then
            TriggerServerEvent("Give:Business:Job", id, job, grade)
        end
    end

end)

-- Target

Citizen.CreateThread(function()

exports['qb-target']:AddCircleZone("senator-menu", vector3(-551.19, -201.74, 38.23), 0.8, { -- The name has to be unique, the coords a vector3 as shown and the 1.5 is the radius which has to be a float value
  name = "senator-menu", -- This is the name of the zone recognized by PolyZone, this has to be unique so it doesn't mess up with other zones
  debugPoly = false, -- This is for enabling/disabling the drawing of the box, it accepts only a boolean value (true or false), when true it will draw the polyzone in green
    }, {
        options = { -- This is your options table, in this table all the options will be specified for the target to accept
        { -- This is the first table with options, you can make as many options inside the options table as you want
            type = "client", -- This specifies the type of event the target has to trigger on click, this can be "client", "server", "command" or "qbcommand", this is OPTIONAL and will only work if the event is also specified
            event = "Open:GiveJob:Manu", -- This is the event it will trigger on click, this can be a client event, server event, command or qbcore registered command, NOTICE: Normal command can't have arguments passed through, QBCore registered ones can have arguments passed through
            label = 'Open Senator Menu', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
            targeticon = 'fa-solid fa-chess-king', -- This is the icon of the target itself, the icon changes to this when it turns blue on this specific option, this is OPTIONAL
        },
    },
  distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
})


end)

