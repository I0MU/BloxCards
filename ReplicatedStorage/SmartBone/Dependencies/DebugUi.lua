



local t1: {[any]: any} = {}
local t2: {[any]: any} = {}

local function infoText(p1, p2)
	p1.PushConfig({ TextColor = p1._config.TextDisabledColor })
	p1.Text({ p2 })
	p1.PopConfig()
end
local function helpMarker(p3, p4)
	p3.PushConfig({ TextColor = p3._config.TextDisabledColor })

	local v11 = p3.Text({ "(?)" })

	p3.PopConfig()
	p3.PushConfig({ ContentWidth = UDim.new(0, 350) })

	if v11.hovered() then
		p3.Tooltip({ p4 })
	end

	p3.PopConfig()
end
local function BoneEditor(p5, p6)
	local v14 = p5.Window({ (("Editing bone: %*"):format(p6.Bone.Name)) })

	v14.isOpened.value = true
	p6.Radius = p5.InputNum({ "Radius", 0.1, 0, math.huge, "%.3f" }, { number = p6.Radius }).number.value
	p6.RotationLimit = p5.InputNum({ "Rotation Limit", 0.1, 0, 180, "%.3f" }, { number = p6.RotationLimit }).number.value
	p6.Anchored = p5.Checkbox({ "Anchored" }, { isChecked = p6.Anchored }).isChecked.value
	p5.Text("Axis Lock")
	p5.Indent()
	p5.SameLine()
	p5.Text("X: ")

	local v15 = p5.Checkbox({ "" }, { isChecked = p6.AxisLocked[1] })

	p5.Text("Y: ")

	local v16 = p5.Checkbox({ "" }, { isChecked = p6.AxisLocked[2] })

	p5.Text("Z: ")

	local v17 = p5.Checkbox({ "" }, { isChecked = p6.AxisLocked[3] })

	p5.End()
	p5.End()

	local v18 = p5.State(Vector2.new(p6.XAxisLimits.Min, p6.XAxisLimits.Max))
	local v19 = p5.State(Vector2.new(p6.YAxisLimits.Min, p6.YAxisLimits.Max))
	local v20 = p5.State(Vector2.new(p6.ZAxisLimits.Min, p6.ZAxisLimits.Max))

	p5.Text("Axis Limits")
	p5.Indent()
	p5.DragVector2({
		"X Axis Limit",
		0.05,
		nil,
		nil,
		{ "Min: %.2f", "Max: %.2f" }
	}, { number = v18 })
	p5.DragVector2({
		"Y Axis Limit",
		0.05,
		nil,
		nil,
		{ "Min: %.2f", "Max: %.2f" }
	}, { number = v19 })
	p5.DragVector2({
		"Z Axis Limit",
		0.05,
		nil,
		nil,
		{ "Min: %.2f", "Max: %.2f" }
	}, { number = v20 })
	p5.End()
	p5.End()
	p6.AxisLocked[1] = v15.isChecked.value
	p6.AxisLocked[2] = v16.isChecked.value
	p6.AxisLocked[3] = v17.isChecked.value

	local numberRangeNew = NumberRange.new
	local x = v18:get().X
	local v23 = v18:get()

	p6.XAxisLimits = numberRangeNew(x, v23.Y)

	local v24 = NumberRange.new
	local v25 = v19:get().X

	v23 = v19:get()
	p6.YAxisLimits = v24(v25, v23.Y)

	local v26 = NumberRange.new
	local v27 = v20:get().X

	v23 = v20:get()
	p6.ZAxisLimits = v26(v27, v23.Y)

	if v14.closed() then
		t1[p6] = nil
	end
end
local function ColliderEditor(p7, p8)
	local v30 = p7.Window({ (("Editing collider of type: %*"):format(p8.Type)) })

	v30.isOpened.value = true

	local v31 = p7.State(p8.Type)
	local v32 = p7.State(p8.Scale)
	local v33 = p7.State(p8.Offset)
	local v34 = p7.State(p8.Rotation)

	p7.Combo({ "Collider Type" }, { index = v31 })
	p7.Selectable({ "Box", "Box" }, { index = v31 })
	p7.Selectable({ "Sphere", "Sphere" }, { index = v31 })
	p7.Selectable({ "Capsule", "Capsule" }, { index = v31 })
	p7.End()
	p7.DragVector3({ "Scale", 0.1, 0, nil }, { number = v32 })
	p7.DragVector3({ "Offset", 0.1, nil, nil }, { number = v33 })
	p7.DragVector3({ "Rotation", 0.5, -180, 180 }, { number = v34 })
	p8.Type = v31:get()
	p8.Scale = v32:get()
	p8.Offset = v33:get()
	p8.Rotation = v34:get()
	p7.End()

	if v30.closed() then
		t2[p8] = nil
	end
