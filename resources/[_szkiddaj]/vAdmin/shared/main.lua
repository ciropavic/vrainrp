AdminLevels = {
    user = 0,
    junior_admin = 1, 
    admin = 2, 
    senior_admin = 3, 
    community_manager = 4, 
    foadmin = 5, 
    szuperadmin = 6, 
    tulajdonos = 7, 
    fejleszto = 8, 
}; for k, v in pairs(AdminLevels) do AdminLevels[v] = k; end

AdminTitles = {
    [0] = "Játékos",
    [1] = "Junior Admin",
    [2] = "Admin",
    [3] = "Senior Admin",
    [4] = "Community Manager",
    [5] = "Lead Admin",
    [6] = "Super Admin",
    [7] = "Project Owner",
    [8] = "Developer",
};

AdminColors = {
    [0] = { hex = "c8c8c8", gamecolor = 4 },
    [1] = { hex = "5ddbd7", gamecolor = 171 },
    [2] = { hex = "975fea", gamecolor = 21 },
    [3] = { hex = "975fea", gamecolor = 21 },
    [4] = { hex = "b8a8ff", gamecolor = 22 }, -- 151
    [5] = { hex = "ef925f", gamecolor = 192 }, -- 145
    [6] = { hex = "eaea5f", gamecolor = 58 }, -- 194
    [7] = { hex = "700c0c", gamecolor = 174 },
    [8] = { hex = "5feaa4", gamecolor = 122 }
};

exports("getAdminLevels", function() return AdminLevels; end);
exports("getAdminTitles", function() return AdminTitles; end);
exports("getAdminColors", function() return AdminColors; end);