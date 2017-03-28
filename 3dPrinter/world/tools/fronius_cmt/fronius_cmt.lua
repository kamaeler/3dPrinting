function add_fronius_cmt()
    torch = loader:add_mesh(dir .. "/tools/fronius_cmt/visual/torch.stl")
    torch:set_position(-176.613,-5,-40)
    torch:set_orientation(math.pi/2,0,0)

    tool = loader:add_tool("Fronius CMT")
    tool.visualisation:add_mesh(torch)

    tool_coarse = loader:add("Tool Coarse")
    tool_coarse.collision:add_mesh(torch)
    tool_coarse.collision:set_moving()
    tool_coarse.collision:set_granularity(true, false)

    tool_fine = loader:add("Tool Fine")
    tool_fine.collision:add_mesh(torch)
    tool_fine.collision:set_moving()
    tool_fine.collision:set_granularity(false, true)

    shroud = loader:add_mesh(dir .. "/tools/fronius_cmt/visual/nozzle.stl")

    nozzle = loader:add("Nozzle")
    nozzle.visualisation:add_mesh(shroud)
    nozzle.collision:add_convex_mesh(shroud)

    tcp = loader:add("TCP")
    tcp.visualisation:add_mesh(axes)

    tool:set_tcp(tcp)
    tool:set_end_part(nozzle)

    tcp:set_position(4.0449, 1.997, 418.177)
    tcp:set_orientation(0, math.rad(45), math.rad(0))

    tool:add_child(tcp)
    tool:add_child(tool_fine)
    tool:add_child(tool_coarse)
    tcp:add_child(nozzle)

    return tool
end
