



local u1 = nil
local pointToObjectSpace = CFrame.new().pointToObjectSpace

u1 = function(p1, p2, p3)
	local v28 = pointToObjectSpace(p1, p3)
	local n1 = p2.x / 2
	local n2 = p2.y / 2
	local n3 = p2.z / 2
	local x = v28.x
	local y = v28.y
	local z = v28.z

	return x * x < n1 * n1 and y * y < n2 * n2 and z * z < n3 * n3
end

local v3 = CFrame.new().pointToObjectSpace

local function BoxSphereCollision(p4, p5, p6, p7)
	local v39 = v3(p4, p6)
	local n1 = p5.x / 2
	local n2 = p5.y / 2
	local n3 = p5.z / 2
	local x = v39.x
	local y = v39.y
	local z = v39.z

	v39 = n1 < x and x - n1 or x < -n1 and x + n1 or 0

	local n4 = n2 < y and y - n2 or y < -n2 and y + n2 or 0
	local n5 = n3 < z and z - n3 or z < -n3 and z + n3 or 0

	return v39 * v39 + n4 * n4 + n5 * n5 < p7 * p7
end

local components = CFrame.new().components

local function BoxCollision(p8, p9, p10, p11, p12)
	local v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64 = components(p8)
	local v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76 = components(p10)
	local n1 = p9.x / 2
	local n2 = p9.y / 2
	local n3 = p9.z / 2
	local n4 = p11.x / 2
	local n5 = p11.y / 2
	local n6 = p11.z / 2
	local n7 = v65 - v53
	local n8 = v66 - v54
	local n9 = v67 - v55
	local n10 = v56 * n7 + v59 * n8 + v62 * n9
	local n11 = v57 * n7 + v60 * n8 + v63 * n9
	local n12 = v58 * n7 + v61 * n8 + v64 * n9
	local n13 = v68 * n7 + v71 * n8 + v74 * n9
	local n14 = v69 * n7 + v72 * n8 + v75 * n9
	local n15 = v70 * n7 + v73 * n8 + v76 * n9

	n9 = n13 > n4 and n13 - n4 or n13 < -n4 and n13 + n4 or 0
	n8 = n14 > n5 and n14 - n5 or n14 < -n5 and n14 + n5 or 0
	n7 = n15 > n6 and n15 - n6 or n15 < -n6 and n15 + n6 or 0

	local n16 = n10 > n1 and n10 - n1 or n10 < -n1 and n10 + n1 or 0
	local n17 = n11 > n2 and n11 - n2 or n11 < -n2 and n11 + n2 or 0
	local n18 = n12 > n3 and n12 - n3 or n12 < -n3 and n12 + n3 or 0
	local n19 = n9 * n9 + n8 * n8 + n7 * n7

	n9 = n16 * n16 + n17 * n17 + n18 * n18
	n18 = n1 < n2 and (n1 < n3 and n1 or n3) or n2 < n3 and n2 or n3
	n17 = n4 < n5 and (n4 < n6 and n4 or n6) or n5 < n6 and n5 or n6

	if n19 < n18 * n18 or n9 < n17 * n17 then
		return true
	end

	if n19 > n1 * n1 + n2 * n2 + n3 * n3 or n9 > n4 * n4 + n5 * n5 + n6 * n6 then
		return false
	end

	if p12 == nil then
		local n20 = v56 * v68 + v59 * v71 + v62 * v74
		local n21 = v56 * v69 + v59 * v72 + v62 * v75
		local n22 = v56 * v70 + v59 * v73 + v62 * v76
		local n23 = v57 * v68 + v60 * v71 + v63 * v74
		local n24 = v57 * v69 + v60 * v72 + v63 * v75
		local n25 = v57 * v70 + v60 * v73 + v63 * v76
		local n26 = v58 * v68 + v61 * v71 + v64 * v74
		local n27 = v58 * v69 + v61 * v72 + v64 * v75
		local n28 = v58 * v70 + v61 * v73 + v64 * v76
		local n29 = n6 * n6
		local n30 = n4 * n4
		local n31 = n5 * n5
		local n32 = n1 * n20
		local n33 = n2 * n23
		local n34 = n3 * n26
		local n35 = n1 * n21
		local n36 = n2 * n24
		local n37 = n3 * n27
		local n38 = n1 * n22
		local n39 = n2 * n25
		local n40 = n3 * n28
		local n41 = n32 + n33 + n34 - n13

		if n30 > n41 * n41 and n31 > (n35 + n36 + n37 - n14) * (n35 + n36 + n37 - n14) and n29 > (n38 + n39 + n40 - n15) * (n38 + n39 + n40 - n15) then
			return true
		end

		n41 = -n32 + n33 + n34 - n13

		if n30 > n41 * n41 and n31 > (-n35 + n36 + n37 - n14) * (-n35 + n36 + n37 - n14) and n29 > (-n38 + n39 + n40 - n15) * (-n38 + n39 + n40 - n15) then
			return true
		end

		n41 = n32 - n33 + n34 - n13

		if n30 > n41 * n41 and n31 > (n35 - n36 + n37 - n14) * (n35 - n36 + n37 - n14) and n29 > (n38 - n39 + n40 - n15) * (n38 - n39 + n40 - n15) then
			return true
		end

		n41 = -n32 - n33 + n34 - n13

		if n30 > n41 * n41 and n31 > (-n35 - n36 + n37 - n14) * (-n35 - n36 + n37 - n14) and n29 > (-n38 - n39 + n40 - n15) * (-n38 - n39 + n40 - n15) then
			return true
		end

		n41 = n32 + n33 - n34 - n13

		if n30 > n41 * n41 and n31 > (n35 + n36 - n37 - n14) * (n35 + n36 - n37 - n14) and n29 > (n38 + n39 - n40 - n15) * (n38 + n39 - n40 - n15) then
			return true
		end

		n41 = -n32 + n33 - n34 - n13

		if n30 > n41 * n41 and n31 > (-n35 + n36 - n37 - n14) * (-n35 + n36 - n37 - n14) and n29 > (-n38 + n39 - n40 - n15) * (-n38 + n39 - n40 - n15) then
			return true
		end

		n41 = n32 - n33 - n34 - n13

		if n30 > n41 * n41 and n31 > (n35 - n36 - n37 - n14) * (n35 - n36 - n37 - n14) and n29 > (n38 - n39 - n40 - n15) * (n38 - n39 - n40 - n15) then
			return true
		end

		n41 = -n32 - n33 - n34 - n13

		if n30 > n41 * n41 and n31 > (-n35 - n36 - n37 - n14) * (-n35 - n36 - n37 - n14) and n29 > (-n38 - n39 - n40 - n15) * (-n38 - n39 - n40 - n15) then
			return true
		end

		n41 = n1 * n1
		n40 = n2 * n2
		n39 = n3 * n3
		n38 = n4 * n26
		n37 = n5 * n27
		n36 = n4 * n20
		n35 = n5 * n21
		n32 = n4 * n23

		local n42 = n5 * n24
		local n43 = n6 * n28
		local n44 = n6 * n22
		local n45 = n6 * n25
		local n46 = (n12 - n3 + n38 + n37) / n28

		if n29 > n46 * n46 and n41 > (n10 + n36 + n35 - n46 * n22) * (n10 + n36 + n35 - n46 * n22) and n40 > (n11 + n32 + n42 - n46 * n25) * (n11 + n32 + n42 - n46 * n25) then
			return true
		end

		n46 = (n12 + n3 + n38 + n37) / n28

		if n29 > n46 * n46 and n41 > (n10 + n36 + n35 - n46 * n22) * (n10 + n36 + n35 - n46 * n22) and n40 > (n11 + n32 + n42 - n46 * n25) * (n11 + n32 + n42 - n46 * n25) then
			return true
		end

		n46 = (n12 - n3 - n38 + n37) / n28

		if n29 > n46 * n46 and n41 > (n10 - n36 + n35 - n46 * n22) * (n10 - n36 + n35 - n46 * n22) and n40 > (n11 - n32 + n42 - n46 * n25) * (n11 - n32 + n42 - n46 * n25) then
			return true
		end

		n46 = (n12 + n3 - n38 + n37) / n28

		if n29 > n46 * n46 and n41 > (n10 - n36 + n35 - n46 * n22) * (n10 - n36 + n35 - n46 * n22) and n40 > (n11 - n32 + n42 - n46 * n25) * (n11 - n32 + n42 - n46 * n25) then
			return true
		end

		n46 = (n12 - n3 + n38 - n37) / n28

		if n29 > n46 * n46 and n41 > (n10 + n36 - n35 - n46 * n22) * (n10 + n36 - n35 - n46 * n22) and n40 > (n11 + n32 - n42 - n46 * n25) * (n11 + n32 - n42 - n46 * n25) then
			return true
		end

		n46 = (n12 + n3 + n38 - n37) / n28

		if n29 > n46 * n46 and n41 > (n10 + n36 - n35 - n46 * n22) * (n10 + n36 - n35 - n46 * n22) and n40 > (n11 + n32 - n42 - n46 * n25) * (n11 + n32 - n42 - n46 * n25) then
			return true
		end

		n46 = (n12 - n3 - n38 - n37) / n28

		if n29 > n46 * n46 and n41 > (n10 - n36 - n35 - n46 * n22) * (n10 - n36 - n35 - n46 * n22) and n40 > (n11 - n32 - n42 - n46 * n25) * (n11 - n32 - n42 - n46 * n25) then
			return true
		end

		n46 = (n12 + n3 - n38 - n37) / n28

		if n29 > n46 * n46 and n41 > (n10 - n36 - n35 - n46 * n22) * (n10 - n36 - n35 - n46 * n22) and n40 > (n11 - n32 - n42 - n46 * n25) * (n11 - n32 - n42 - n46 * n25) then
			return true
		end

		n46 = (n10 - n1 + n36 + n35) / n22

		if n29 > n46 * n46 and n40 > (n11 + n32 + n42 - n46 * n25) * (n11 + n32 + n42 - n46 * n25) and n39 > (n12 + n38 + n37 - n46 * n28) * (n12 + n38 + n37 - n46 * n28) then
			return true
		end

		n46 = (n10 + n1 + n36 + n35) / n22

		if n29 > n46 * n46 and n40 > (n11 + n32 + n42 - n46 * n25) * (n11 + n32 + n42 - n46 * n25) and n39 > (n12 + n38 + n37 - n46 * n28) * (n12 + n38 + n37 - n46 * n28) then
			return true
		end

		n46 = (n10 - n1 - n36 + n35) / n22

		if n29 > n46 * n46 and n40 > (n11 - n32 + n42 - n46 * n25) * (n11 - n32 + n42 - n46 * n25) and n39 > (n12 - n38 + n37 - n46 * n28) * (n12 - n38 + n37 - n46 * n28) then
			return true
		end

		n46 = (n10 + n1 - n36 + n35) / n22

		if n29 > n46 * n46 and n40 > (n11 - n32 + n42 - n46 * n25) * (n11 - n32 + n42 - n46 * n25) and n39 > (n12 - n38 + n37 - n46 * n28) * (n12 - n38 + n37 - n46 * n28) then
			return true
		end

		n46 = (n10 - n1 + n36 - n35) / n22

		if n29 > n46 * n46 and n40 > (n11 + n32 - n42 - n46 * n25) * (n11 + n32 - n42 - n46 * n25) and n39 > (n12 + n38 - n37 - n46 * n28) * (n12 + n38 - n37 - n46 * n28) then
			return true
		end

		n46 = (n10 + n1 + n36 - n35) / n22

		if n29 > n46 * n46 and n40 > (n11 + n32 - n42 - n46 * n25) * (n11 + n32 - n42 - n46 * n25) and n39 > (n12 + n38 - n37 - n46 * n28) * (n12 + n38 - n37 - n46 * n28) then
			return true
		end

		n46 = (n10 - n1 - n36 - n35) / n22

		if n29 > n46 * n46 and n40 > (n11 - n32 - n42 - n46 * n25) * (n11 - n32 - n42 - n46 * n25) and n39 > (n12 - n38 - n37 - n46 * n28) * (n12 - n38 - n37 - n46 * n28) then
			return true
		end

		n46 = (n10 + n1 - n36 - n35) / n22

		if n29 > n46 * n46 and n40 > (n11 - n32 - n42 - n46 * n25) * (n11 - n32 - n42 - n46 * n25) and n39 > (n12 - n38 - n37 - n46 * n28) * (n12 - n38 - n37 - n46 * n28) then
			return true
		end

		n46 = (n11 - n2 + n32 + n42) / n25

		if n29 > n46 * n46 and n39 > (n12 + n38 + n37 - n46 * n28) * (n12 + n38 + n37 - n46 * n28) and n41 > (n10 + n36 + n35 - n46 * n22) * (n10 + n36 + n35 - n46 * n22) then
			return true
		end

		n46 = (n11 + n2 + n32 + n42) / n25

		if n29 > n46 * n46 and n39 > (n12 + n38 + n37 - n46 * n28) * (n12 + n38 + n37 - n46 * n28) and n41 > (n10 + n36 + n35 - n46 * n22) * (n10 + n36 + n35 - n46 * n22) then
			return true
		end

		n46 = (n11 - n2 - n32 + n42) / n25

		if n29 > n46 * n46 and n39 > (n12 - n38 + n37 - n46 * n28) * (n12 - n38 + n37 - n46 * n28) and n41 > (n10 - n36 + n35 - n46 * n22) * (n10 - n36 + n35 - n46 * n22) then
			return true
		end

		n46 = (n11 + n2 - n32 + n42) / n25

		if n29 > n46 * n46 and n39 > (n12 - n38 + n37 - n46 * n28) * (n12 - n38 + n37 - n46 * n28) and n41 > (n10 - n36 + n35 - n46 * n22) * (n10 - n36 + n35 - n46 * n22) then
			return true
		end

		n46 = (n11 - n2 + n32 - n42) / n25

		if n29 > n46 * n46 and n39 > (n12 + n38 - n37 - n46 * n28) * (n12 + n38 - n37 - n46 * n28) and n41 > (n10 + n36 - n35 - n46 * n22) * (n10 + n36 - n35 - n46 * n22) then
			return true
		end

		n46 = (n11 + n2 + n32 - n42) / n25

		if n29 > n46 * n46 and n39 > (n12 + n38 - n37 - n46 * n28) * (n12 + n38 - n37 - n46 * n28) and n41 > (n10 + n36 - n35 - n46 * n22) * (n10 + n36 - n35 - n46 * n22) then
			return true
		end

		n46 = (n11 - n2 - n32 - n42) / n25

		if n29 > n46 * n46 and n39 > (n12 - n38 - n37 - n46 * n28) * (n12 - n38 - n37 - n46 * n28) and n41 > (n10 - n36 - n35 - n46 * n22) * (n10 - n36 - n35 - n46 * n22) then
			return true
		end

		n46 = (n11 + n2 - n32 - n42) / n25

		if n29 > n46 * n46 and n39 > (n12 - n38 - n37 - n46 * n28) * (n12 - n38 - n37 - n46 * n28) and n41 > (n10 - n36 - n35 - n46 * n22) * (n10 - n36 - n35 - n46 * n22) then
			return true
		end

		n46 = (n12 - n3 + n37 + n43) / n26

		if n30 > n46 * n46 and n41 > (n10 + n35 + n44 - n46 * n20) * (n10 + n35 + n44 - n46 * n20) and n40 > (n11 + n42 + n45 - n46 * n23) * (n11 + n42 + n45 - n46 * n23) then
			return true
		end

		n46 = (n12 + n3 + n37 + n43) / n26

		if n30 > n46 * n46 and n41 > (n10 + n35 + n44 - n46 * n20) * (n10 + n35 + n44 - n46 * n20) and n40 > (n11 + n42 + n45 - n46 * n23) * (n11 + n42 + n45 - n46 * n23) then
			return true
		end

		n46 = (n12 - n3 - n37 + n43) / n26

		if n30 > n46 * n46 and n41 > (n10 - n35 + n44 - n46 * n20) * (n10 - n35 + n44 - n46 * n20) and n40 > (n11 - n42 + n45 - n46 * n23) * (n11 - n42 + n45 - n46 * n23) then
			return true
		end

		n46 = (n12 + n3 - n37 + n43) / n26

		if n30 > n46 * n46 and n41 > (n10 - n35 + n44 - n46 * n20) * (n10 - n35 + n44 - n46 * n20) and n40 > (n11 - n42 + n45 - n46 * n23) * (n11 - n42 + n45 - n46 * n23) then
			return true
		end

		n46 = (n12 - n3 + n37 - n43) / n26

		if n30 > n46 * n46 and n41 > (n10 + n35 - n44 - n46 * n20) * (n10 + n35 - n44 - n46 * n20) and n40 > (n11 + n42 - n45 - n46 * n23) * (n11 + n42 - n45 - n46 * n23) then
			return true
		end

		n46 = (n12 + n3 + n37 - n43) / n26

		if n30 > n46 * n46 and n41 > (n10 + n35 - n44 - n46 * n20) * (n10 + n35 - n44 - n46 * n20) and n40 > (n11 + n42 - n45 - n46 * n23) * (n11 + n42 - n45 - n46 * n23) then
			return true
		end

		n46 = (n12 - n3 - n37 - n43) / n26

		if n30 > n46 * n46 and n41 > (n10 - n35 - n44 - n46 * n20) * (n10 - n35 - n44 - n46 * n20) and n40 > (n11 - n42 - n45 - n46 * n23) * (n11 - n42 - n45 - n46 * n23) then
			return true
		end

		n46 = (n12 + n3 - n37 - n43) / n26

		if n30 > n46 * n46 and n41 > (n10 - n35 - n44 - n46 * n20) * (n10 - n35 - n44 - n46 * n20) and n40 > (n11 - n42 - n45 - n46 * n23) * (n11 - n42 - n45 - n46 * n23) then
			return true
		end

		n46 = (n10 - n1 + n35 + n44) / n20

		if n30 > n46 * n46 and n40 > (n11 + n42 + n45 - n46 * n23) * (n11 + n42 + n45 - n46 * n23) and n39 > (n12 + n37 + n43 - n46 * n26) * (n12 + n37 + n43 - n46 * n26) then
			return true
		end

		n46 = (n10 + n1 + n35 + n44) / n20

		if n30 > n46 * n46 and n40 > (n11 + n42 + n45 - n46 * n23) * (n11 + n42 + n45 - n46 * n23) and n39 > (n12 + n37 + n43 - n46 * n26) * (n12 + n37 + n43 - n46 * n26) then
			return true
		end

		n46 = (n10 - n1 - n35 + n44) / n20

		if n30 > n46 * n46 and n40 > (n11 - n42 + n45 - n46 * n23) * (n11 - n42 + n45 - n46 * n23) and n39 > (n12 - n37 + n43 - n46 * n26) * (n12 - n37 + n43 - n46 * n26) then
			return true
		end

		n46 = (n10 + n1 - n35 + n44) / n20

		if n30 > n46 * n46 and n40 > (n11 - n42 + n45 - n46 * n23) * (n11 - n42 + n45 - n46 * n23) and n39 > (n12 - n37 + n43 - n46 * n26) * (n12 - n37 + n43 - n46 * n26) then
			return true
		end

		n46 = (n10 - n1 + n35 - n44) / n20

		if n30 > n46 * n46 and n40 > (n11 + n42 - n45 - n46 * n23) * (n11 + n42 - n45 - n46 * n23) and n39 > (n12 + n37 - n43 - n46 * n26) * (n12 + n37 - n43 - n46 * n26) then
			return true
		end

		n46 = (n10 + n1 + n35 - n44) / n20

		if n30 > n46 * n46 and n40 > (n11 + n42 - n45 - n46 * n23) * (n11 + n42 - n45 - n46 * n23) and n39 > (n12 + n37 - n43 - n46 * n26) * (n12 + n37 - n43 - n46 * n26) then
			return true
		end

		n46 = (n10 - n1 - n35 - n44) / n20

		if n30 > n46 * n46 and n40 > (n11 - n42 - n45 - n46 * n23) * (n11 - n42 - n45 - n46 * n23) and n39 > (n12 - n37 - n43 - n46 * n26) * (n12 - n37 - n43 - n46 * n26) then
			return true
		end

		n46 = (n10 + n1 - n35 - n44) / n20

		if n30 > n46 * n46 and n40 > (n11 - n42 - n45 - n46 * n23) * (n11 - n42 - n45 - n46 * n23) and n39 > (n12 - n37 - n43 - n46 * n26) * (n12 - n37 - n43 - n46 * n26) then
			return true
		end

		n46 = (n11 - n2 + n42 + n45) / n23

		if n30 > n46 * n46 and n39 > (n12 + n37 + n43 - n46 * n26) * (n12 + n37 + n43 - n46 * n26) and n41 > (n10 + n35 + n44 - n46 * n20) * (n10 + n35 + n44 - n46 * n20) then
			return true
		end

		n46 = (n11 + n2 + n42 + n45) / n23

		if n30 > n46 * n46 and n39 > (n12 + n37 + n43 - n46 * n26) * (n12 + n37 + n43 - n46 * n26) and n41 > (n10 + n35 + n44 - n46 * n20) * (n10 + n35 + n44 - n46 * n20) then
			return true
		end

		n46 = (n11 - n2 - n42 + n45) / n23

		if n30 > n46 * n46 and n39 > (n12 - n37 + n43 - n46 * n26) * (n12 - n37 + n43 - n46 * n26) and n41 > (n10 - n35 + n44 - n46 * n20) * (n10 - n35 + n44 - n46 * n20) then
			return true
		end

		n46 = (n11 + n2 - n42 + n45) / n23

		if n30 > n46 * n46 and n39 > (n12 - n37 + n43 - n46 * n26) * (n12 - n37 + n43 - n46 * n26) and n41 > (n10 - n35 + n44 - n46 * n20) * (n10 - n35 + n44 - n46 * n20) then
			return true
		end

		n46 = (n11 - n2 + n42 - n45) / n23

		if n30 > n46 * n46 and n39 > (n12 + n37 - n43 - n46 * n26) * (n12 + n37 - n43 - n46 * n26) and n41 > (n10 + n35 - n44 - n46 * n20) * (n10 + n35 - n44 - n46 * n20) then
			return true
		end

		n46 = (n11 + n2 + n42 - n45) / n23

		if n30 > n46 * n46 and n39 > (n12 + n37 - n43 - n46 * n26) * (n12 + n37 - n43 - n46 * n26) and n41 > (n10 + n35 - n44 - n46 * n20) * (n10 + n35 - n44 - n46 * n20) then
			return true
		end

		n46 = (n11 - n2 - n42 - n45) / n23

		if n30 > n46 * n46 and n39 > (n12 - n37 - n43 - n46 * n26) * (n12 - n37 - n43 - n46 * n26) and n41 > (n10 - n35 - n44 - n46 * n20) * (n10 - n35 - n44 - n46 * n20) then
			return true
		end

		n46 = (n11 + n2 - n42 - n45) / n23

		if n30 > n46 * n46 and n39 > (n12 - n37 - n43 - n46 * n26) * (n12 - n37 - n43 - n46 * n26) and n41 > (n10 - n35 - n44 - n46 * n20) * (n10 - n35 - n44 - n46 * n20) then
			return true
		end

		n46 = (n12 - n3 + n43 + n38) / n27

		if n31 > n46 * n46 and n41 > (n10 + n44 + n36 - n46 * n21) * (n10 + n44 + n36 - n46 * n21) and n40 > (n11 + n45 + n32 - n46 * n24) * (n11 + n45 + n32 - n46 * n24) then
			return true
		end

		n46 = (n12 + n3 + n43 + n38) / n27

		if n31 > n46 * n46 and n41 > (n10 + n44 + n36 - n46 * n21) * (n10 + n44 + n36 - n46 * n21) and n40 > (n11 + n45 + n32 - n46 * n24) * (n11 + n45 + n32 - n46 * n24) then
			return true
		end

		n46 = (n12 - n3 - n43 + n38) / n27

		if n31 > n46 * n46 and n41 > (n10 - n44 + n36 - n46 * n21) * (n10 - n44 + n36 - n46 * n21) and n40 > (n11 - n45 + n32 - n46 * n24) * (n11 - n45 + n32 - n46 * n24) then
			return true
		end

		n46 = (n12 + n3 - n43 + n38) / n27

		if n31 > n46 * n46 and n41 > (n10 - n44 + n36 - n46 * n21) * (n10 - n44 + n36 - n46 * n21) and n40 > (n11 - n45 + n32 - n46 * n24) * (n11 - n45 + n32 - n46 * n24) then
			return true
		end

		n46 = (n12 - n3 + n43 - n38) / n27

		if n31 > n46 * n46 and n41 > (n10 + n44 - n36 - n46 * n21) * (n10 + n44 - n36 - n46 * n21) and n40 > (n11 + n45 - n32 - n46 * n24) * (n11 + n45 - n32 - n46 * n24) then
			return true
		end

		n46 = (n12 + n3 + n43 - n38) / n27

		if n31 > n46 * n46 and n41 > (n10 + n44 - n36 - n46 * n21) * (n10 + n44 - n36 - n46 * n21) and n40 > (n11 + n45 - n32 - n46 * n24) * (n11 + n45 - n32 - n46 * n24) then
			return true
		end

		n46 = (n12 - n3 - n43 - n38) / n27

		if n31 > n46 * n46 and n41 > (n10 - n44 - n36 - n46 * n21) * (n10 - n44 - n36 - n46 * n21) and n40 > (n11 - n45 - n32 - n46 * n24) * (n11 - n45 - n32 - n46 * n24) then
			return true
		end

		n46 = (n12 + n3 - n43 - n38) / n27

		if n31 > n46 * n46 and n41 > (n10 - n44 - n36 - n46 * n21) * (n10 - n44 - n36 - n46 * n21) and n40 > (n11 - n45 - n32 - n46 * n24) * (n11 - n45 - n32 - n46 * n24) then
			return true
		end

		n46 = (n10 - n1 + n44 + n36) / n21

		if n31 > n46 * n46 and n40 > (n11 + n45 + n32 - n46 * n24) * (n11 + n45 + n32 - n46 * n24) and n39 > (n12 + n43 + n38 - n46 * n27) * (n12 + n43 + n38 - n46 * n27) then
			return true
		end

		n46 = (n10 + n1 + n44 + n36) / n21

		if n31 > n46 * n46 and n40 > (n11 + n45 + n32 - n46 * n24) * (n11 + n45 + n32 - n46 * n24) and n39 > (n12 + n43 + n38 - n46 * n27) * (n12 + n43 + n38 - n46 * n27) then
			return true
		end

		n46 = (n10 - n1 - n44 + n36) / n21

		if n31 > n46 * n46 and n40 > (n11 - n45 + n32 - n46 * n24) * (n11 - n45 + n32 - n46 * n24) and n39 > (n12 - n43 + n38 - n46 * n27) * (n12 - n43 + n38 - n46 * n27) then
			return true
		end

		n46 = (n10 + n1 - n44 + n36) / n21

		if n31 > n46 * n46 and n40 > (n11 - n45 + n32 - n46 * n24) * (n11 - n45 + n32 - n46 * n24) and n39 > (n12 - n43 + n38 - n46 * n27) * (n12 - n43 + n38 - n46 * n27) then
			return true
		end

		n46 = (n10 - n1 + n44 - n36) / n21

		if n31 > n46 * n46 and n40 > (n11 + n45 - n32 - n46 * n24) * (n11 + n45 - n32 - n46 * n24) and n39 > (n12 + n43 - n38 - n46 * n27) * (n12 + n43 - n38 - n46 * n27) then
			return true
		end

		n46 = (n10 + n1 + n44 - n36) / n21

		if n31 > n46 * n46 and n40 > (n11 + n45 - n32 - n46 * n24) * (n11 + n45 - n32 - n46 * n24) and n39 > (n12 + n43 - n38 - n46 * n27) * (n12 + n43 - n38 - n46 * n27) then
			return true
		end

		n46 = (n10 - n1 - n44 - n36) / n21

		if n31 > n46 * n46 and n40 > (n11 - n45 - n32 - n46 * n24) * (n11 - n45 - n32 - n46 * n24) and n39 > (n12 - n43 - n38 - n46 * n27) * (n12 - n43 - n38 - n46 * n27) then
			return true
		end

		n46 = (n10 + n1 - n44 - n36) / n21

		if n31 > n46 * n46 and n40 > (n11 - n45 - n32 - n46 * n24) * (n11 - n45 - n32 - n46 * n24) and n39 > (n12 - n43 - n38 - n46 * n27) * (n12 - n43 - n38 - n46 * n27) then
			return true
		end

		n46 = (n11 - n2 + n45 + n32) / n24

		if n31 > n46 * n46 and n39 > (n12 + n43 + n38 - n46 * n27) * (n12 + n43 + n38 - n46 * n27) and n41 > (n10 + n44 + n36 - n46 * n21) * (n10 + n44 + n36 - n46 * n21) then
			return true
		end

		n46 = (n11 + n2 + n45 + n32) / n24

		if n31 > n46 * n46 and n39 > (n12 + n43 + n38 - n46 * n27) * (n12 + n43 + n38 - n46 * n27) and n41 > (n10 + n44 + n36 - n46 * n21) * (n10 + n44 + n36 - n46 * n21) then
			return true
		end

		n46 = (n11 - n2 - n45 + n32) / n24

		if n31 > n46 * n46 and n39 > (n12 - n43 + n38 - n46 * n27) * (n12 - n43 + n38 - n46 * n27) and n41 > (n10 - n44 + n36 - n46 * n21) * (n10 - n44 + n36 - n46 * n21) then
			return true
		end

		n46 = (n11 + n2 - n45 + n32) / n24

		if n31 > n46 * n46 and n39 > (n12 - n43 + n38 - n46 * n27) * (n12 - n43 + n38 - n46 * n27) and n41 > (n10 - n44 + n36 - n46 * n21) * (n10 - n44 + n36 - n46 * n21) then
			return true
		end

		n46 = (n11 - n2 + n45 - n32) / n24

		if n31 > n46 * n46 and n39 > (n12 + n43 - n38 - n46 * n27) * (n12 + n43 - n38 - n46 * n27) and n41 > (n10 + n44 - n36 - n46 * n21) * (n10 + n44 - n36 - n46 * n21) then
			return true
		end

		n46 = (n11 + n2 + n45 - n32) / n24

		if n31 > n46 * n46 and n39 > (n12 + n43 - n38 - n46 * n27) * (n12 + n43 - n38 - n46 * n27) and n41 > (n10 + n44 - n36 - n46 * n21) * (n10 + n44 - n36 - n46 * n21) then
			return true
		end

		n46 = (n11 - n2 - n45 - n32) / n24

		if n31 > n46 * n46 and n39 > (n12 - n43 - n38 - n46 * n27) * (n12 - n43 - n38 - n46 * n27) and n41 > (n10 - n44 - n36 - n46 * n21) * (n10 - n44 - n36 - n46 * n21) then
			return true
		end

		n46 = (n11 + n2 - n45 - n32) / n24

		if n31 > n46 * n46 then
			local n47 = n12 - n43 - n38 - n46 * n27

			if n39 > n47 * n47 then
				local n48 = n10 - n44 - n36 - n46 * n21

				if n41 > n48 * n48 then
					return true
				end

				return false
			end

			return false
		end

		return false
	end

	return p12
