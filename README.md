#### 3rd_MCA_CN_Programs

### Installation

First You need to install 3 packages in your linux machine
 
 
 step1 :   update your linux Repo.
         
         sudo apt-get update
 
 Next::
 
 <b>Package 1.  ns2 </b>
  
         sudo apt-get install ns2
 
 <b>Package 2.  nam </b>
  
        sudo apt-get install nam
 
  <b>Package 3.  Cisco Packet Tracer </b>
  Step 1::
  u need to download this file
        
        https://drive.google.com/file/d/1CK1Uz5XX60C3VgxFu6Vu2HRpVINFcyno/view?usp=sharing
  
  Step 2 ::
        cd Downloads
        
        sudo chmod +x PacketTracer_731_amd64.deb
  
 Step3 
        sudo apt install ./PacketTracer_731_amd64.deb
      
      (give all permissions)
  
  
  
  
  #Excecution of Programs
  
  first u need to open Terminal in Linux Machine
  
  then type 
  
         ns <program_name.tcl>    #/this line will compile the tcl program
         
         (if u get any permission error use below line of code)
         
         sudo ns <program_name.tcl>    
         
         
 after above steps::
            (run above compiled files ( .nam files) using nam emulator )
            
            Type
            
            nam <program_name.nam>    
            
         
         
