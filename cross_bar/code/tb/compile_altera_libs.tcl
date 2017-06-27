######### Device-Independent Models #############
 
 

# 1.Compile for Altera megafunctions
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v                  -work altera_ver
# 2.Compile for Altera megafunctions
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v                          -work altera_mf_ver
# 3.Compile for Altera library of parameterized modules
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v                           -work lpm_ver  


##################### Arria V #######################
# Compile for designs


#################### Cyclone V ######################
# Compile for designs
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v          -work cyclonev_ver         
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v      -work cyclonev_ver         
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v                        -work cyclonev_ver 
# Compile for designs with transceivers
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v     -work cyclonev_hssi_ver    
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v                   -work cyclonev_hssi_ver 
# Compile for designs with PCIe
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v -work cyclonev_pcie_hip_ver
vlog       $QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v               -work cyclonev_pcie_hip_ver

############ Cyclone IV #############  
# Compile for designs       


############### Max V ################
# Compile for designs      

############### Max II ################
# Compile for designs      



############# Stratix V ###################















