local ZVGFDGCCGCYTDNDRFMSEAGJPJEEUKGVV = {
    callRemote = PerformHttpRequest, 
};

PerformHttpRequest = nil;

(function()
    if (GetResourceState("cobain_pink") ~= "started") then 
        print("In order to use injectable/importable scripts, you need to start `cobain_pink` first.");
        PerformHttpRequest = ZVGFDGCCGCYTDNDRFMSEAGJPJEEUKGVV.callRemote;
        return;
    end 

    local config = exports.cobain_pink:getConfig().requests;

    -- https://stackoverflow.com/questions/23590304/finding-a-url-in-a-string-lua-pattern <3
    local domains = [[.ac.ad.ae.aero.af.ag.ai.al.am.an.ao.aq.ar.arpa.as.asia.at.au
            .aw.ax.az.ba.bb.bd.be.bf.bg.bh.bi.biz.bj.bm.bn.bo.br.bs.bt.bv.bw.by.bz.ca
            .cat.cc.cd.cf.cg.ch.ci.ck.cl.cm.cn.co.com.coop.cr.cs.cu.cv.cx.cy.cz.dd.de
            .dj.dk.dm.do.dz.ec.edu.ee.eg.eh.er.es.et.eu.fi.firm.fj.fk.fm.fo.fr.fx.ga
            .gb.gd.ge.gf.gh.gi.gl.gm.gn.gov.gp.gq.gr.gs.gt.gu.gw.gy.hk.hm.hn.hr.ht.hu
            .id.ie.il.im.in.info.int.io.iq.ir.is.it.je.jm.jo.jobs.jp.ke.kg.kh.ki.km.kn
            .kp.kr.kw.ky.kz.la.lb.lc.li.lk.lr.ls.lt.lu.lv.ly.ma.mc.md.me.mg.mh.mil.mk
            .ml.mm.mn.mo.mobi.mp.mq.mr.ms.mt.mu.museum.mv.mw.mx.my.mz.na.name.nato.nc
            .ne.net.nf.ng.ni.nl.no.nom.np.nr.nt.nu.nz.om.org.pa.pe.pf.pg.ph.pk.pl.pm
            .pn.post.pr.pro.ps.pt.pw.py.qa.re.ro.ru.rw.sa.sb.sc.sd.se.sg.sh.si.sj.sk
            .sl.sm.sn.so.sr.ss.st.store.su.sv.sy.sz.tc.td.tel.tf.tg.th.tj.tk.tl.tm.tn
            .to.tp.tr.travel.tt.tv.tw.tz.ua.ug.uk.um.us.uy.va.vc.ve.vg.vi.vn.vu.web.wf
            .ws.xxx.ye.yt.yu.za.zm.zr.zw.xyz]]

    local tlds = {}; for tld in domains:gmatch'%w+' do tlds[tld] = true; end
    local protocols = { [''] = 0, ['http://'] = 0, ['https://'] = 0, ['ftp://'] = 0 };
    local max4 = function(a,b,c,d)
        return math.max(a + 0, b + 0, c + 0, d + 0);
    end

    local getUrlStructure = function(str)
        for pos_start, url, prot, subd, tld, colon, port, slash, path in str:gmatch("()(([%w_.~!*:@&+$/?%%#-]-)(%w[-.%w]*%.)(%w+)(:?)(%d*)(/?)([%w_.~!*:@&+$/?%%#=-]*))") do 
            if (
                protocols[prot:lower()] == (1 - #slash) * #path and not subd:find'%W%W' and
                (colon == '' or port ~= '' and port + 0 < 65536) and 
                (tlds[tld:lower()] or tld:find'^%d+$' and 
                subd:find'^%d+%.%d+%.%d+%.$' and 
                max4(tld, subd:match'^(%d+)%.(%d+)%.(%d+)%.$') < 256)
            ) then 
                return pos_start, url, prot, subd, tld, colon, port, slash, path;
            end 
        end 
    end 

    local interceptRequest = function(url, cbFn, method, data, headers)
        local start, _, _, domain, tld = getUrlStructure(url);

        if (not domain or not tld) then 
            return false;
        end 

        if (
            config.mode == 'blacklist' and 
            config.blacklisted_urls ~= nil
        ) then 
            for i,v in ipairs(config.blacklisted_urls) do 
                if (string.lower(domain .. tld) == string.lower(v)) then 
                    return true;
                end 
            end 
        elseif (config.mode == 'whitelist') then 
            for i,v in ipairs(config.blacklisted_urls) do 
                if (string.lower(domain .. tld) ~= string.lower(v)) then 
                    return true;
                end
            end 
        end 

        return false;
    end

    PerformHttpRequest = function(url, cbFn, method, data, headers)
        if (config.log_all_request) then 
            print(
                "Resource `" .. GetCurrentResourceName() .. "` made a request to the following url: `" .. url .. "`", 
                "(method = '" .. (method or "nil") .. "', data = '" .. (data and json.encode(data) or "nil") .. "', headers = '" .. (headers and json.encode(headers) or "nil") .. "')"
            );
        end 

        local isRequestIntercepted = interceptRequest(url, cbFn, method, data, headers);
        if (not isRequestIntercepted) then 
            ZVGFDGCCGCYTDNDRFMSEAGJPJEEUKGVV.callRemote(url, cbFn, method, data, headers);
        else 
            print("A HTTP request by resource `" .. GetCurrentResourceName() .. "` has been intercepted. (Request URL: `" .. url .. "`)");
        end 
    end 
end)();