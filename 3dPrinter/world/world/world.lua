scene = loader:add("Scene")
scene:set_position(-3230, -11415, -391)
scene.visualisation:add_mesh(loader:add_mesh(dir .. "/world/visual/mrl.stl"))

environment = loader:add("Environment")

table = environment.collision:add_box(750, 1500, 430)
environment.collision:set_position(table, 1541.5, -5631.5, 39)

rail = environment.collision:add_box(885/2 + 200, 3500, 315/2)
environment.collision:set_position(rail, -117.5, -2905, -217.5)

rail_cable = environment.collision:add_box(400/2, 3500, 250)
environment.collision:set_position(rail_cable, -760, -2905, -125)

--table1410_1 = environment.collision:add_box(1500/2,400/2,280/2)
--environment.collision:set_position(table1410_1,1493.3,629.2,-253.7)
--table1410_2 = environment.collision:add_box(1000/2,1600/2,280/2)
--environment.collision:set_position(table1410_2,1743.3,-370.8,-253.7)
table1410_3 = environment.collision:add_box(1000/2+20,800/2,520/2+50)
environment.collision:set_position(table1410_3,1743.3,-340.8,146.3)
table1410_4 = environment.collision:add_box(400/2,300/2,1500/2)
environment.collision:set_position(table1410_4,2043.3,979.2,356.3)
table1410_5 = environment.collision:add_box(600/2,600/2,1300/2)
environment.collision:set_position(table1410_5,1943.3,-1170.8,256.3)

shelf_1 = environment.collision:add_box(400/2+200,320/2,2200/2)
environment.collision:set_position(shelf_1,1743.3-400+160-100,-340.8-1550,1100-391)
shelf_2 = environment.collision:add_box(700/2+200,1300/2,1300/2)
environment.collision:set_position(shelf_2,1743.3-400+300-100,-340.8-1550-650-160,650-391)
collision_pairs:add({
    environment
})
