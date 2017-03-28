irb4004_loaded = false

irb4004_left = nil
irb4004_middle = nil
irb4004_right = nil

function add_irb4004(name, segments)
    if segments < 2 then
        error("The rail must have at least 2 segments")
    end

    if not irb4004_loaded then
        irb4004_left = loader:add_mesh(dir .. "/irb4004/visual/left.stl")
        irb4004_middle = loader:add_mesh(dir .. "/irb4004/visual/middle.stl")
        irb4004_right = loader:add_mesh(dir .. "/irb4004/visual/right.stl")

        irb4004_loaded = true
    end

    irb4004 = loader:add(name)

    left = loader:add(name .. " Left")
    left.visualisation:add_mesh(irb4004_left)
    irb4004:add_child(left)

    for i = 1, segments - 2 do
        segment = loader:add(name .. " Middle " .. i)
        segment:set_position(i * 1000, 0, 0)
        segment.visualisation:add_mesh(irb4004_middle)
        irb4004:add_child(segment)
    end

    right = loader:add(name .. " Right")
    right:set_position((segments - 1) * 1000, 0, 0)
    right.visualisation:add_mesh(irb4004_right)
    irb4004:add_child(right)

    return irb4004
end
