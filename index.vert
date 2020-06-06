float linearise(float depth, float near, float far) {
	return -far * near / (depth * (far - near) - far);
}

float dof(float depth, float focalDepth, float focalLength, float fstop, float near, float far) {
	// convert to mm
	float f = focalLength;
	float d = focalDepth * 1000.0;
	float o = linearise(depth, near, far) * 1000.0;

	// circle of confusion mm (35mm film = 0.03mm)
	float CoC = 0.03;

	float a = (o * f) / (o - f); 
	float b = (d * f) / (d - f); 
	float c = (d - f) / (d * fstop * CoC); 
	
	float blur = abs(a - b) * c;

	return blur;
}

float dof(float depth, float focalDepth) {
	return dof(depth, focalDepth, 10.0, 2.0, 0.01, 100.0);
}

#pragma glslify: export(dof)
