function add_1410()
    local robot = loader:add_robot("ABB IRB 1410")
    robot:set_position(1243.3,629.2,-113.7)
    --robot:set_orientation(math.rad(-0.212),math.rad(0.193),math.rad(-89.468))
    robot:set_orientation(math.rad(0.1474),math.rad(0.1346),math.rad(-90.558))
    base = loader:add("Base")
    base.visualisation:add_mesh(loader:add_mesh(dir .. "/irb1410/visual/base.stl"))
    base.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb1410/collision/base_200.stl"))

    link_1 = loader:add_mesh(dir .. "/irb1410/visual/1.stl")
    link_1:set_position(0, 0, 181.5)

    link_1_coll = loader:add_mesh(dir .. "/irb1410/collision/1_200.stl")
    link_1_coll:set_position(0, 0, 181.5)

    local joint_1 = robot:add_revolute("1")
    joint_1:set_limits(math.rad(-170+5), math.rad(170-5))
    joint_1.visualisation:add_mesh(link_1)
    joint_1.collision:add_convex_mesh(link_1_coll)

    link_2 = loader:add_mesh(dir .. "/irb1410/visual/2.stl")
    link_2:set_position(0, 0, 0)
    link_2:set_orientation(math.pi/2, 0, math.pi/2)

    link_2_coll = loader:add_mesh(dir .. "/irb1410/collision/2_200.stl")
    link_2_coll:set_position(0, 0, 0)
    link_2_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_2 = robot:add_revolute("2")
    joint_2:set_limits(math.rad(-70+5), math.rad(70-5))
    joint_2.visualisation:add_mesh(link_2)
    joint_2:set_dh(-math.pi/2, 150, 0, 475)
    joint_2:set_offset(-math.pi/2)
    joint_2.collision:add_convex_mesh(link_2_coll)

    link_3 = loader:add_mesh(dir .. "/irb1410/visual/3.stl")
    link_3:set_position(0, 0, 120)
    link_3:set_orientation(math.pi/2, 0, math.pi/2)

    link_3_coll = loader:add_mesh(dir .. "/irb1410/collision/3_100.stl")
    link_3_coll:set_position(0, 0, 120)
    link_3_coll:set_orientation(math.pi/2, 0, math.pi/2)

    local joint_3 = robot:add_revolute("3")
    joint_3:set_limits(math.rad(-135+5), math.rad(140-5))
    joint_3:set_dh(0, 600, 0, 0)
    joint_3.visualisation:add_mesh(link_3)
    joint_3.collision:add_convex_mesh(link_3_coll)

    joint_2_1410 = joint_2
    joint_3_1410 = joint_3

    joint_2:set_change_callback(function(value)
        joint_3_1410:set_offset(-value)
        return value
    end)

    robot:get_joints():add_validator(function(q)
        return q[2] - q[3] < math.rad(65-5) and q[3] - q[2] < math.rad(70-5)
    end)

    link_4 = loader:add_mesh(dir .. "/irb1410/visual/4.stl")
    link_4:set_position(-248, 0, -1620)
    link_4:set_orientation(math.pi/2, -math.pi/2, math.pi/2)

    link_4_coll = loader:add_mesh(dir .. "/irb1410/collision/4_100.stl")
    link_4_coll:set_position(-248, 0, -1620)
    link_4_coll:set_orientation(math.pi/2, -math.pi/2, math.pi/2)

    local joint_4 = robot:add_revolute("4")
    joint_4:set_dh(-math.pi/2, 120, 0, 0)
    joint_4:set_limits(math.rad(-150+5), math.rad(150-5))
    joint_4.visualisation:add_mesh(link_4)
    joint_4.collision:add_convex_mesh(link_4_coll)

    link_5 = loader:add_mesh(dir .. "/irb1410/visual/5.stl")
    link_5:set_position(0, 0, 0)
    link_5:set_orientation(0, 0, math.pi/2)

    link_5_coll = loader:add_mesh(dir .. "/irb1410/collision/5_100.stl")
    link_5_coll:set_position(0, 0, 0)
    link_5_coll:set_orientation(0, 0, math.pi/2)

    local joint_5 = robot:add_revolute("5")
    joint_5:set_dh(math.pi/2, 0, 0, 805-86.5)
    joint_5:set_limits(math.rad(-115+20), math.rad(115-5))
    joint_5.visualisation:add_mesh(link_5)
    joint_5.collision:add_convex_mesh(link_5_coll)

    link_6 = loader:add_mesh(dir .. "/irb1410/visual/6.stl")
    link_6:set_position(73.5 + 6.5, 0, 0)
    link_6:set_orientation(0, -math.pi/2, math.pi)

    link_6_coll = loader:add_mesh(dir .. "/irb1410/collision/6.stl")
    link_6_coll:set_position(73.5 + 6.5, 0, 0)
    link_6_coll:set_orientation(0, -math.pi/2, math.pi)

    local joint_6 = robot:add_revolute("6")
    joint_6:set_dh(-math.pi/2, 0, 0, 0)
    joint_6:set_limits(math.rad(-300+5), math.rad(300-5))
    joint_6:set_offset(math.pi)
    joint_6.visualisation:add_mesh(link_6)
    joint_6.collision:add_convex_mesh(link_6_coll)

    mount = loader:add("Mount")
    mount:set_position(0, 0, 73.5+13)
    mount:set_orientation(0, 0, math.rad(0))

    mount_sphere = mount.collision:add_sphere(70)
    mount.collision:set_position(mount_sphere, -150, 0, 40)

    torch = loader:add_mesh(dir .. "/irb1410/visual/torch.stl")
    torch:set_position(-176.613,-5,-40)
    torch:set_orientation(math.pi/2,0,0)

    tool = loader:add_tool("Tool")



    tool_twist = loader:add("")
    tool_twist:set_orientation(0, 0, math.rad(0))
    tool_twist.visualisation:add_mesh(torch)

    tool_coarse = loader:add("Tool Coarse")
    tool_coarse.collision:add_mesh(torch)
    tool_coarse.collision:set_moving()
    tool_coarse.collision:set_granularity(true, false)

    tool_fine = loader:add("Tool Fine")
    tool_fine.collision:add_mesh(torch)
    tool_fine.collision:set_moving()
    tool_fine.collision:set_granularity(false, true)

    shroud = loader:add_mesh(dir .. "/irb1410/visual/nozzle.stl")
    -- shroud:set_position(-13,-13,-63-15)

    nozzle = loader:add("Nozzle")
    nozzle.visualisation:add_mesh(shroud)
    nozzle.collision:add_convex_mesh(shroud)

    tcp = loader:add("TCP")
    tcp.visualisation:add_mesh(axes)
    -- tcp.collision:add_sphere(50 / math.sqrt(2))
    -- tcp.collision:set_granularity(true, false)
    -- tcp.collision:set_moving()

    tool:set_tcp(tcp)
    tool:set_end_part(nozzle)

    tcp:set_position(4.0449,1.997,418.177)
    tcp:set_orientation(0,math.rad(45),math.rad(0))
    --tcp:set_orientation_ABB(0.8459,-0.5254,-0.0779,0.0484)

    -- Set up the robot kinematic chain.
    robot:add_child(base)
    base:add_child(joint_1)
    joint_1:add_child(joint_2)
    joint_2:add_child(joint_3)
    joint_3:add_child(joint_4)
    joint_4:add_child(joint_5)
    joint_5:add_child(joint_6)
    joint_6:add_child(mount)
    mount:add_child(tool)
    tool:add_child(tool_twist)
    tool_twist:add_child(tool_coarse)
    tool_twist:add_child(tool_fine)
    tool_twist:add_child(tcp)
    tcp:add_child(nozzle)

    robot:get_joints():set_base(base)
    robot:get_joints():set_tool(tool)
    robot:get_joints():set_tcp(tcp)

    -- Pre-defined configurations
    home = robot:add_configuration("Home")
    home:set_joint(joint_1, math.pi/2)
    home:set_joint(joint_2, 0)
    home:set_joint(joint_3, 0)
    home:set_joint(joint_4, 0)
    home:set_joint(joint_5, 0)
    home:set_joint(joint_6, 0)
    robot:set_home(home)

    collision = robot:add_configuration("Collision")
    collision:set_joint(joint_1, math.rad(10.2766))
    collision:set_joint(joint_2, math.rad(-4.12977))
    collision:set_joint(joint_3, math.rad(4.73283))
    collision:set_joint(joint_4, math.rad(98.8811))
    collision:set_joint(joint_5, math.rad(-41.04))
    collision:set_joint(joint_6, math.rad(-70.1135))

    collision_pairs:add({
        base,
        joint_1,
        joint_2,
        joint_3,
        joint_4,
        joint_5,
        joint_6,
        mount,
        tool_coarse,
        tool_fine,
        nozzle,
        tcp
    })

    collision_pairs:add_pair(base, joint_4)
    collision_pairs:add_pair(base, joint_5)
    collision_pairs:add_pair(base, joint_6)
    collision_pairs:add_pair(base, tool_coarse)
    collision_pairs:add_pair(base, tool_fine)
    collision_pairs:add_pair(base, mount)
    collision_pairs:add_pair(base, nozzle)

    collision_pairs:add_pair(joint_1, joint_4)
    collision_pairs:add_pair(joint_1, joint_5)
    collision_pairs:add_pair(joint_1, joint_6)
    collision_pairs:add_pair(joint_1, tool_coarse)
    collision_pairs:add_pair(joint_1, tool_fine)
    collision_pairs:add_pair(joint_1, mount)
    collision_pairs:add_pair(joint_1, nozzle)

    collision_pairs:add_pair(joint_2, tool_coarse)
    collision_pairs:add_pair(joint_2, tool_fine)
    collision_pairs:add_pair(joint_2, mount)
    collision_pairs:add_pair(joint_2, nozzle)

    return robot
end
