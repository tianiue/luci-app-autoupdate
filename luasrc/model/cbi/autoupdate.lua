require("luci.sys")

m=Map("autoupdate",translate("AutoUpdate"),translate("Openwrt-AutoUpdate is a script that AutoUpgrade Firmware"))

s=m:section(TypedSection,"login","")
s.addremove=false
s.anonymous=true

enable=s:option(Flag,"enable",translate("Enable AutoUpdate"))
forceupdate=s:option(Flag,"forceupdate",translate("Force Update"), translate("If no new version is detected,do upgrade also"))
enable.rmempty = false
enable.default=0

week=s:option(ListValue,"week",translate("Week Day"))
week:value(7,translate("Everyday"))
week:value(1,translate("Monday"))
week:value(2,translate("Tuesday"))
week:value(3,translate("Wednesday"))
week:value(4,translate("Thursday"))
week:value(5,translate("Friday"))
week:value(6,translate("Saturday"))
week:value(0,translate("Sunday"))
week.default=0

hour=s:option(Value,"hour",translate("Hour"))
hour.datatype = "range(0,23)"
hour.rmempty = false

pass=s:option(Value,"minute",translate("Minute"))
pass.datatype = "range(0,59)"
pass.rmempty = false

local e=luci.http.formvalue("cbi.apply")
if e then
  io.popen("/etc/init.d/autoupdate restart")
end

return m
