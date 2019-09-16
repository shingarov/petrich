drawing
drawRegistersOn: clippedCanvas
	self drawSPRsOn: clippedCanvas fromHeight:
		(self drawGPRsOn: clippedCanvas) + 15
 