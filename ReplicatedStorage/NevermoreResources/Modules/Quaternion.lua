



local v1 = next
local v2 = tick
local v3 = type
local v4 = print
local v5 = tostring
local mathAbs = math.abs
local mathCos = math.cos
local mathSin = math.sin
local mathSqrt = math.sqrt
local mathAtan2 = math.atan2
local mathMax = math.max
local cFrameNew = CFrame.new
local vector3 = Vector3.new()
local t1: {[any]: any} = { 1, 0, 0, 0 }

local function BezierPosition(p1, p2, p3, p4, p5)
	local n1 = 1 - p5

	return p1 * n1 * n1 * n1 + (3 * p1 + p3) * p5 * n1 * n1 + (3 * p2 - p4) * p5 * p5 * n1 + p2 * p5 * p5 * p5
end
local function BezierVelocity(p6, p7, p8, p9, p10)
	local n1 = 1 - p10

	return p8 * n1 * n1 + 2 * (3 * (p7 - p6) - (p9 + p8)) * p10 * n1 + p9 * p10 * p10
end
local function Qmul(list, list2)
	local v45 = list[1]
	local v46 = list[2]
	local v47 = list[3]
	local v48 = list[4]
	local v49 = list2[1]
	local v50 = list2[2]
	local v51 = list2[3]
	local v52 = list2[4]

	return {
		v45 * v49 - v46 * v50 - v47 * v51 - v48 * v52,
		v45 * v50 + v46 * v49 + v47 * v52 - v48 * v51,
		v45 * v51 - v46 * v52 + v47 * v49 + v48 * v50,
		v45 * v52 + v46 * v51 - v47 * v50 + v48 * v49
	}
end
local function Qinv(list)
	local v54 = list[1]
	local v55 = list[2]
	local v56 = list[3]
	local v57 = list[4]
	local n1 = v54 * v54 + v55 * v55 + v56 * v56 + v57 * v57

	if n1 > 0 then
		return { v54 / n1, -v55 / n1, -v56 / n1, -v57 / n1 }
	end

	return { 0, 0, 0, 0 }
end
local function Qpow(list, p15, p16)
	local v62 = list[1]
	local v63 = list[2]
	local v64 = list[3]
	local v65 = list[4]
	local n1 = v63 * v63 + v64 * v64 + v65 * v65

	if n1 > 0 then
		local v67 = mathSqrt(n1)
		local n2 = (v62 * v62 + n1) ^ (0.5 * p15)
		local v69 = mathAtan2(v67, v62)
		local n3 = p15 * (v69 + 6.283185307179586 * (p16 or 0))
		local v71 = mathSin(n3)
		local n4 = n2 * v71 / v67
		local v73 = mathCos(n3)

		return { n2 * v73, v63 * n4, v64 * n4, v65 * n4 }
	end

	if v62 < 0 then
		local n5 = (-v62) ^ p15
		local v75 = mathSin(3.141592653589793 * p15)
		local n6 = n5 * v75 * 1.7320508075688772 / 3

		v75 = mathCos(3.141592653589793 * p15)

		return { n5 * v75, n6, n6, n6 }
	end

	return { v62 ^ p15, 0, 0, 0 }
end
local function QuaternionFromCFrame(p17)
	local v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89 = p17:components()
	local n1 = v81 + v85 + v89

	if n1 > 0 then
		local v91 = mathSqrt(1 + n1)
		local n2 = 0.5 / v91

		return v91 * 0.5, (v88 - v86) * n2, (v83 - v87) * n2, (v84 - v82) * n2
	end

	local v93 = mathMax(v81, v85, v89)

	if v81 == v93 then
		local v94 = mathSqrt(1 + v81 - v85 - v89)
		local n3 = 0.5 / v94

		return (v88 - v86) * n3, v94 * 0.5, (v84 + v82) * n3, (v83 + v87) * n3
	end

	if v93 == v85 then
		local v96 = mathSqrt(1 - v81 + v85 - v89)
		local n4 = 0.5 / v96

		return (v83 - v87) * n4, (v84 + v82) * n4, v96 * 0.5, (v88 + v86) * n4
	end

	if v93 == v89 then
		local v98 = mathSqrt(1 - v81 - v85 + v89)
		local n5 = 0.5 / v98

		return (v84 - v82) * n5, (v83 + v87) * n5, (v88 + v86) * n5, v98 * 0.5
	end
