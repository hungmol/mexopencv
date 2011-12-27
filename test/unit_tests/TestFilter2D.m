classdef TestFilter2D
    %TestFilter2D
    properties (Constant)
        img = [...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            ];
    end
    
    methods (Static)
        function test_1
            kernel = [...
                0 0 1;...
                1 1 1;...
                1 1 1;...
                ];
            reference = filter2(kernel,TestFilter2D.img);
            result = filter2D(TestFilter2D.img,kernel);
            assert(all(abs(reference(:) - result(:)) < 1e-15));
        end
        
        function test_2
            kernel = [...
                0 0 1;...
                1 1 1;...
                ];

            reference = filter2(kernel,TestFilter2D.img);
            result = filter2D(TestFilter2D.img,kernel,...
                'Anchor',floor((size(kernel)-1)/2));
            assert(all(abs(reference(:) - result(:)) < 1e-15));
        end
        
        function test_3
            kernel = [...
                1 1 1;...
                ];

            reference = filter2(kernel,TestFilter2D.img);
            result = filter2D(TestFilter2D.img,kernel);
            assert(all(abs(reference(:) - result(:)) < 1e-15));
            
            reference = filter2(kernel,TestFilter2D.img);
            result = filter2D(TestFilter2D.img,kernel);
            assert(all(abs(reference(:) - result(:)) < 1e-15));
        end
        
        function test_4
            kernel = 1;
            reference = filter2(kernel,TestFilter2D.img);
            result = filter2D(TestFilter2D.img,kernel);
            assert(all(abs(reference(:) - result(:)) < 1e-15));
        end
        
        function test_error_1
            try
                filter2D();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'filter2D:invalidArgs'));
            end
        end
    end
    
end

