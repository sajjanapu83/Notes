```diff
- https://commotionwireless.net/docs/cck/networking/learn-networking-basics/
- https://phet.colorado.edu/sims/html/circuit-construction-kit-dc/latest/circuit-construction-kit-dc_en.html

Scenario 1: Two Processes(client , Server) present with in the same host:
   Sender & Receiver communicate with each other using a concept called IPC ( Inter Process Communication )
Scenario 2: Two Processes present in the different host present in different locations: 
   Sender ( Client ) & Receiver ( Server) communicate with each other with the help of Hardware/Software functionalities          provided by the Computer Networks, in such a manner that they think they are actually talking to each other with in the        same host & same network.
   
Nearly 70+ mandatory functionalities are present. The closely related one's are grouped together & formed layers.
Advantages of Layering
- Divide & Conquer
- Encapsulation
- Abstraction
- Testing made easy 

Depending upon various Hardware/Software functionalities and groupings, there are several referenece models. Few of them are
- ISO-OSI Model
- TCP/IP
- ATM
- X.25
- IEEE ( mainly deals with LAN technologies )

Application Layer - Computer Science students - User Interface
Presentation Layer - Computer Science students - User Interface
Session Layer - Computer Science students - User Interface
Transport Layer - Computer Science students - Thick Layer ( lot of functionalities .... eg: TCP)
Network Layer - Computer Science students - Complex Routing algorithms
Data Link Layer  - Electrical & Communation students   - Deals with both Hardware & software
Physical Link Layer - Electrical & Communation students - Deals with Only Hardware

**Note:
ISP providers can steal the history of our data and can sell to any one. So thats the reason we should always use secured HTTP 
protocol ( HTTPS ) while requesting information from the server.
Secured HTTP protocol is responsible to encypt the data transferred over the network between sender and receiver, but some 
meta data link which url is accessed all the information is not encrypted and that can cause issues too when we connect to 
Internet at coffee shops & Internet cafe's. 
VPN ( Virtual Private Network ): This solves the problem by creating secured tunnel between your Host computer and the VPN server, that helps in securing data END to END btw sender & receiver. Here entire meta data of our transactions is not exposed to ISP providers, but all are stored at VPN server.
e.g: Mozilla Firefox comes with a free VPN setup.

HTTPS is set by the owner of the website, and the user has no control over it. 
HTTPS provides authentication of the website and its associated web server, which protects against man-in-the-middle attacks. 
Additionally, it encrypts communications between a client and server, which ensures the communications between a user and 
website cannot be read or forged by any third-party reader.
HTTPS will encrypt information you enter into a website, but it won’t disguise your location or offer any privacy protection. 
It will also not offer any defense against internet censorship.

A VPN is set up by the user and works on every website or application online. A VPN creates a secure tunnel between a computer 
and the internet, allowing anonymous browsing.
When you are connected to a VPN, your ISP only sees that encrypted traffic is passing through VPN servers, but it cannot 
decipher the data or know which websites you have visited.
A VPN will encrypt communications between your computer and the VPN servers, hide your IP address and location, and grant 
access to the whole web, but it won’t protect you from the information you share willingly, like a credit card number typed 
into an unsecure browser page.

:+1: ISO/OSI Layers

1. Physical Layer:
   Responsibilities: 
   a) It deals with Electrical, Mechanical, Functional & Procedural characteristics of physical links (Copper wire, 
      Optical Fibre, Wireless network)
      - The messages sent over Copper wire are converted into Electrical Signals
      - The messages sent over Optical Fibre are converted into Light
      - The messages sent over Wireless network are converted into EMV ( Electro Magnetic Waves )
   b) Deals with Transmission Modes: Wires can be in any of the below tranmission modes
      - Simplex : Data Flows in one way between sender & receiver.
        e.g: Data flow from Antena to Televison is one way
      - Half Duplex Links: Data Flows from both sides between sender & receiver but not simultaneously
        e.g: Walkie-Takies used by Police...
      - Full Duplex Links: Both sender and receiver can send the data at the same time.
   c) Topologies: Means, how the various computers are connected to each other. 
      BUS, STAR, RING, MESH, HYBRID
   b) Encoding: Physical layer is responsible for converting Bits to Waves.
      a) Machester Encoding
      b) Differential Manchester Encoding
      Usually a bit is sent with 2 Voltages ( high - low ) across the link.
      Bit rate - number of bits transferred per second
      Baud rate - number of voltages transferred per second.
      Baudrate = 2 * Bitrate
2. DataLink Layer ( HOP - HOP connectivity ): It is divided into two parts 
   *  LLC ( Logical Link Layer ) :
       Responsibilities:
       a) Error Control ( CRC , CheckSum ) : CRC is used here & CheckSum is used at TCP level
       b) Flow Control ( STOP & WAIT , GO-BACKN , SR ) : GO-BACKN is most commonly used.
   * MAC ( Medium Access Control )
       Responsibilities:
       a) Error Control
       b) Framing
       c) Access Control ( CSMA/CD used by Ethernet, Token Passing used by TokenRing )
       d) Physical Addressing
   Concept-wise there 2 kinds of addressing Physical & Logical & practically we have IP address & MAC address
   Physical Address: It is is unique with in the network and should be fixed/constant. We use MAC address as physical address,
   because, it is a Hardware Number printed on the ROM, inside NIC.
   Logical Address: It is globally unique across the globe. we usually use IP address as logical address, since it is
   divided into Network & Host, which is easy for routing the packet.
   
   ** Note: MAC address can also be used as logical address but it consists of 3 parts ( VendorID/ManufactureID, Date, 
            SerialNumber ), which is not easy for routing the packet 
     L2 Routing:
     ## 𝐇𝐨𝐬𝐭 𝐌𝐚𝐜𝐡𝐢𝐧𝐞 (𝐀) 𝐰𝐚𝐧𝐭𝐬 𝐭𝐨 𝐬𝐞𝐧𝐝 𝐚 𝐩𝐚𝐜𝐤𝐞𝐭 𝐭𝐨 𝐃𝐞𝐬𝐢𝐭𝐧𝐚𝐭𝐢𝐨𝐧 𝐌𝐚𝐜𝐡𝐢𝐧𝐞 (𝐁) 𝐢𝐧 𝐭𝐡𝐞 𝐬𝐚𝐦𝐞 𝐬𝐮𝐛𝐧𝐞𝐭
     - Host A calculates it NetowrkID using its subnetmask
     - Host A caluclates Destination Machine NetowrkID using (A)'s subnet mask, if both matches then same subnet.
     - Host A checks its ARP cache table for Destination (B)'s MAC address using destination IP
     - If there is no entry in the ARP cache, Host (A) sends a ARP Braodcast message to all Machines in the subnet and learns
       its mac address
     - All machines receives ARP braodcast message - All machines whose IP address doesnt match with the one in the packet
       ignores to respond - Only Machine (B) responds with its MAC address using ARP reply Unicast message to Host (A).
     - Host (A) saves desitnation MAC address in ARP cache table for furture reference
     - Now Host(A) got all details, prepares Ethernet Headers & sends to Destination (B) through physical wire. 
       
     
     
  3. Network Layer: IP Packet at network Layer is un-reliable
   **Note: if we use virtual circuits then IP Packets here at network layer are reliable and there is no need of transportlayer
     Responsibilities:
     a) Host - Host connectivity
     b) Logical Addressing
     c) Routing - The process of building the routing table is called routing and using the routing table is called switching
     d) Switching - Deciding to which network the packet has to send.
     e) Congestion Control
     f) Fragmentation: Technique used to divide the packet inorder to send across different LAN Technologies with in a network 
     e.g: TokenRing connected to Ethernet
     
  4. Transport Layer: Using TCP IP packet is made reliable.
     Responsiblities:
     a) End - End connectivity ( uses Service Point Addressing/port numbers - SPA )
     b) Flow Control - SR protocal is used
     c) Error Control - CheckSum
     d) Segmentation
     e) Multiplexing & De-Multiplexing : 
     f) Congestion Control
     Reliable Data Delivery across the network.
       a) Packet corrupted / malformed: The below repairing techniques are used at recepient side
          CRC (cyclic redundancy check ) at Datalink layer
          Checksum at IP/Network layer
          Eror correcting codes at Application layer.
       b) Packet lost : If packet is lost during the transmit, the above techniques wont help, 
          instead TCP uses ARQ (Automatic Repeat Request ) technique.
          
  5. Session Layer:
     Responsibilities:
     a) Authentication / Authorization using digital signatures
     b) Checkpointing: e.g: Downloading movie from Torrent.
     c) Synchronization: e.g: Video & audio comes in seperate files & lip sync needs to me taken care.
     d) Dialog Control: e.g: Web Conference - only one person is allowed to speak even though links are full duplex, we have to
        restrict few links as half duplex.
     e) Logical Grouping of operations: e.g: Databases Atomicity - Either all commands should execute or none should execute.
   
     Since these functionalities are not mandatory, Computer network operating system wont provide these functionalities, 
     if needed user has to implement at application side.
  6. Presentation Layer:
     Responsibilties:
     a) Character Translation: e.g: one computer supports ASCII code & other Host with different, then this layers takes care of
        translation part.
     b) Encryption / Decyption : e.g: Message - Cipher text - Message
     c) Compression: e.g: Zip the data & un-zip the data
     
     These functionalities are not required by all applications, so these are taken care by the user when ever it is required.
  
  7. Application Layer: e.g: User's Application Code.
  
  ```
   
     Entire Flow - Host connect to google.com
     
     ```
     AL  [ Message-M ]
     TL  [ M + SourcePort x - random + DestinationPort 80 - wellknown port]
     NL  [ M + x + 80 + SourceIP + DestinationIP ]
         - Using DNS we get the Destination IP
         - ARP Broadcast Request packet is sent to DL to find the MAC address of the destination.
     DLL [ M + x + 80 + SourceIP + DestinationIP + SourceMACAddress + MACAddress of Router ]
          - ISP providers provide IP address of a router, 
          but using ARP protocol we get MAC address of the router                     
          and that is used in the packet.
     PL   [ M + x + 80 + SourceIP + DestinationIP + SourceMACAddress + MACAddress of Router + Start of the Frame Address SFA]
    
     ```
     EXAMPLE:
     IPg is ip address of google.
     IPa is the source IP address
     
     ```
     AL  [M]
     TL           [M+x+80]
     NL(hop-HOP)  [M+x+80+IPa+IPg]                                    [M+x+80+IPa+IPg]
          ***Note: Router has 3 layers PL,DLL & NL and using routing table it either forwards to default router or 
                   another router in different network or detination IP
     DLL [M+x+80+IPa+IPg+MACa+ ***ARPSignal ***]             [M+x+80+IPa+IPg+MACa+MACr1]            [M+x+80+IPa+IPg+MACa+MACg]
     PL  [M+x+80+IPa+IPg+MACa+MACr1+ PREAMBLE+SOA]   
    
AL  - MESSAGE
TL  - MESSAGE + TCP HEADER => SEGMENT
NL  - MESSAGE + TCP HEADER + IP HEADER => DATAGRAM
      **Note: ARP Broadcast Request packet is sent to DL to find the MAC address of the destination.
DLL - HEADER + MESSAGE + TCP HEADER + IP HEADER + TRAILER => FRAME
PL -  HEADER + MESSAGE + TCP HEADER + IP HEADER + TRAILER + PREAMBLE + SOA => 1PDU

```

