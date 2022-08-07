function encode(str, secret1, secret2)
    if (not secret1 or not secret2) then 
        return false;
    end 

    if not inv256 then
        inv256 = {}
        for M = 0, 127 do
            local inv = -1
            repeat
                inv = inv + 2
            until inv * (2 * M + 1) % 256 == 1
            inv256[M] = inv
        end
    end
    local K, F = secret1, 16384 + secret2
    return (str:gsub(
        ".",
        function(m)
            local L = K % 274877906944 -- 2^38
            local H = (K - L) / 274877906944
            local M = H % 128
            m = m:byte()
            local c = (m * inv256[M] - (H - M) / 128) % 256
            K = L * F + H + c + m
            return ("%02x"):format(c)
        end
    ));
end
