SharedConfig = {
    heartbeat = {
        generate = function()
            local shared_secret = "xzk2UCn8vcS67cUrmYKP6EicWj3ku6Eg";
            local hours, mins, secs;

            if (IsDuplicityVersion()) then 
                hours, mins, secs = tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S"));
            else 
                years, months, days, hours, mins, secs = GetLocalTime();
            end 

            return (type(encode) == 'function')
                    and encode(
                        shared_secret, 
                        (hours * mins * (secs * 0.119)) ^ 4, 
                        (mins * hours * (secs * 0.119)) ^ 2) 
                    or false;
        end,
    },
};

exports("getSharedConfig", function() return Config; end);