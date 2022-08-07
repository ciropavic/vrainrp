Config = {
    events = {
        trigger_unsafe_events = false, -- nem atsyncelt (marmint unique kulcs nincs meg) eventet meghivja-e
        output_unsafe_error = true,
    },
};

exports("getConfig", function() return Config; end);