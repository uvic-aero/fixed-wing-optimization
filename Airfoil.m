classdef Airfoil < handle
    %AIRFOIL A class that is used to describe a NACA airfoil profile
    %   Use this to get the Cl and Cd for a given profile based on the
    %   Reynolds number and Angle of Attack
    
    properties
        name = "0009";
        Re = 1e6; %Reynolds number for the chord
        chord = 1;%m
        span = 1;%m
        mass = 1;%kg
        c_mass; %With respect to the plane's total CM
    end
    
    methods
        function obj = Airfoil(name,Re)
            %AIRFOIL Construct an instance of this class
            %   Detailed explanation goes here
            obj.name = name;
            obj.Re = Re;
        end
        
        function Clift = Cl(obj, alpha)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            % use xfoil
            Clift = alpha/45;
        end
        
        function Cdrag = Cd(obj, alpha)
           Cdrag = alpha/450; 
        end
    end
end

