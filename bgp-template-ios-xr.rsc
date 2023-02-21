#Pertama setting dulu bgp standar nya
router bgp 1
    bgp router-id 1.1.1.1
    address-family ipv4 unicast
        network 192.168.1.0/24
    
    neighbor 1.1.1.2
        remote-as 11
        address-family ipv4 unicast

    neighbor 1.1.1.3
        remote-as 12
        address-family ipv4 unicast
end

#buat route-policy ato bisa dibilang route-map buat allow prefix
route-policy ALLOW-TEST
    pass
    exit
commit

#masukin route-policy yg td dibuat ke router bgp neighbor
router bgp 1
    neighbor 1.1.1.2
        address-family ipv4 unicast
            route-policy ALLOW-TEST in
            route-policy ALLOW-TEST out
commit

#VALIDATION
show run | begin router bgp 1

show bgp neighbor 1.1.1.2 | begin ipv4 Unicast 

#REFERENCE
https://belajarcomputernetwork.com/tag/route-map/