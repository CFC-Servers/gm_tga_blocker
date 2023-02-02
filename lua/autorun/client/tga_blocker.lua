hook.Add( "CreateTeams", "BlockTGA", function()
    local success, err = pcall( function()
        local control = vgui.GetControlTable( "DPanel" )
        control.LoadTGAImage = function( _, imageName, strPath )
            local msg = "TGA image " .. imageName .. " blocked"
            if strPath then
                msg = msg .. " (from " .. strPath .. ")"
            end

            ErrorNoHaltWithStack( msg )
        end

        vgui.Register( "TGAImage", {}, "DPanel" )
    end )

    if not success then
        ErrorNoHalt( "Failed to block TGA Panel (this is a non-critical error): " .. err )
    end
end )
