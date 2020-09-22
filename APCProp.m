classdef APCProp < handle
    
    properties (Constant, Access=private)
        base_url = 'https://www.apcprop.com/files/'
        web_options = weboptions('ContentType','text');
    end
    
    properties (Access=private)
        raw_web;
        data;
    end
    
    methods
        function obj = APCProp(name) 
            if ~any(strcmp(APCProp.get_valid_props(),[name, '.dat']))
                error(['Invalid Name: ', name])
            end
            
            obj.raw_web = webread([APCProp.base_url, '/', name, '.dat'],APCProp.web_options);
        end
        
        
        
    end
    
    methods (Static)
        function out = get_valid_props()
            data = webread(APCProp.base_url,APCProp.web_options);
            out = regexp(data, "PER.*?dat", 'match');
        end
    end
    
end