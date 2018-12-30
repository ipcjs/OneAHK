; 插入时间
SendTimeByFormat(format){
	FormatTime, CurrentDateTime,, %format%
	SendInput %CurrentDateTime%
}
::date1::
SendTimeByFormat("yyyy-MM-dd")
return
::date2::
SendTimeByFormat("yyyy/MM/dd")
return
::date3::
SendTimeByFormat("yyyy/M/d")
return
::time1::
SendTimeByFormat("HH:mm:ss")
return
::sj1::
::datetime1::
SendTimeByFormat("yyyy-MM-dd HH:mm:ss")
return