end

return function(p9, p10, p11)
	local t3: {[any]: any} = {}

	for iterFirst, iterSecond in p10.BoneTrees, nil, nil do
		local rootPart = iterSecond.RootPart
		local v42 = t3[rootPart]

		if not v42 then
			t3[rootPart] = {}
			v42 = t3[rootPart]
		end

		table.insert(v42, iterSecond)
	end

	for key, value in t1 do
		local v45 = ("%* - %*"):format(p10.ID, key.ParentIndex + 1)

		p9.PushId(v45)
		BoneEditor(p9, key)
		p9.PopId()
	end

	for key2, value2 in t2 do
		p9.PushId(key2.GUID)
		ColliderEditor(p9, key2)
		p9.PopId()
	end

	local n1: number = #p10.BoneTrees
	local n2: number = #p10.ColliderObjects
	local v50 = ("%* BoneTree%*"):format(n1, if n1 == 1 then "" else "s")
	local v51 = ("%* Collider%*"):format(n2, if n2 == 1 then "" else "s")
	local window = p9.Window
	local v53 = ("SmartBone Runtime Editor. %*, %*"):format(v50, v51)

	window({ v53, [p9.Args.Window.NoClose] = true })
	p9.Tree({ "Debug Gizmos", true }, { isUncollapsed = true })
	p9.SameLine()
	p9.Checkbox({ "Draw Internal Bone" }, { isChecked = p11.DRAW_BONE })
	helpMarker(p9, "Draws a sphere with the specified radius of the bone around where SmartBone believes the bone is.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Physical Bone" }, { isChecked = p11.DRAW_PHYSICAL_BONE })
	helpMarker(p9, "Draws the actual bone objects CFrame with axis arrows.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Root Part" }, { isChecked = p11.DRAW_ROOT_PART })
	helpMarker(p9, "Draws a bounding box and fills in the root part.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Bounding Box" }, { isChecked = p11.DRAW_BOUNDING_BOX })
	helpMarker(p9, "Draws the bounding box used for frustum culling")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Axis Limits" }, { isChecked = p11.DRAW_AXIS_LIMITS })
	helpMarker(p9, "Draws the axis limits for each bone.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Rotation Limits" }, { isChecked = p11.DRAW_ROTATION_LIMITS })
	helpMarker(p9, "Draws the rotation limits for each bone.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Acceleration Info" }, { isChecked = p11.DRAW_ACCELERATION_INFO })
	helpMarker(p9, "Draws the acceleration and the required values to derive it.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Colliders" }, { isChecked = p11.DRAW_COLLIDERS })
	helpMarker(p9, "Draws all the colliders this root object can collide with.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Collider Influence" }, { isChecked = p11.DRAW_COLLIDER_INFLUENCE })
	helpMarker(p9, "Shows the sphere of influence around each collider.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Collider Awake" }, { isChecked = p11.DRAW_COLLIDER_AWAKE })
	helpMarker(p9, "Shows if a collider is awake or asleep.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Collider Broadphase" }, { isChecked = p11.DRAW_COLLIDER_BROADPHASE })
	helpMarker(p9, "Shows if a collider isn't reaching narrowphase.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Fill Colliders" }, { isChecked = p11.DRAW_FILL_COLLIDERS })
	helpMarker(p9, "Fills all colliders this root object can collide with.")
	p9.End()
	p9.SameLine()
	p9.Checkbox({ "Draw Contacts" }, { isChecked = p11.DRAW_CONTACTS })
	helpMarker(p9, "Draws the position and normal of the points which bones collide with colliders.")
	p9.End()
	p9.End()
	p9.Separator()
	infoText(p9, "Simulated Objects")

	for key3, value3 in t3 do
		local tree = p9.Tree
		local v57 = ("%* - Root Part"):format(key3.Name)

		tree(v57)

		for iterFirst2, iterSecond2 in value3 do
			local v60 = p9.Tree
			local v61 = ("BoneTree #%*"):format(iterFirst2)

			v60(v61)

			local formattedText = string.format("%.1f", iterSecond2.UpdateRate)
			local formattedText2 = string.format("%.1f", iterSecond2.Settings.UpdateRate)
			local v64 = ("Throttled Update Rate: %* / %* fps"):format(formattedText, formattedText2)

			infoText(p9, v64)
			v64 = ("In View: %*"):format(iterSecond2.InView)
			infoText(p9, v64)

			local v65 = p9.State(iterSecond2.Settings.Constraint)
			local v66 = p9.State(iterSecond2.Settings.WindType)
			local v67 = p9.State(iterSecond2.Settings.UpdateRate)
			local v68 = p9.State(iterSecond2.Settings.ActivationDistance)

			v61 = p9.State(iterSecond2.Settings.ThrottleDistance)
			p9.SameLine()
			helpMarker(p9, "The constraint used, distance is more flowy while spring is more rigid.")
			p9.Combo({ "Constraint Type" }, { index = v65 })
			p9.Selectable({ "Distance", "Distance" }, { index = v65 })
			p9.Selectable({ "Spring", "Spring" }, { index = v65 })
			p9.End()
			p9.End()
			p9.SameLine()
			helpMarker(p9, "The wind solver used, sine is a smoother wind, noise is more chaotic and hybrid is a mix of the two.")
			p9.Combo({ "Wind Type" }, { index = v66 })
			p9.Selectable({ "Sine", "Sine" }, { index = v66 })
			p9.Selectable({ "Noise", "Noise" }, { index = v66 })
			p9.Selectable({ "Hybrid", "Hybrid" }, { index = v66 })
			p9.End()
			p9.End()
			p9.SameLine()
			helpMarker(p9, "The target update rate for the bone tree")
			p9.SliderNum({ "Update Rate", 5, 0, 120 }, { number = v67 })
			p9.End()
			p9.SameLine()
			helpMarker(p9, "The distance at which the bone tree stops updating")
			p9.SliderNum({ "Activation Distance", 1, 0, 500 }, { number = v68 })
			p9.End()
			p9.SameLine()
			helpMarker(p9, "The distance at which the bone tree starts throttling its update rate")
			p9.SliderNum({ "Throttle Distance", 1, 0, 500 }, { number = v61 })
			p9.End()
			iterSecond2.Settings.Constraint = v65:get()
			iterSecond2.Settings.WindType = v66:get()
			iterSecond2.Settings.UpdateRate = v67:get()
			iterSecond2.Settings.ActivationDistance = v68:get()
			iterSecond2.Settings.ThrottleDistance = v61:get()
			p9.Table({ 4, false, false, false })
			p9.NextColumn()
			p9.Text("Bone #")
			p9.NextColumn()
			p9.Text("Bone Name")
			p9.NextColumn()
			p9.Text("Parent #")
			p9.NextColumn()
			p9.Text("Edit")
			p9.End()
			p9.Table({ 4 })

			for iterFirst3, iterSecond3 in iterSecond2.Bones, nil, nil do
				p9.NextColumn()

				local v71 = p9.Text
				local text: string = tostring(iterFirst3)

				v71(text)
				p9.NextColumn()
				p9.Text(iterSecond3.Bone.Name)
				p9.NextColumn()
				v71 = p9.Text

				local text2: string = tostring(iterSecond3.ParentIndex)

				v71(text2)
				p9.NextColumn()
				p9.SameLine()
				p9.Text("")

				if p9.SmallButton({ "Edit" }).clicked() then
					t1[iterSecond3] = true
				end

				p9.End()
			end

			p9.End()
			p9.End()
		end

		p9.End()
	end

	infoText(p9, "Active Colliders")

	for iterFirst4, iterSecond4 in p10.ColliderObjects, nil, nil do
		p9.Tree({ iterSecond4.m_Object.Name })
		infoText(p9, "Colliders adorned to this object")
		p9.Table({ 5, false, false, false })
		p9.NextColumn()
		p9.Text("Type")
		p9.NextColumn()
		p9.Text("Scale")
		p9.NextColumn()
		p9.Text("Offset")
		p9.NextColumn()
		p9.Text("Rotation")
		p9.NextColumn()
		p9.Text("Edit")
		p9.End()
		p9.Table({ 5 })

		for iterFirst5, iterSecond5 in iterSecond4.Colliders, nil, nil do
			p9.NextColumn()

			local v78 = p9.Text
			local text3: string = tostring(iterSecond5.Type)

			v78(text3)
			p9.NextColumn()
			v78 = p9.Text

			local text4: string = tostring(iterSecond5.Scale)

			v78(text4)
			p9.NextColumn()
			v78 = p9.Text

			local text5: string = tostring(iterSecond5.Offset)

			v78(text5)
			p9.NextColumn()
			v78 = p9.Text

			local text6: string = tostring(iterSecond5.Rotation)

			v78(text6)
			p9.NextColumn()
			p9.SameLine()
			p9.Text("")

			if p9.SmallButton({ "Edit" }).clicked() then
				t2[iterSecond5] = true
			end

			p9.End()
		end

		p9.End()
		p9.End()
	end

	p9.End()
end