end
local function SlerpQuaternions(p18, p19, p20)
	local v103 = Qinv(p18)
	local v104 = Qmul(p19, v103)
	local v105 = Qpow(v104, p20)

	return (Qmul(p18, v105))
end
local function QuaternionToCFrame(list)
	local v107 = list[1]
	local v108 = list[2]
	local v109 = list[3]
	local v110 = list[4]
	local n1 = v108 + v108
	local n2 = v109 + v109
	local n3 = v110 + v110
	local n4 = v107 * n1
	local n5 = v107 * n2
	local n6 = v107 * n3
	local n7 = v108 * n1
	local n8 = v108 * n2
	local n9 = v108 * n3
	local n10 = v109 * n2
	local n11 = v109 * n3
	local n12 = v110 * n3

	return 1 - (n10 + n12), n8 - n6, n9 + n5, n8 + n6, 1 - (n7 + n12), n11 - n4, n9 - n5, n11 + n4, 1 - (n7 + n10)
end
local function BezierRotation(p22, p23, p24, p25, p26)
	local v128 = p22
	local v129 = Qmul(p22, p24)
	local v130 = Qinv(p25)
	local v131 = Qmul(p23, v130)
	local v132 = Qinv(v128)
	local v133 = Qmul(v132, v129)
	local v134 = Qpow(v133, p26)
	local v135 = Qmul(v128, v134)

	v132 = Qinv(v129)
	v133 = Qmul(v132, v131)
	v134 = Qpow(v133, p26)

	local v136 = Qmul(v129, v134)

	v133 = Qinv(v131)
	v134 = Qmul(v133, p23)

	local v137 = Qpow(v134, p26)

	v130 = Qmul(v131, v137)

	local v138 = Qinv(v135)
	local v139 = Qmul(v138, v136)

	v132 = Qpow(v139, p26)

	local v140 = Qmul(v135, v132)

	v139 = Qinv(v136)
	v132 = Qmul(v139, v130)
	v133 = Qpow(v132, p26)
	v137 = Qmul(v136, v133)
	v138 = Qinv(v140)
	v139 = Qmul(v138, v137)
	v132 = Qpow(v139, p26)

	return (Qmul(v140, v132))
end
local function BezierAngularV(p27, p28, p29, p30, p31)
	local v146 = Qmul(p27, p29)
	local v147 = Qinv(p30)
	local v148 = Qmul(p28, v147)
	local v149 = Qinv(p27)
	local v150 = Qmul(v149, v146)

	v149 = Qinv(v146)

	local v151 = Qmul(v149, v148)
	local v152 = Qinv(v148)

	v147 = Qmul(v152, p28)

	local v153 = Qinv(v150)
	local v154 = Qmul(v153, v151)
	local v155 = Qpow(v154, p31)

	v152 = Qmul(v150, v155)
	v154 = Qinv(v151)
	v155 = Qmul(v154, v147)

	local v156 = Qpow(v155, p31)

	v149 = Qmul(v151, v156)
	v153 = Qinv(v152)
	v154 = Qmul(v153, v149)
	v155 = Qpow(v154, p31)

	return (Qmul(v152, v155))
end

local t2: {[any]: any} = {}

