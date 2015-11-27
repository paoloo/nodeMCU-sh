local shell = {}

shell.cat = function(arquivo)
  file.open(arquivo,"r")
  print(file.read())
  file.close()
end

shell.ls = function()
  for k,v in pairs(file.list()) do
    print(k,v)
  end
end

shell.ip = function()
  print(wifi.sta.getip())
end

shell.wifi = function(rede,senha)
  wifi.setmode(wifi.STATION)
  wifi.sta.config(rede,senha)
end

shell.lswifi = function()
  function listap(t)
    for k,v in pairs(t) do
      print(k.." : "..v)
    end
  end
  wifi.sta.getap(listap)
end

shell.rm = function(arquivo)
  file.remove(arquivo)
end

shell.mv = function(org, dst)
  file.rename(org, dst)
end

shell.cp = function(org, dst)
  file.open(org,"r")
  local conteudo = file.read()
  file.close()
  file.open(dst,"w")
  file.write(conteudo)
  file.close()
end

shell.df = function()
  _r, _u, _t=file.fsinfo()
  print("Size\tUsed\tAvail\n".._t.."\t".._u.."\t".._r.."\n")
end

shell.whois = function(url)
  sk=net.createConnection(net.TCP, 0)
  sk:dns(url,function(conn,ip) print(url.." is "..ip) end)
  sk=nil
end

return shell
