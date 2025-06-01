classdef Test_ChangeOfVariable < matlab.unittest.TestCase
    methods (Test) % Functionality
        function test_InputUnitDomain_ReturnUnitDomain( testCase )
            from_domain = [0, 1];
            to_domain = [0, 1];
            from_value = [ 0.0, 0.5, 1.0 ];
            expected = [ 0.0, 0.5, 1.0 ];
            for ii = 1 : length( expected )
                computed = ChangeOfVariable( from_domain, to_domain, from_value(ii) );
                testCase.verifyEqual( computed, expected(ii), AbsTol=1e-12 );
            end
        end

        function test_InputUnitDomain_ReturnBiunitDomain( testCase )
            from_domain = [0, 1];
            to_domain = [-1, 1];
            from_value = [ 0.0, 0.5, 1.0 ];
            expected = [ -1.0, 0.0, 1.0 ];
            for ii = 1 : length( expected )
                computed = ChangeOfVariable( from_domain, to_domain, from_value(ii) );
                testCase.verifyEqual( computed, expected(ii), AbsTol=1e-12 );
            end
        end

        function test_InputBiunitDomain_ReturnUnitDomain( testCase )
            from_domain = [-1, 1];
            to_domain = [0, 1];
            from_value = [ -1.0, 0.0, 1.0 ];
            expected = [ 0.0, 0.5, 1.0 ];
            for ii = 1 : length( expected )
                computed = ChangeOfVariable( from_domain, to_domain, from_value(ii) );
                testCase.verifyEqual( computed, expected(ii), AbsTol=1e-12 );
            end
        end
    end

    methods (Test) % Argument handling
        function test_InputTwoNumericArrays_ReturnError( testCase )
            from_domain = [-1, 1];
            to_domain = [0, 1];
            from_value = [ -1.0, 0.0, 1.0 ];
            expected = 'MATLAB:validation:IncompatibleSize';
            computed = @() ChangeOfVariable( from_domain, to_domain, from_value );
            testCase.verifyThat( computed, matlab.unittest.constraints.Throws( expected ) )
        end
    end
end