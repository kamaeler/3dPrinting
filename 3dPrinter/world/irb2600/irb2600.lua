function add_2600()
    robot = loader:add_robot("ABB IRB 2600")

    base = loader:add("Base")
    base.visualisation:add_mesh(axes)
    base.visualisation:add_mesh(loader:add_mesh(dir .. "/irb2600/visual/base.stl"))
    base.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb2600/collision/base.stl"))

    link_1 = loader:add_mesh(dir .. "/irb2600/visual/1.stl")
    link_1:set_orientation(0, 0, 0)

    link_1_coll = loader:add_mesh(dir .. "/irb2600/collision/1.stl")
    link_1_coll:set_position(0, 0,0)

    local joint_1 = robot:add_revolute("1")
    joint_1:set_limits(math.rad(-180), math.rad(180))
    joint_1.visualisation:add_mesh(link_1)
    joint_1.visualisation:add_mesh(axes)
    joint_1.collision:add_convex_mesh(link_1_coll)

    link_2 = loader:add_mesh(dir .. "/irb2600/visual/2.stl")
    link_2:set_position(-150, 0, -445)
    link_2:set_orientation(math.pi/2, 0, math.pi/2)

    link_2_coll = loader:add_mesh(dir .. "/irb2600/collision/2.stl")
    link_2_coll:set_position(-150, 0, -445)
    link_2_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_2 = robot:add_revolute("2")
    joint_2:set_limits(math.rad(-95), math.rad(155))
    joint_2.visualisation:add_mesh(link_2)
    joint_2.visualisation:add_mesh(axes)
    joint_2:set_dh(-math.pi/2, 150, 0, 445)
    joint_2:set_offset(-math.pi/2)
    joint_2.collision:add_convex_mesh(link_2_coll)

    link_3 = loader:add_mesh(dir .. "/irb2600/visual/3.stl")
    link_3:set_position(-150, 0, -1335)
    link_3:set_orientation(math.pi/2, 0, math.pi/2)

    link_3_coll = loader:add_mesh(dir .. "/irb2600/collision/3.stl")
    link_3_coll:set_position(-150, 0, -1335)
    link_3_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_3 = robot:add_revolute("3")
    joint_3:set_limits(math.rad(-180), math.rad(75))
    joint_3:set_dh(0, 900, 0, 0)
    joint_3.visualisation:add_mesh(link_3)
    joint_3.visualisation:add_mesh(axes)
    joint_3.collision:add_convex_mesh(link_3_coll)

    link_4 = loader:add_mesh(dir .. "/irb2600/visual/4.stl")
    link_4:set_position(-150, 0, -1485)
    link_4:set_orientation(math.pi/2, -math.pi/2, math.pi/2)

    link_4_coll = loader:add_mesh(dir .. "/irb2600/collision/4.stl")
    link_4_coll:set_position(-150, 0, -1485)
    link_4_coll:set_orientation(math.pi/2, -math.pi/2, math.pi/2)

    local joint_4 = robot:add_revolute("4")
    joint_4:set_dh(-math.pi/2, 150, 0, 0)
    joint_4:set_limits(math.rad(-175), math.rad(175))
    joint_4.visualisation:add_mesh(link_4)
    joint_4.visualisation:add_mesh(axes)
    joint_4.collision:add_convex_mesh(link_4_coll)

    link_5 = loader:add_mesh(dir .. "/irb2600/visual/5.stl")
    link_5:set_position(-150-938, 0, -1485)
    link_5:set_orientation(math.pi/2, 0, math.pi/2)

    link_5_coll = loader:add_mesh(dir .. "/irb2600/collision/5.stl")
    link_5_coll:set_position(-150-938, 0, -1485)
    link_5_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_5 = robot:add_revolute("5")
    joint_5:set_dh(math.pi/2, 0, 0, 938)
    joint_5:set_limits(math.rad(-120), math.rad(120))
    joint_5.visualisation:add_mesh(axes)
    joint_5.visualisation:add_mesh(link_5)
    joint_5.collision:add_convex_mesh(link_5_coll)

    link_6 = loader:add_mesh(dir .. "/irb2600/visual/6.stl")
    link_6:set_position(-150-938, 0, -1485)
    link_6:set_orientation(0, -math.pi/2, 0)

    link_6_coll = loader:add_mesh(dir .. "/irb2600/collision/6.stl")
    link_6_coll:set_position(-150-938, 0, -1485)
    link_6_coll:set_orientation(0, -math.pi/2, 0)

    local joint_6 = robot:add_revolute("6")
    joint_6:set_dh(-math.pi/2, 0, 0, 0)
    joint_6:set_limits(math.rad(-400), math.rad(400))
    joint_6:set_offset(math.pi)
    joint_6.visualisation:add_mesh(link_6)
    joint_6.visualisation:add_mesh(axes)
    joint_6.collision:add_convex_mesh(link_6_coll)

    mount = loader:add("Mount")
    mount:set_position(0, 0, 200)

    -- Set up the robot kinematic chain.
    robot:add_child(base)
    base:add_child(joint_1)
    joint_1:add_child(joint_2)
    joint_2:add_child(joint_3)
    joint_3:add_child(joint_4)
    joint_4:add_child(joint_5)
    joint_5:add_child(joint_6)
    joint_6:add_child(mount)
    --mount:add_child(tool)
    --tool:add_child(tool_twist)
    --tool_twist:add_child(tool_coarse)
    --tool_twist:add_child(tool_fine)
    --tool_twist:add_child(tcp)
    --tcp:add_child(nozzle)

    robot:get_joints():set_base(base)
    --robot:get_joints():set_tool(tool)
    robot:get_joints():set_tcp(tcp)

    -- Pre-defined configurations
    home = robot:add_configuration("Home")
    home:set_joint(joint_1, 0)
    home:set_joint(joint_2, math.rad(-65))
    home:set_joint(joint_3, math.rad(75))
    home:set_joint(joint_4, 0)
    home:set_joint(joint_5, math.rad(35))
    home:set_joint(joint_6, 0)
    robot:set_home(home)

    --collision = robot:add_configuration("Collision")
    --collision:set_joint(joint_1, math.rad(10.2766))
    --collision:set_joint(joint_2, math.rad(-4.12977))
    --collision:set_joint(joint_3, math.rad(4.73283))
    --collision:set_joint(joint_4, math.rad(98.8811))
    --collision:set_joint(joint_5, math.rad(-41.04))
    --collision:set_joint(joint_6, math.rad(-70.1135))

    collision_pairs:add({
        base,
        joint_1,
        joint_2,
        joint_3,
        joint_4,
        joint_5,
        joint_6
        --        mount,
        --        tool_coarse,
        --        tool_fine,
        --        nozzle,
        --    tcp
    })

    collision_pairs:add_pair(base, joint_4)
    collision_pairs:add_pair(base, joint_5)
    collision_pairs:add_pair(base, joint_6)
    --collision_pairs:add_pair(base, tool_coarse)
    --collision_pairs:add_pair(base, tool_fine)
    --collision_pairs:add_pair(base, mount)
    --collision_pairs:add_pair(base, nozzle)

    collision_pairs:add_pair(joint_1, joint_4)
    collision_pairs:add_pair(joint_1, joint_5)
    collision_pairs:add_pair(joint_1, joint_6)
    --collision_pairs:add_pair(joint_1, tool_coarse)
    --collision_pairs:add_pair(joint_1, tool_fine)
    --collision_pairs:add_pair(joint_1, mount)
    --collision_pairs:add_pair(joint_1, nozzle)

    --collision_pairs:add_pair(joint_2, tool_coarse)
    --collision_pairs:add_pair(joint_2, tool_fine)
    --collision_pairs:add_pair(joint_2, mount)
    --collision_pairs:add_pair(joint_2, nozzle)

    return robot
end