local object = setmetatable({}, {
	__index = function(_, p33)
		local v159 = t2[p33]

		if v159 then
			local v160 = v2()
			local t0 = v159.t0
			local t1 = v159.t1

			if v160 > t0 and v160 < t1 then
				local x0 = v159.x0
				local x1 = v159.x1
				local n1 = (v160 - t0) / (t1 - t0)
				local n2 = 1 - n1

				return x0 * n2 * n2 * n2 + (3 * x0 + v159.v0) * n1 * n2 * n2 + (3 * x1 - v159.v1) * n1 * n1 * n2 + x1 * n1 * n1 * n1
			end

			if v160 >= t1 then
				return v159.x1
			end

			if v160 <= t0 then
				return v159.x0
			end

			return
		end
	end,
	__newindex = function(_, p35, p36)
		local v170 = t2[p35]

		if v170 then
			local v171 = v2()
			local t0 = v170.t0
			local t1 = v170.t1
			local v174 = nil
			local v175 = nil
			local v176 = nil
			local v177 = nil

			if v171 > t0 and v171 < t1 then
				local n1 = t1 - t0
				local n2 = (v171 - t0) / n1
				local x0 = v170.x0
				local x1 = v170.x1
				local n3 = 1 - n2

				v174 = x0 * n3 * n3 * n3 + (3 * x0 + v170.v0) * n2 * n3 * n3 + (3 * x1 - v170.v1) * n2 * n2 * n3 + x1 * n2 * n2 * n2
				v175 = p36

				local v0 = v170.v0
				local v1 = v170.v1
				local n4 = 1 - n2

				v176 = (v0 * n4 * n4 + 2 * (3 * (v170.x1 - v170.x0) - (v1 + v0)) * n2 * n4 + v1 * n2 * n2) / n1
				v177 = p36 * 0
			elseif v171 >= t1 then
				v174 = v170.x1
				v175 = p36
				v176 = p36 * 0
				v177 = p36 * 0
			elseif v171 <= t0 then
				v174 = v170.x0
				v175 = p36
				v176 = p36 * 0
				v177 = p36 * 0
			end

			local n5 = 1
			local time = v170.time
			local v188 = v3(time)

			if v188 == "number" then
				n5 = time
			elseif v188 == "function" then
				n5 = time(v174, v175, v176, v177)
			end

			v170.x0 = v174
			v170.x1 = v175
			v170.v0 = n5 * v176
			v170.v1 = n5 * v177
			v170.t0 = v171
			v170.t1 = v171 + n5
			v170.tweening = true

			return
		end

		local v189 = v5(p35)

		v4("A value named " .. v189 .. " has not yet been created.")
	end
})

local t3: {[any]: any} = {}

local object2 = setmetatable({}, {
	__index = function(_, p38)
		local v192 = t3[p38]

		if v192 then
			local v193 = v2()
			local t0 = v192.t0
			local t1 = v192.t1

			if v193 > t0 and v193 < t1 then
				return (BezierRotation(v192.q0, v192.q1, v192.w0, v192.w1, (v193 - t0) / (t1 - t0)))
			end

			if v193 >= t1 then
				return v192.q1
			end

			if v193 <= t0 then
				return v192.q0
			end

			return
		end
	end,
	__newindex = function(_, p40, p41)
		local v199 = t3[p40]

		if v199 then
			local v200 = v2()
			local t0 = v199.t0
			local t2 = v199.t1
			local v203 = nil
			local t5 = nil
			local v205 = nil
			local v206 = nil

			if v200 > t0 and v200 < t2 then
				local n1 = t2 - t0
				local n2 = (v200 - t0) / n1

				v203 = BezierRotation(v199.q0, v199.q1, v199.w0, v199.w1, n2)
				t5 = p41

				local v209 = BezierAngularV(v199.q0, v199.q1, v199.w0, v199.w1, n2)

				v205 = Qpow(v209, 1 / n1)
				v206 = t1
			elseif v200 >= t2 then
				v203 = v199.q1
				t5 = p41
				v205 = t1
				v206 = t1
			elseif v200 <= t0 then
				v203 = v199.q0
				t5 = p41
				v205 = t1
				v206 = t1
			end

			if v199.autoChoose and v203[1] * t5[1] + v203[2] * t5[2] + v203[3] * t5[3] + v203[4] * t5[4] < 0 then
				t5 = { -t5[1], -t5[2], -t5[3], -t5[4] }
			end

			local n3 = 1
			local time = v199.time
			local v212 = v3(time)

			if v212 == "number" then
				n3 = time
			elseif v212 == "function" then
				n3 = time(v203, t5, v205, v206)
			end

			local v213 = Qpow(v205, n3)
			local v214 = Qpow(v206, n3)

			v199.q0 = v203
			v199.q1 = t5
			v199.w0 = v213
			v199.w1 = v214
			v199.t0 = v200
			v199.t1 = v200 + n3
			v199.tweening = true

			return
		end

		local v215 = v5(p40)

		v4("A value named " .. v215 .. " has not yet been created.")
	end
})

local t4: {[any]: any} = {}

