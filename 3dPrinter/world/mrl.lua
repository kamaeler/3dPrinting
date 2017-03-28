axes = loader:add_mesh(dir .. "/axes.3ds")

-- Set up the world.

origin = loader:add("Origin")
origin.visualisation:add_mesh(axes)

dofile(dir .. "/world/world.lua")

-- Add the robots.

--dofile(dir .. "/irb1410/irb1410.lua")
--dofile(dir .. "/irb2600/irb2600.lua")
--dofile(dir .. "/irb4004/irb4004.lua")
dofile(dir .. "/irb4400/irb4400.lua")
--dofile(dir .. "/irb6660/irb6660.lua")

dofile(dir .. "/tools/fronius_cmt/fronius_cmt.lua")
--dofile(dir .. "/tools/servo_robot/servo_robot.lua")


IRB4400 = add_4400()
