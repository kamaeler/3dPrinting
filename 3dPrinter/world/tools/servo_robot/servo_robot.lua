function add_servo_robot_scanner()
    scanner = loader:add_mesh(dir .. "/tools/servo_robot/visual/scanner.stl")
    scanner:set_position(-100,-100,0)
    scanner:set_orientation(0,0,math.pi/2)

    scanner_coll = loader:add_mesh(dir .. "/tools/servo_robot/collision/scanner.stl")
    scanner_coll:set_position(-100,-100,0)
    scanner_coll:set_orientation(0,0,math.pi/2)

    tool = loader:add_tool("Servo Robo Scanner")
    tool.visualisation:add_mesh(scanner)
    tool.collision:add_mesh(scanner_coll)

    tcp = loader:add("TCP")
    tcp.visualisation:add_mesh(axes)
    tcp:set_position(1.81,49.78,600.20)
    tcp:set_orientation_abb(0.9950,0.0046,-0.0983,0.0162)

    tool:add_child(tcp)
    tool:set_tcp(tcp)
    tool:set_end_part(loader:add("Null Nozzle"))

    return tool
end
