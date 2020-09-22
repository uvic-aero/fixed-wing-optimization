classdef Airplane < handle
    %AIRPLANE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        wings = containers.Map;
        fuselage_mass = 1;%kg
        payload_mass = 0;%kg
        velocity = []    
        powerplants = []
    end
    
    methods
        function obj = Airplane()
            %AIRPLANE Construct an instance of this class
            %   Detailed explanation goes here
        end
        
        function addWing(obj,wing, centre_of_mass)
            %addWing define a new Airfoil
            %   Centre of mass should have x, y,z
            wing.c_mass = centre_of_mass;
            obj.wings(wing.name) = wing;
        end
    end
end

