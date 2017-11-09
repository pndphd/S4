package require Tk

# The Title
wm title . ""

# Setup the grid manager
grid [ttk::frame .c -padding "10 10 10 20"] -column 0 -row 0 -sticky nwes

grid columnconfigure . 0 -weight 1; grid rowconfigure . 0 -weight 1

#The load/save file area
# grid [ttk::frame .c.title -relief raised -padding "10 10 10 20"] -column 0 -row 0 -columnspan 6 -sticky nwes
# grid [ttk::label .c.title -text  "Salmonid Spawning Superimposition Simulator" -justify center] -column 2 -row 0 -columnspan 6 -sticky we
# grid [ttk::entry .c.loadSaveFrame.lName -width 40 -textvariable lName] -column 1 -columnspan 1 -row 0 -sticky we
# grid [ttk::button .c.loadSaveFrame.load -width 5 -text "Load" -command load] -column 2  -row 0 -sticky we

# set a 1

# grid [ttk::label .c.loadSaveFrame.saveName -text "Save File Name:"] -column 0 -row $a -sticky e
# grid [ttk::entry .c.loadSaveFrame.sName -width 40 -textvariable sName] -column 1 -columnspan 1 -row $a -sticky we
# grid [ttk::button .c.loadSaveFrame.save -width 5 -text "Save" -command save] -column 2  -row $a -sticky we

# First set data inputs
set zz 1

image create photo imgobj -file "./Model/executable/logoSmall.png"  
grid [ttk::label .c.configure -image imgobj] -column 0 -row $zz -sticky e
font create AppHighlightFont -family {Arial Narrow} -size 20 
grid [ttk::label .c.title -text "Salmonid Spawning Superimposition Simulator" -font AppHighlightFont] -column 1 -columnspan 4 -row $zz -sticky w

set y [expr $zz+1]

grid [ttk::button .c.oPLoc -text "Output File Location" -command oPLoc] -column 4 -columnspan 1 -row $y -sticky we
grid [ttk::entry .c.oLoc -width 7 -textvariable oLoc] -column 0 -row $y -columnspan 4 -sticky we

set ab [expr $y+1]

grid [ttk::button .c.hALoc -text "Habitat File Location" -command hALoc] -column 4 -columnspan 1 -row $ab -sticky we
grid [ttk::entry .c.hLoc -width 7 -textvariable hLoc] -column 0 -row $ab -columnspan 4 -sticky we

set ac [expr $ab+1]

grid [ttk::label .c.patchCount -text "Number of Patches:"] -column 0 -row $ac -sticky e
grid [ttk::entry .c.patCount -width 7 -textvariable patCount] -column 1 -row $ac  -sticky we

set t [expr $ac+1]

grid [ttk::label .c.varName -text "Variable Name:"] -column 0 -row $t -sticky e
grid [ttk::entry .c.vName -width 7 -textvariable vName] -column 1 -row $t -columnspan 4 -sticky we

set z [expr $t+1]

grid [ttk::label .c.varCount -text "Number of Values:"] -column 0 -row $z -sticky e
grid [ttk::entry .c.vCount -width 7 -textvariable vCount] -column 1 -row $z  -sticky we

set o [expr $z+1]

grid [ttk::label .c.varValues -text "Variable Values:"] -column 0 -row $o -sticky e
grid [ttk::entry .c.vValues -width 7 -textvariable vValues] -column 1 -row $o -columnspan 4 -sticky we

set d [expr $o+1]

grid [ttk::label .c.daysPer -text "Days Per Simulation:"] -column 1 -row $d -sticky e
grid [ttk::entry .c.dPer -width 7 -textvariable dPer] -column 2 -row $d -sticky we

set e [expr $d+1]

grid [ttk::label .c.dayMost -text "Arrival Day: Mean:"] -column 1 -row $e -sticky e
grid [ttk::entry .c.dMost -width 7 -textvariable dMost] -column 2 -row $e -sticky we
grid [ttk::label .c.sdDays -text "SD:"] -column 3 -row $e -sticky e
grid [ttk::entry .c.sDays -width 7 -textvariable sDays] -column 4 -row $e -sticky we

set g [expr $e+1]

grid [ttk::label .c.numSpawners -text "Number of Spawners:"] -column 1 -row $g -sticky e
grid [ttk::entry .c.nSpawners -width 7 -textvariable nSpawners] -column 2 -row $g -sticky we

set p [expr $g+1]

grid [ttk::label .c.lenSpawners -text "Spawner Start Length (m):"] -column 1 -row $p -sticky e
grid [ttk::entry .c.lSpawners -width 7 -textvariable lSpawners] -column 2 -row $p -sticky we