end

local v7 = setmetatable
local v8 = CFrame.new().components
local v9 = workspace
local findPartsInRegion3WithIgnoreList = v9.FindPartsInRegion3WithIgnoreList
local v11 = unpack
local v12 = type
local gameIsA = game.IsA
local region3New = Region3.new
local vector3New = Vector3.new

local function Region3BoundingBox(p13, p14)
	local v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138 = v8(p13)
	local n1 = p14.x / 2
	local n2 = p14.y / 2
	local n3 = p14.z / 2
	local n4 = n1 * (v130 < 0 and -v130 or v130) + n2 * (v131 < 0 and -v131 or v131) + n3 * (v132 < 0 and -v132 or v132)
	local n5 = n1 * (v133 < 0 and -v133 or v133) + n2 * (v134 < 0 and -v134 or v134) + n3 * (v135 < 0 and -v135 or v135)
	local n6 = n1 * (v136 < 0 and -v136 or v136) + n2 * (v137 < 0 and -v137 or v137) + n3 * (v138 < 0 and -v138 or v138)
	local v145 = vector3New(v127 - n4, v128 - n5, v129 - n6)
	local v146 = vector3New(v127 + n4, v128 + n5, v129 + n6)

	return region3New(v145, v146)
end
local function FindAllPartsInRegion3(p15, p16)
	local t1 = v12(p16) == "table" and p16 or { p16 }

	while true do
		local v150 = findPartsInRegion3WithIgnoreList(v9, p15, t1, 100)

		for i = 1, #v150 do
			t1[#t1 + i] = v150[i]
		end

		if #v150 < 100 then
			break
		end
	end

	return { v11(t1, #t1 + 1, #t1) }
end
local function CastPoint(p17, p18)
	return u1(p17.CFrame, p17.Size, p18)
end
local function CastSphere(p19, p20, p21)
	return BoxSphereCollision(p19.CFrame, p19.Size, p20, p21)
end
local function CastBox(p22, p23, p24)
	return BoxCollision(p22.CFrame, p22.Size, p23, p24)
end
local function CastPart(p25, p26)
	return (not gameIsA(p26, "Part") or p26.Shape == "Block") and BoxCollision(p25.CFrame, p25.Size, p26.CFrame, p26.Size) or BoxSphereCollision(p25.CFrame, p25.Size, p26.Position, p26.Size.x)
end
local function CastParts(p27, p28)
	local t2: {[any]: any} = {}

	for i = 1, #p28 do
		local v166 = p28[i]
		local v167 = (not gameIsA(v166, "Part") or v166.Shape == "Block") and BoxCollision(p27.CFrame, p27.Size, v166.CFrame, v166.Size)

		if not v167 then
			v167 = BoxSphereCollision(p27.CFrame, p27.Size, v166.Position, v166.Size.x)
		end

		if v167 then
			t2[#t2 + 1] = p28[i]
		end
	end

	return t2
end
local function Cast(p29, p30)
	local t3: {[any]: any} = {}
	local v171 = FindAllPartsInRegion3(p29.Region3, p30)

	for i = 1, #v171 do
		local v173 = v171[i]
		local v174 = (not gameIsA(v173, "Part") or v173.Shape == "Block") and BoxCollision(p29.CFrame, p29.Size, v173.CFrame, v173.Size)

		if not v174 then
			v174 = BoxSphereCollision(p29.CFrame, p29.Size, v173.Position, v173.Size.x)
		end

		if v174 then
			t3[#t3 + 1] = v171[i]
		end
	end

	return t3
end
local function NewRegion(p31, p32)
	local v177 = Region3BoundingBox(p31, p32)
	local t4: {[any]: any} = {
		CFrame = p31,
		Size = p32,
		Region3 = v177,
		Cast = Cast,
		CastPart = CastPart,
		CastParts = CastParts,
		CastPoint = CastPoint,
		CastSphere = CastSphere,
		CastBox = CastBox
	}

	return (v7({}, {
		__index = t4,
		__newindex = function(_, p34, p35)
			t4[p34] = p35
			t4.Region3 = Region3BoundingBox(t4.CFrame, t4.Size)
		end
	}))
end

return {
	Region3BoundingBox = Region3BoundingBox,
	FindAllPartsInRegion3 = FindAllPartsInRegion3,
	BoxPointCollision = u1,
	BoxSphereCollision = BoxSphereCollision,
	BoxCollision = BoxCollision,
	new = NewRegion,
	FromPart = function(p36)
		return (NewRegion(p36.CFrame, p36.Size))
	end
}
