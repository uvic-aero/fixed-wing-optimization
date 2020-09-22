classdef BrushlessDCProp < handle
    properties
       prop_pitch = 12*0.254;%m/rotation 
       max_torque = 10;%Nm
       omega = 300*pi/30;%rad/s
       
    end
    
    methods
        function obj = BrushlessDCProp()

        end
        
        function F = thrust(obj, air_vel)
            
        end
    end 
end