set aa [expr $p+1]

grid [ttk::label .c.sdSpawners -text "Spawner End Length (m):"] -column 1 -row $aa -sticky e
grid [ttk::entry .c.sSpawners -width 7 -textvariable sSpawners] -column 2 -row $aa -sticky we

set ad [expr $aa+1]

grid [ttk::label .c.optdMean -text "Optimum Depth: Mean:"] -column 1 -row $ad -sticky e
grid [ttk::entry .c.odMean -width 7 -textvariable odMean] -column 2 -row $ad -sticky we
grid [ttk::label .c.optdSD -text "SD:"] -column 3 -row $ad -sticky e
grid [ttk::entry .c.odSD -width 7 -textvariable odSD] -column 4 -row $ad -sticky we

set ae [expr $ad+1]

grid [ttk::label .c.optvMean -text "Optimum Velocity: Mean:"] -column 1 -row $ae -sticky e
grid [ttk::entry .c.ovMean -width 7 -textvariable ovMean] -column 2 -row $ae -sticky we
grid [ttk::label .c.optvSD -text "SD:"] -column 3 -row $ae -sticky e
grid [ttk::entry .c.ovSD -width 7 -textvariable ovSD] -column 4 -row $ae -sticky we

set q [expr $ae+1]

grid [ttk::label .c.seaEffort -text "Search Effort:"] -column 1 -row $q -sticky e
grid [ttk::entry .c.sEffort -width 7 -textvariable sEffort] -column 2 -row $q -sticky we

set s [expr $q+1]

grid [ttk::label .c.limTime -text "Time Limit (days):"] -column 1 -row $s -sticky e
grid [ttk::entry .c.lTime -width 7 -textvariable lTime] -column 2 -row $s -sticky we

set h [expr $s+1]

grid [ttk::label .c.fraSel -text "Fraction Selective:"] -column 1 -row $h -sticky e
grid [ttk::entry .c.fSel -width 7 -textvariable fSel] -column 2  -row $h -sticky we

set i [expr $h+1]

grid [ttk::label .c.fecIntSpawners -text "Spawner Fecundity: Intercept:"] -column 1 -row $i -sticky e
grid [ttk::entry .c.fISpawners -width 7 -textvariable fISpawners] -column 2 -row $i -sticky we
grid [ttk::label .c.fecSloSpawners -text "Slope:"] -column 3 -row $i -sticky e
grid [ttk::entry .c.fSSpawners -width 7 -textvariable fSSpawners] -column 4 -row $i -sticky we

set j [expr $i+1]

grid [ttk::label .c.redArea -text "Redd Area (m^2):"] -column 1 -row $j -sticky e
grid [ttk::entry .c.rArea -width 7 -textvariable rArea] -column 2 -row $j -sticky we

set k [expr $j+1]

grid [ttk::label .c.guaArea -text "Guard Area (m^2):"] -column 1 -row $k -sticky e
grid [ttk::entry .c.gArea -width 7 -textvariable gArea] -column 2 -row $k -sticky we


set l [expr $k+1]

grid [ttk::label .c.guaTime -text "Guard Time (days):"] -column 1 -row $l -sticky e
grid [ttk::entry .c.gTime -width 7 -textvariable gTime] -column 2 -row $l -sticky we

set t [expr $l+1]

grid [ttk::label .c.avgTemp -text "Temperature (C):"] -column 1 -row $t -sticky e
grid [ttk::entry .c.aTemp -width 7 -textvariable aTemp] -column 2 -row $t -sticky we

set m [expr $t+1]

grid [ttk::label .c.aThemUs -text "ATUs (C):"] -column 1 -row $m -sticky e
grid [ttk::entry .c.aTUs -width 7 -textvariable aTUs] -column 2 -row $m -sticky we

set u [expr $m+1]

grid [ttk::label .c.itterations -text "Replicates:"] -column 1 -row $u -sticky e
grid [ttk::entry .c.itts -width 7 -textvariable itts] -column 2 -row $u -sticky we

set n [expr $u+1]


# Calculation button
grid [ttk::button .c.load -text "Load" -command load] -column 2 -columnspan 1 -row $n -sticky we
grid [ttk::button .c.save -text "Save" -command save] -column 3 -columnspan 1 -row $n -sticky we
grid [ttk::button .c.calc -text "Run" -command calculate] -column 4 -columnspan 1 -row $n -sticky we


