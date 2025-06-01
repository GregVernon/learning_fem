function to_value = ChangeOfVariable( from_domain, to_domain, from_value )
    arguments
        from_domain (1,2) {mustBeNumeric}
        to_domain   (1,2) {mustBeNumeric}
        from_value  (1,1) {mustBeNumeric}
    end
    % SHIFT TO ZERO
    to_value = from_value - from_domain(1);
    % SCALE TO EQUAL RANGE
    to_value = to_value * ( to_domain(2) - to_domain(1) ) / ( from_domain(2) - from_domain(1) );
    % APPLY TO DOMAIN
    to_value = to_value + to_domain(1);
end