local object3 = setmetatable({}, {
	__index = function(_, p43)
		local v218 = t4[p43]

		if v218 then
			local v219 = v2()
			local t0 = v218.t0
			local t1 = v218.t1

			if v219 > t0 and v219 < t1 then
				local n1 = (v219 - t0) / (t1 - t0)
				local x0 = v218.x0
				local x1 = v218.x1
				local n2 = 1 - n1
				local n3 = x0 * n2 * n2 * n2 + (3 * x0 + v218.v0) * n1 * n2 * n2 + (3 * x1 - v218.v1) * n1 * n1 * n2 + x1 * n1 * n1 * n1
				local x = n3.x
				local y = n3.y
				local z = n3.z
				local v230 = BezierRotation(v218.q0, v218.q1, v218.w0, v218.w1, n1)

				return cFrameNew(x, y, z, QuaternionToCFrame(v230))
			end

			if v219 >= t1 then
				return v218.c1
			end

			if v219 <= t0 then
				return v218.c0
			end

			return
		end
	end,
	__newindex = function(_, p45, p46)
		local v234 = t4[p45]

		if v234 then
			local v235 = v2()
			local t0 = v234.t0
			local t2 = v234.t1
			local v238 = nil
			local v239 = nil
			local v240 = nil
			local v241 = nil
			local v242 = nil
			local t6 = nil
			local v244 = nil
			local v245 = nil

			if v235 > t0 and v235 < t2 then
				local n1 = t2 - t0
				local n2 = (v235 - t0) / n1
				local x0 = v234.x0
				local x1 = v234.x1
				local n3 = 1 - n2

				v238 = x0 * n3 * n3 * n3 + (3 * x0 + v234.v0) * n2 * n3 * n3 + (3 * x1 - v234.v1) * n2 * n2 * n3 + x1 * n2 * n2 * n2
				v239 = p46.p

				local v0 = v234.v0
				local v1 = v234.v1
				local n4 = 1 - n2

				v240 = (v0 * n4 * n4 + 2 * (3 * (v234.x1 - v234.x0) - (v1 + v0)) * n2 * n4 + v1 * n2 * n2) / n1
				v241 = vector3
				v242 = BezierRotation(v234.q0, v234.q1, v234.w0, v234.w1, n2)
				t6 = { QuaternionFromCFrame(p46) }
				local v254 = BezierAngularV(v234.q0, v234.q1, v234.w0, v234.w1, n2)

				v244 = Qpow(v254, 1 / n1)
				v245 = t1
			elseif v235 >= t2 then
				v238 = v234.x1
				v239 = p46.p
				v240 = vector3
				v241 = vector3
				v242 = v234.q1
				t6 = { QuaternionFromCFrame(p46) }
				v244 = t1
				v245 = t1
			elseif v235 <= t0 then
				v238 = v234.x0
				v239 = p46.p
				v240 = vector3
				v241 = vector3
				v242 = v234.q0
				t6 = { QuaternionFromCFrame(p46) }
				v244 = t1
				v245 = t1
			end

			local n5 = v242[1] - t6[1]
			local n6 = v242[2] - t6[2]
			local n7 = v242[3] - t6[3]
			local n8 = v242[4] - t6[4]
			local n9 = v242[1] + t6[1]
			local n10 = v242[2] + t6[2]
			local n11 = v242[3] + t6[3]
			local n12 = v242[4] + t6[4]

			if n5 * n5 + n6 * n6 + n7 * n7 + n8 * n8 > n9 * n9 + n10 * n10 + n11 * n11 + n12 * n12 then
				t6 = { -t6[1], -t6[2], -t6[3], -t6[4] }
			end

			n12 = cFrameNew(v238.x, v238.y, v238.z, QuaternionToCFrame(v242))

			local n13 = 1
			local time = v234.time

			n11 = v3(time)

			if n11 == "number" then
				n13 = time
			elseif n11 == "function" then
				n13 = time(n12, p46, v238, v239, v240, v241, v242, t6, v244, v245)
			end

			local v265 = Qpow(v244, n13)
			local v266 = Qpow(v245, n13)

			v234.c0 = n12
			v234.c1 = p46
			v234.x0 = v238
			v234.x1 = v239
			v234.v0 = v240 * n13
			v234.v1 = v241 * n13
			v234.q0 = v242
			v234.q1 = t6
			v234.w0 = v265
			v234.w1 = v266
			v234.t0 = v235
			v234.t1 = v235 + n13
			v234.tweening = true

			return
		end

		local v267 = v5(p45)

		v4("A value named " .. v267 .. " has not yet been created.")
	end
})

