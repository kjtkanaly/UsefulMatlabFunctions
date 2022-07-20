function [u, v, w] = AzEl2UV(Az, El, tiltAz, tiltEl)

	% Convert to Radians
	Az = Az .* pi ./ 180;
	El = El .* pi ./ 180;
	tiltAz = tiltAz .* pi ./ 180;
	tiltEl = tiltEl .* pi ./ 180;
	
	% Convert to UV
	u = cos(El) .* sin(Az - tiltAz);
	v = sin(El - tiltEl) + cos(El) .* sin(tiltEl) .* (1 - cos(tiltAz - Az));
	w = sin(El) .* sin(tiltEl) + cos(El) .* cos(tiltEl) .* cos(tiltAz - Az);	

end
