function add_4400()
    local robot = loader:add_robot("ABB IRB 4400")
    robot:set_orientation(0, math.pi/2, -math.pi/2)

    rail = robot:add_prismatic("Rail")
    rail:set_limits(0, 6000)

    base = loader:add("Base")
    base:set_orientation(0, -math.pi/2, 0)
    base.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/base.stl"))
    base.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb4400/collision/base.stl"))
    base.collision:set_moving()

    local joint_1 = robot:add_revolute("1")
    joint_1:set_dh(0, 0, 0, 0)
    joint_1:set_limits(math.rad(-165), math.rad(165))
    joint_1.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/1.stl"))
    joint_1.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb4400/collision/1.stl"))

    local joint_2 = robot:add_revolute("2")
    joint_2:set_dh(-math.pi/2, 200, 0, 680)
    joint_2:set_limits(math.rad(-70), math.rad(95))
    joint_2.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/2.stl"))
    joint_2.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb4400/collision/2.stl"))

    local joint_3 = robot:add_revolute("3")
    joint_3:set_dh(0, 890, -math.pi/2, 0)
    joint_3:set_limits(math.rad(-30), math.rad(155))
    joint_3.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/3.stl"))
    joint_3.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/3_logos.stl"))
    joint_3.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb4400/collision/3.stl"))

    joint_2:set_change_callback(function(value)
         joint_3:set_offset(-value)
         return value
    end)

    local joint_4 = robot:add_revolute("4")
    joint_4:set_dh(-math.pi/2, 150, 0, 0)
    joint_4:set_limits(math.rad(-200), math.rad(200))
    joint_4.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/4.stl"))
    joint_4.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/4_logos.stl"))
    joint_4.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb4400/collision/4.stl"))

    local joint_5 = robot:add_revolute("5")
    joint_5:set_dh(math.pi/2, 0, 0, 880)
    joint_5:set_limits(math.rad(-120), math.rad(120))
    joint_5.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/5.stl"))
    joint_5.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb4400/collision/5.stl"))

    local joint_6 = robot:add_revolute("6")
    joint_6:set_dh(math.pi/2, 0, math.pi, 0)
    joint_6:set_limits(math.rad(-400+150), math.rad(400-150))
    joint_6.visualisation:add_mesh(loader:add_mesh(dir .. "/irb4400/visual/6.stl"))
    joint_6.collision:add_convex_mesh(loader:add_mesh(dir .. "/irb4400/collision/6.stl"))

    mount = loader:add("Mount")
    mount:set_position(0, 0, 140)

    axes = loader:add_mesh(dir .. "/axes.3ds")

    tool = loader:add_tool("Tool")
    tcp = loader:add("TCP")
    tcp.visualisation:add_mesh(axes)
    tcp:set_position(0, 0, 200)
    tcp:set_orientation(math.rad(0), math.rad(0), math.rad(0))

    nozzle = loader:add("Empty Nozzle")
    tool:set_tcp(tcp)
    tool:set_end_part(nozzle)

    tool:add_child(tcp)

    robot:add_child(rail)
    rail:add_child(base)
    base:add_child(joint_1)
    joint_1:add_child(joint_2)
    joint_2:add_child(joint_3)
    joint_3:add_child(joint_4)
    joint_4:add_child(joint_5)
    joint_5:add_child(joint_6)
    joint_6:add_child(mount)

    mount:add_child(tool)

    robot:set_base(base)
    robot:set_tcp(tcp)
    robot:get_joints():add_validator(function(q)
        return q[3] - q[4] < math.rad(60) and q[4] - q[3] < math.rad(60)
    end)

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
    arm:set_tool(tool)
    arm:add_validator(function(q)
        return q[2] - q[3] < math.rad(60) and q[3] - q[2] < math.rad(60)
    end)

    collision_pairs:add({
        base, joint_1, joint_2, joint_3, joint_4, joint_5, joint_6
    })

    collision_pairs:add_pair(base, joint_4)
    collision_pairs:add_pair(base, joint_5)
    collision_pairs:add_pair(base, joint_6)

    collision_pairs:add_pair(joint_1, joint_4)
    collision_pairs:add_pair(joint_1, joint_5)
    collision_pairs:add_pair(joint_1, joint_6)

    home = robot:add_configuration("Home")
    home:set_joint(rail, 0)
    home:set_joint(joint_1, 0)
    home:set_joint(joint_2, 0)
    home:set_joint(joint_3, 0)
    home:set_joint(joint_4, 0)
    home:set_joint(joint_5, math.pi/2)
    home:set_joint(joint_6, -math.pi/2)
    robot:set_home(home)

    collision = robot:add_configuration("Collision")
    collision:set_joint(rail, 2500)
    collision:set_joint(joint_1, math.rad(132.495))
    collision:set_joint(joint_2, math.rad(86.5308))
    collision:set_joint(joint_3, math.rad(-53.0082))
    collision:set_joint(joint_4, math.rad(149.48))
    collision:set_joint(joint_5, math.rad(113.046))
    collision:set_joint(joint_6, math.rad(70.4321))

    return robot
end
