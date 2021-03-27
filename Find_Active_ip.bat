for /l %h IN (0,1,255) do ping 192.168.2.%h -l 1 -n 1
