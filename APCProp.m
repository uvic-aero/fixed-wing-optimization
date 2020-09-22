classdef APCProp < handle
    
    properties (Constant, Access=private)
        base_url = 'https://www.apcprop.com/files/'
        web_options = weboptions('ContentType','text');
    end
    
    properties %(Access=private)
        raw_web;
        data; %3D data structure: rpm, v or Thrust
    end
    
    methods
        function obj = APCProp(name) 
            if ~any(strcmp(APCProp.get_valid_props(),[name, '.dat']))
                error(['Invalid Name: ', name])
            end
            
            obj.raw_web = webread([APCProp.base_url, '/', name, '.dat'],APCProp.web_options);
            
            rpm_sets = regexp(obj.raw_web, "PROP RPM.*?\s{300}", 'match');
            for i=1:numel(rpm_sets)
                rpm_temp = regexp(rpm_sets{i}, "RPM =\s*(\d*)", 'tokens', 'dotexceptnewline');
               
                rpm(i) = str2double(rpm_temp{1});
            end
            
        end
        
        function out=thrust(obj, vel, rpm)
            %TODO use map
           out = 0; 
        end
        
        function out=torque(obj, vel, rpm)
           %TODO use mao
           out = 0;
        end
        
        
        
    end
    
    methods (Static)
        function out = get_valid_props()
            data = webread(APCProp.base_url,APCProp.web_options);
            out = regexp(data, "PER.*?dat", 'match');
        end
    end
    
end