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


#VALIDATION
show run | begin router bgp 1