# Set up spacing between widgets
foreach w [winfo children .c] {grid configure $w -padx 1 -pady 3}

# Set what is active and what enter does
focus .c.vName
bind . <Return> {calculate}

proc oPLoc {} {
	set filename [tk_chooseDirectory -mustexist true]
	.c.oLoc delete 0 end
	.c.oLoc insert 0 $filename
	}
	
proc hALoc {} {
	set filename [tk_getOpenFile]
	.c.hLoc delete 0 end
	.c.hLoc insert 0 $filename
	}

proc save {} {
	set types {
		{{Text Files} .txt}
		}
		
	set filename [tk_getSaveFile -filetypes $types -defaultextension .txt]
	set fileId [open $filename "w"]
	puts -nonewline $fileId "Output_Location"
	puts -nonewline $fileId " "
	if {[catch {puts $fileId $::oLoc}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Patch_File"
	puts -nonewline $fileId " "
	if {[catch {puts $fileId $::hLoc}]!=0} {puts $fileId ""}
	puts  -nonewline $fileId "Number_of_Patches"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::patCount}]!=0} {puts $fileId ""}
	puts  -nonewline $fileId "Variable_Name"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::vName}]!=0} {puts $fileId ""}
	puts  -nonewline $fileId "runs"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::vCount}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "variableValues"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::vValues}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Days_Per_Simulation"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::dPer}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Arrival_Day_Mean"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::dMost}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Arrival_Day_SD"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::sDays}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Number_of_Spawners"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::nSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Max_Length"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::lSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Min_Length"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::sSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Optimim_Depth"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::odMean}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Depth_SD"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::odSD}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Optimim_Velocity"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::ovMean}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Velocity_SD"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::ovSD}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Search_Effort"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::sEffort}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Time_Limit"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::lTime}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Fraction_Selective"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::fSel}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Fecundity_Intercept"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::fISpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Fecundity_Slope"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::fSSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Redd_Area"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::rArea}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Guard_Area"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::gArea}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Guard_Time"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::gTime}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Temperature"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::aTemp}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "ATUs"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::aTUs}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Replicates"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::itts}]!=0} {puts $fileId ""}
	puts  $fileId "end"

	close $fileId
	}

proc load {} {
	set inputFile [tk_getOpenFile]
	
	
	set fi [open $inputFile]
	
	gets $fi temp
	set oLocL [lsearch -all -inline -not -exact $temp Output_Location]
	gets $fi temp
	set hLocL [lsearch -all -inline -not -exact $temp Patch_File]
	gets $fi temp
	set patCountL [lindex [split $temp] 1]
	gets $fi temp
	set vNameL [lindex [split $temp] 1]
	gets $fi temp
	set vCountL [lindex [split $temp] 1]
	gets $fi temp
	set vValuesL [lindex [split $temp] 1]
	set jj [expr $vCountL]
	set vValuesL ""
	for {set ii 1} {$ii <= $jj} {incr ii} {
		lappend vValuesL [lindex [split $temp] $ii]
		}
	gets $fi temp
	set dPerL [lindex [split $temp] 1]
	gets $fi temp
	set dMostL [lindex [split $temp] 1]
	gets $fi temp
	set sDaysL [lindex [split $temp] 1]
	gets $fi temp
	set nSpawnersL [lindex [split $temp] 1]
	gets $fi temp
	set lSpawnersL [lindex [split $temp] 1]
	gets $fi temp
	set sSpawnersL [lindex [split $temp] 1]
	gets $fi temp
	set odMeanL [lindex [split $temp] 1]
	gets $fi temp
	set odSDL [lindex [split $temp] 1]
	gets $fi temp
	set ovMeanL [lindex [split $temp] 1]
	gets $fi temp
	set ovSDL [lindex [split $temp] 1]
	gets $fi temp
	set sEffortL [lindex [split $temp] 1]
	gets $fi temp
	set lTimeL [lindex [split $temp] 1]
	gets $fi temp
	set fSelL [lindex [split $temp] 1]
	gets $fi temp
	set fISpawnersL [lindex [split $temp] 1]
	gets $fi temp
	set fSSpawnersL [lindex [split $temp] 1]
	gets $fi temp
	set rAreaL [lindex [split $temp] 1]
	gets $fi temp
	set gAreaL [lindex [split $temp] 1]		
	gets $fi temp
	set gTimeL [lindex [split $temp] 1]	
	gets $fi temp
	set aTempL [lindex [split $temp] 1]		
	gets $fi temp
	set aTUsL [lindex [split $temp] 1]	
	gets $fi temp
	set ittsL [lindex [split $temp] 1]	

	.c.oLoc delete 0 end
	.c.oLoc insert 0 $oLocL
	.c.hLoc delete 0 end
	.c.hLoc insert 0 $hLocL
	.c.patCount delete 0 end
	.c.patCount insert 0 $patCountL
	.c.vName delete 0 end
	.c.vName insert 0 $vNameL
	.c.vCount delete 0 end
	.c.vCount insert 0 $vCountL
	.c.vValues delete 0 end
	.c.vValues insert 0 $vValuesL
	.c.dPer delete 0 end
	.c.dPer insert 0 $dPerL
	.c.dMost delete 0 end
	.c.dMost insert 0 $dMostL
	.c.sDays delete 0 end
	.c.sDays insert 0 $sDaysL
	.c.nSpawners delete 0 end
	.c.nSpawners insert 0 $nSpawnersL
	.c.lSpawners delete 0 end
	.c.lSpawners insert 0 $lSpawnersL
	.c.sSpawners delete 0 end
	.c.sSpawners insert 0 $sSpawnersL
	.c.odMean delete 0 end
	.c.odMean insert 0 $odMeanL
	.c.odSD delete 0 end
	.c.odSD insert 0 $odSDL
	.c.ovMean delete 0 end
	.c.ovMean insert 0 $ovMeanL
	.c.ovSD delete 0 end
	.c.ovSD insert 0 $ovSDL
	.c.sEffort delete 0 end
	.c.sEffort insert 0 $sEffortL
	.c.lTime delete 0 end
	.c.lTime insert 0 $lTimeL
	.c.fSel delete 0 end
	.c.fSel insert 0 $fSelL
	.c.fISpawners delete 0 end
	.c.fISpawners insert 0 $fISpawnersL
	.c.fSSpawners delete 0 end
	.c.fSSpawners insert 0 $fSSpawnersL
	.c.rArea delete 0 end
	.c.rArea insert 0 $rAreaL
	.c.gArea delete 0 end
	.c.gArea insert 0 $gAreaL
	.c.gTime delete 0 end
	.c.gTime insert 0 $gTimeL
	.c.aTemp delete 0 end
	.c.aTemp insert 0 $aTempL
	.c.aTUs delete 0 end
	.c.aTUs insert 0 $aTUsL
	.c.itts delete 0 end
	.c.itts insert 0 $ittsL
	

	close $fi
	}

