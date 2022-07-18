function pow = FindMagnitudeOfValue(value)

	pow = 0;

	while (value >= 10)
		value = value / 10;
		pow = pow + 1;
	end

	while (value < 1)
		value = value * 10;
		pow = pow - 1;
	end

end