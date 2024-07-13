local TL, T, TR, L, R, BL, B, BR = 1, 2, 4, 8, 16, 32, 64, 128

Concord.component("ruletile", function(e, props)
	e.rules = {
		{ mask = T + L + R + B + TL + TR + BL + BR, resource = "Cave-Stone-Tile" },

		{ mask = T + L + R + B + TL + TR + BL, resource = "Cave-Stone-Outer-TL" },
		{ mask = T + L + R + B + TL + TR + BR, resource = "Cave-Stone-Outer-TR" },
		{ mask = T + L + R + B + TL + BL + BR, resource = "Cave-Stone-Outer-BL" },
		{ mask = T + L + R + B + TR + BL + BR, resource = "Cave-Stone-Outer-BR" },
		
		{ mask = L + R + B, resource = "Cave-Stone-B" },
		{ mask = T + R + B, resource = "Cave-Stone-R" },
		{ mask = T + L + B, resource = "Cave-Stone-L" },
		{ mask = T + L + R, resource = "Cave-Stone-T" },

		{ mask = R + B, resource = "Cave-Stone-TL" },
		{ mask = L + B, resource = "Cave-Stone-TR" },
		{ mask = T + R, resource = "Cave-Stone-BL" },
		{ mask = T + L, resource = "Cave-Stone-BR" },
	}
end)
