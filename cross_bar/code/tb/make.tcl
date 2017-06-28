

do		   setup.tcl
alias lib  "do compile_altera_libs.tcl"
         
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }


ensure_lib          "$ALTERA_LIBS"
ensure_lib          libraries
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
if [ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/altera_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/altera_mf_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/lpm_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/sgate_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/altera_lnsim_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/altera_lnsim
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/arriav_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/cyclonev_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/cyclonev_hssi_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/cyclonev_pcie_hip_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/cycloneiv_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/maxv_ver
	ensure_lib                            $ALTERA_LIBS/lib_modelsim/maxii_ver
	
	vmap        altera_ver                $ALTERA_LIBS/lib_modelsim/altera_ver 
    vmap        altera_mf_ver             $ALTERA_LIBS/lib_modelsim/altera_mf_ver
    vmap        lpm_ver                   $ALTERA_LIBS/lib_modelsim/lpm_ver
    vmap        sgate_ver                 $ALTERA_LIBS/lib_modelsim/sgate_ver
    vmap        altera_lnsim_ver          $ALTERA_LIBS/lib_modelsim/altera_lnsim_ver
    vmap        altera_lnsim              $ALTERA_LIBS/lib_modelsim/altera_lnsim
    vmap        arriav_ver                $ALTERA_LIBS/lib_modelsim/arriav_ver
    vmap        cyclonev_ver              $ALTERA_LIBS/lib_modelsim/cyclonev_ver
    vmap        cyclonev_hssi_ver         $ALTERA_LIBS/lib_modelsim/cyclonev_hssi_ver
    vmap        cyclonev_pcie_hip_ver     $ALTERA_LIBS/lib_modelsim/cyclonev_pcie_hip_ver
    vmap        cycloneiv_ver             $ALTERA_LIBS/lib_modelsim/cycloneiv_ver
    vmap        maxv_ver                  $ALTERA_LIBS/lib_modelsim/maxv_ver
    vmap        maxii_ver                 $ALTERA_LIBS/lib_modelsim/maxii_ver
} elseif [ string match "*Questa Sim-64*" [ vsim -version ] ] {
	ensure_lib                            $ALTERA_LIBS/lib_questasim/
	ensure_lib                            $ALTERA_LIBS/lib_questasim/altera_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/altera_mf_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/lpm_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/sgate_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/altera_lnsim_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/altera_lnsim
	ensure_lib                            $ALTERA_LIBS/lib_questasim/arriav_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/cyclonev_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/cyclonev_hssi_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/cyclonev_pcie_hip_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/cycloneiv_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/maxv_ver
	ensure_lib                            $ALTERA_LIBS/lib_questasim/maxii_ver
	vmap        altera_ver                $ALTERA_LIBS/lib_questasim/altera_ver 
    vmap        altera_mf_ver             $ALTERA_LIBS/lib_questasim/altera_mf_ver
    vmap        lpm_ver                   $ALTERA_LIBS/lib_questasim/lpm_ver
    vmap        sgate_ver                 $ALTERA_LIBS/lib_questasim/sgate_ver
    vmap        altera_lnsim_ver          $ALTERA_LIBS/lib_questasim/altera_lnsim_ver
    vmap        altera_lnsim              $ALTERA_LIBS/lib_questasim/altera_lnsim
    vmap        arriav_ver                $ALTERA_LIBS/lib_questasim/arriav_ver
    vmap        cyclonev_ver              $ALTERA_LIBS/lib_questasim/cyclonev_ver
    vmap        cyclonev_hssi_ver         $ALTERA_LIBS/lib_questasim/cyclonev_hssi_ver
    vmap        cyclonev_pcie_hip_ver     $ALTERA_LIBS/lib_questasim/cyclonev_pcie_hip_ver
    vmap        cycloneiv_ver             $ALTERA_LIBS/lib_questasim/cycloneiv_ver
    vmap        maxv_ver                  $ALTERA_LIBS/lib_questasim/maxv_ver
    vmap        maxii_ver                 $ALTERA_LIBS/lib_questasim/maxii_ver
}


alias c "do compile.tcl"

alias s {
	vsim -novopt    work.top_tb
	log /* -r
	do ./wave.do 
	run 50000000
	#1064000
}

alias rs {
	restart -f
	log /* -r
	run 32000
}	
proc qs {}  {quit -sim}
proc q {}  {quit}
proc h {}  {
  echo "c            - to compile files"
  echo "s            - to simulate without optimization with waveform"
  echo "rs           - to restart simulation"
}