proc calculate {} {
	set filename "temp_pass_file.txt"
	set fileId [open $filename "w"]
	
	puts -nonewline $fileId "Output_Location"
	puts -nonewline $fileId " "
	if {[catch {puts $fileId $::oLoc}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Patch_File"
	puts -nonewline $fileId " "
	if {[catch {puts $fileId $::hLoc}]!=0} {puts $fileId ""}
	puts  -nonewline $fileId "Number_of_Patches"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::patCount}]!=0} {puts $fileId ""}
	puts  -nonewline $fileId "Variable_Name"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::vName}]!=0} {puts $fileId ""}
	puts  -nonewline $fileId "runs"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::vCount}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "variableValues"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::vValues}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Days_Per_Simulation"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::dPer}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Arrival_Day_Mean"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::dMost}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Arrival_Day_SD"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::sDays}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Number_of_Spawners"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::nSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Length_Max"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::lSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Length_Min"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::sSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Optimim_Depth"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::odMean}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Depth_SD"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::odSD}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Optimim_Velocity"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::ovMean}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Velocity_SD"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::ovSD}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Search_Effort"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::sEffort}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Time_Limit"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::lTime}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Fraction_Selective"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::fSel}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Fecundity_Intercept"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::fISpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Spawner_Fecundity_Slope"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::fSSpawners}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Redd_Area"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::rArea}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Guard_Area"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::gArea}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Guard_Time"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::gTime}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Temperature"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::aTemp}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "ATUs"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::aTUs}]!=0} {puts $fileId ""}
	puts -nonewline $fileId "Replicates"
	puts  -nonewline $fileId " "
	if {[catch {puts $fileId $::itts}]!=0} {puts $fileId ""}
	puts  $fileId "end"
	close $fileId

	#console show
	#exec SHAM.exe 
	set output [exec "./Model/executable/S4.bat"] 
	#set output[open |[auto_execok 4S.bat]]
	#file delete ./temp_pass_file.txt
	set runlogName "/runlog.txt"
	set runlogLoc $::oLoc
	set runlog $runlogLoc$runlogName
	set logId [open $runlog "w"]
	puts  $logId $output
	close $logId
	
	
	}