return {
	Tweens = object,
	QuaternionTweens = object2,
	CFrameTweens = object3,
	updateTweens = function(p47)
		for iterFirst, iterSecond in v1, t2, nil do
			local update = iterSecond.update
			local t0 = iterSecond.t0
			local t1 = iterSecond.t1

			if update then
				if iterSecond.tweening then
					if p47 > t0 and p47 < t1 then
						local x0 = iterSecond.x0
						local x1 = iterSecond.x1
						local n1 = (p47 - t0) / (t1 - t0)
						local n2 = 1 - n1

						update(x0 * n2 * n2 * n2 + (3 * x0 + iterSecond.v0) * n1 * n2 * n2 + (3 * x1 - iterSecond.v1) * n1 * n1 * n2 + x1 * n1 * n1 * n1)
					elseif p47 >= t1 then
						update(iterSecond.x1)
						iterSecond.tweening = false
					end
				elseif p47 <= t0 then
					iterSecond.tweening = true
				end
			end
		end
	end,
	updateQuaternionTweens = function(p48)
		for iterFirst, iterSecond in v1, t3, nil do
			local update = iterSecond.update
			local t0 = iterSecond.t0
			local t1 = iterSecond.t1

			if update then
				if iterSecond.tweening then
					if p48 > t0 and p48 < t1 then
						local v284 = BezierRotation(iterSecond.q0, iterSecond.q1, iterSecond.w0, iterSecond.w1, (p48 - t0) / (t1 - t0))

						update(v284)
					elseif p48 >= t1 then
						update(iterSecond.q1)
						iterSecond.tweening = false
					end
				elseif p48 <= t0 then
					iterSecond.tweening = true
				end
			end
		end
	end,
	updateCFrameTweens = function(p49)
		for iterFirst, iterSecond in v1, t4, nil do
			local update = iterSecond.update
			local t0 = iterSecond.t0
			local t1 = iterSecond.t1

			if update then
				if iterSecond.tweening then
					if p49 > t0 and p49 < t1 then
						local n1 = (p49 - t0) / (t1 - t0)
						local x0 = iterSecond.x0
						local x1 = iterSecond.x1
						local n2 = 1 - n1
						local n3 = x0 * n2 * n2 * n2 + (3 * x0 + iterSecond.v0) * n1 * n2 * n2 + (3 * x1 - iterSecond.v1) * n1 * n1 * n2 + x1 * n1 * n1 * n1
						local x = n3.x
						local y = n3.y
						local z = n3.z
						local v299 = BezierRotation(iterSecond.q0, iterSecond.q1, iterSecond.w0, iterSecond.w1, n1)

						update(cFrameNew(x, y, z, QuaternionToCFrame(v299)))
					elseif p49 >= t1 then
						update(iterSecond.c1)
						iterSecond.tweening = false
					end
				elseif p49 <= t0 then
					iterSecond.tweening = true
				end
			end
		end
	end,
	newTween = function(p50, p51, p52, p53)
		local v304 = v2()

		t2[p50] = {
			t0 = 0,
			tweening = false,
			x0 = p51,
			x1 = p51,
			v0 = p51 * 0,
			v1 = p51 * 0,
			t1 = v304,
			time = p53 or 1,
			update = p52
		}

		if p52 then
			p52(p51)
		end
	end,
	newQuaternionTween = function(p54, p55, p56, p57, p58)
		local v310 = v2()
		local t7: {[any]: any} = {
			t0 = 0,
			tweening = false,
			q0 = p55,
			q1 = p55,
			w0 = t1,
			w1 = t1,
			t1 = v310,
			time = p57 or 1,
			update = p56
		}

		v310 = true

		if p58 ~= nil then
			v310 = p58
		end

		t7.autoChoose = v310
		t3[p54] = t7

		if p56 then
			p56(p55)
		end
	end,
	newCFrameTween = function(p59, p60, p61, p62)
		local p = p60.p
		local v317 = p60.p
		local t8: {[any]: any} = { QuaternionFromCFrame(p60) }
		local v319 = v2()

		t4[p59] = {
			t0 = 0,
			tweening = false,
			c0 = p60,
			c1 = p60,
			x0 = p,
			x1 = v317,
			v0 = vector3,
			v1 = vector3,
			q0 = t8,
			q1 = t8,
			w0 = t1,
			w1 = t1,
			t1 = v319,
			time = p62 or 1,
			update = p61
		}

		if p61 then
			p61(p60)
		end
	end
}
