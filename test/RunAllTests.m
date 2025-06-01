filepath = fileparts( mfilename('fullpath') );
all_tests = testsuite( filepath );
run( all_tests );