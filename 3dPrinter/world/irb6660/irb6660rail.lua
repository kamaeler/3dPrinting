function add_6660()
    local robot = loader:add_robot("ABB IRB 6660")
    -- robot:set_position(-15.1,-7743.5,-321.8)
    -- robot:set_orientation(math.rad(0.311),math.rad(0.129),math.rad(89.114))

    robot:set_orientation(0, 0, 0)
    robot:set_position(0, 0, 0)

    rail = robot:add_prismatic("Rail")
    rail:set_limits(0, 2000)

    base = loader:add("Base")
    base:set_orientation(-math.pi/2, 0, math.pi/2)
    base.visualisation:add_mesh(loader:add_mesh(dir .. "/irb6660/visual/base.stl"))
    -- base.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb6660/collision/base.stl"))

    local joint_1 = robot:add_revolute("1")
    joint_1:set_limits(math.rad(-180), math.rad(180))
    joint_1.visualisation:add_mesh(loader:add_mesh(dir .. "/irb6660/visual/1.stl"))
    joint_1.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb6660/collision/1.stl"))

    link_2 = loader:add_mesh(dir .. "/irb6660/visual/2.stl")
    link_2:set_position(-300, 0, -814.5)
    link_2:set_orientation(math.pi/2, 0, math.pi/2)

    link_2_coll = loader:add_mesh(dir .. "/irb6660/collision/2.stl")
    link_2_coll:set_position(-300, 0, -814.5)
    link_2_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_2 = robot:add_revolute("2")
    joint_2:set_dh(-math.pi/2, 300, 0, 814.5)
    joint_2:set_limits(math.rad(-42), math.rad(85))
    joint_2:set_offset(-math.pi/2)
    joint_2.visualisation:add_mesh(axes)
    joint_2.visualisation:add_mesh(link_2)
    joint_2.collision:add_convex_mesh(link_2_coll)

    link_3 = loader:add_mesh(dir .. "/irb6660/visual/3.stl")
    link_3:set_position(-300, 0, -1514.5)
    link_3:set_orientation(math.pi/2, 0, math.pi/2)

    link_3_coll = loader:add_mesh(dir .. "/irb6660/collision/3.stl")
    link_3_coll:set_position(-300, 0, -1514.5)
    link_3_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_3 = robot:add_revolute("3")
    joint_3:set_dh(0, 700, 0, 0)
    joint_3:set_limits(math.rad(-20), math.rad(120))
    joint_3.visualisation:add_mesh(link_3)
    joint_3.collision:add_convex_mesh(link_3_coll)

    robot:get_joints():add_validator(function(q)
        return q[2] - q[3] < math.rad(70)
           and q[3] - q[2] < math.rad(70)
           and math.abs(q[3] + q[5]) < math.rad(360)
    end)

    joint_2:set_change_callback(function(value)
         joint_3:set_offset(-value)
         return value
    end)

    link_4 = loader:add_mesh(dir .. "/irb6660/visual/4.stl")
    link_4:set_position(-300, 0, -1794.5)
    link_4:set_orientation(math.pi/2, -math.pi/2, math.pi/2)

    link_4_coll = loader:add_mesh(dir .. "/irb6660/collision/4.stl")
    link_4_coll:set_position(-300, 0, -1794.5)
    link_4_coll:set_orientation(math.pi/2, -math.pi/2, math.pi/2)

    local joint_4 = robot:add_revolute("4")
    joint_4:set_dh(-math.pi/2, 280, 0, 0)
    joint_4:set_limits(math.rad(-300), math.rad(300))
    joint_4.visualisation:add_mesh(link_4)
    joint_4.collision:add_convex_mesh(link_4_coll)

    link_5 = loader:add_mesh(dir .. "/irb6660/visual/5.stl")
    link_5:set_position(-1193, 0, -1794.5)
    link_5:set_orientation(math.pi/2, 0, math.pi/2)

    link_5_coll = loader:add_mesh(dir .. "/irb6660/collision/5.stl")
    link_5_coll:set_position(-1193, 0, -1794.5)
    link_5_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_5 = robot:add_revolute("5")
    joint_5:set_dh(math.pi/2, 0, 0, 893)
    joint_5:set_limits(math.rad(-100), math.rad(100))
    joint_5.visualisation:add_mesh(link_5)
    joint_5.collision:add_convex_mesh(link_5_coll)

    link_6 = loader:add_mesh(dir .. "/irb6660/visual/6.stl")
    link_6:set_position(-1370 + 177, 0, -1794.5)
    link_6:set_orientation(0, -math.pi/2, 0)

    local joint_6 = robot:add_revolute("6")
    joint_6:set_dh(-math.pi/2, 0,  0, 0)
    joint_6:set_offset(math.pi)
    joint_6:set_limits(math.rad(-360), math.rad(360))
    joint_6.visualisation:add_mesh(link_6)
    -- joint_6.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb6660/collision/6.stl"))

    mount = loader:add("Mount")
    mount:set_position(0, 0, 200)

    scanner = loader:add_mesh(dir .. "/irb6660/visual/scanner.stl")
    scanner:set_position(-100,-100,0)
    scanner:set_orientation(0,0,math.pi/2)

    scanner_coll = loader:add_mesh(dir .. "/irb6660/collision/scanner.stl")
    scanner_coll:set_position(-100,-100,0)
    scanner_coll:set_orientation(0,0,math.pi/2)

    --tool = loader:add_tool("Tool")
    --tool.visualisation:add_mesh(scanner)
    --tool.collision:set_position(tool.collision:add_sphere(50), 0, 150, 0)
    --tool.collision:set_position(tool.collision:add_sphere(50), 0, 220, 0)

    --tool_coarse = loader:add("Tool Coarse")
    --tool_coarse.collision:add_mesh(scanner_coll)
    --tool_coarse.collision:set_moving()
    --tool_coarse.collision:set_granularity(true, false)

    --tool_fine = loader:add("Tool Fine")
    --tool_fine.collision:add_mesh(scanner_coll)
    --tool_fine.collision:set_moving()
    --tool_fine.collision:set_granularity(false, true)

    tcp = loader:add("TCP")
    tcp.visualisation:add_mesh(axes)
    tcp:set_position(400,0,800.0)
    tcp:set_orientation(math.pi,0,-math.pi/2)

    --tool:set_tcp(tcp)
    --tool:set_end_part(loader:add("Null Nozzle"))

    collision_pairs:add({
        joint_1, joint_2, joint_3, joint_4, joint_5, joint_6--, tool_fine, tool_coarse
    })

    -- Set up the robot kinematic chain.
    robot:add_child(rail)
    rail:add_child(base)
    base:add_child(joint_1)
    joint_1:add_child(joint_2)
    joint_2:add_child(joint_3)
    joint_3:add_child(joint_4)
    joint_4:add_child(joint_5)
    joint_5:add_child(joint_6)
    joint_6:add_child(mount)
    --mount:add_child(tool)
    mount:add_child(tcp)
    --tool:add_child(tool_coarse)
    --tool:add_child(tool_fine)
    robot:get_joints():set_base(base)
    robot:get_joints():set_tool(tool)
    robot:get_joints():set_tcp(tcp)

    -- Set up a joint set for just the arm
    arm = robot:add_joint_set("Arm")

    arm:add(joint_1)
    arm:add(joint_2)
    arm:add(joint_3)
    arm:add(joint_4)
    arm:add(joint_5)
    arm:add(joint_6)

    arm:set_base(base)
    arm:set_tcp(tcp)

    -- Pre-defined configurations
    home = robot:add_configuration("Home")
    home:set_joint(joint_1, math.pi/2)
    home:set_joint(joint_2, 0)
    home:set_joint(joint_3, 0)
    home:set_joint(joint_4, 0)
    home:set_joint(joint_5, 0)
    home:set_joint(joint_6, 0)
    robot:set_home(home)

    return robot
end
