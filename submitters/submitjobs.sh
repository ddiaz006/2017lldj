#!/bin/bash

# script to generate submit files
# and optionally to submit to condor

# source xx/LLDJ/setup.sh for ${aversion}

doSubmit=true
lumi=20000.
nevents=-1
maxfilesperjob=200   # 500=6h

samples=(  \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-2"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-20"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-200"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-2"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-20"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-200"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-2"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-20"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-200"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-2"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-20"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-200"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-2"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-20"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-200"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-2"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-20"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-200"  \ 
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-3"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-30"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-300"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-3"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-30"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-300"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-3"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-30"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-300"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-3"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-30"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-300"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-3"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-30"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-300"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-3"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-30"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-300"  \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-5"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-50"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-500"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-5"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-50"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-500"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-5"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-50"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-500"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-5"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-50"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-500"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-5"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-50"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-500"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-5"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-50"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-500"  \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-1"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-10"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-100"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-1000"   \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-1"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-10"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-100"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-1000"   \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-1"      \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-10"     \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-100"    \
 "ZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-1000"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-1"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-10"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-100"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-15_ctauS-1000" \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-1"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-10"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-100"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-40_ctauS-1000" \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-1"    \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-10"   \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-100"  \
 "ggZH_HToSSTobbbb_ZToLL_MH-125_MS-55_ctauS-1000" \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-2"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-20"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-200"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-2"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-20"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-200"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-2"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-20"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-200"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-2"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-20"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-200"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-2"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-20"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-200"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-2"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-20"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-200"  \ 
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-3"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-30"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-300"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-3"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-30"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-300"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-3"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-30"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-300"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-3"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-30"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-300"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-3"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-30"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-300"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-3"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-30"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-300"  \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-5"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-50"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-500"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-5"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-50"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-500"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-5"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-50"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-500"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-5"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-50"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-500"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-5"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-50"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-500"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-5"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-50"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-500"  \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-1"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-10"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-100"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-1000"   \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-1"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-10"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-100"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-1000"   \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-1"      \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-10"     \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-100"    \
 "ZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-1000"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-1"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-10"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-100"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-15_ctauS-1000" \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-1"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-10"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-100"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-40_ctauS-1000" \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-1"    \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-10"   \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-100"  \
 "ggZH_HToSSTodddd_ZToLL_MH-125_MS-55_ctauS-1000" \
# "Data_DoubleMuon_B"         \
# "Data_DoubleMuon_C"         \
# "Data_DoubleMuon_D"         \
# "Data_DoubleMuon_E"         \
# "Data_DoubleMuon_F"         \
# "Data_DoubleEG_B"         \
# "Data_DoubleEG_C"         \
# "Data_DoubleEG_D"         \
# "Data_DoubleEG_E"         \
# "Data_DoubleEG_F"         \
# "Data_MuonEG_B"         \
# "Data_MuonEG_C"         \
# "Data_MuonEG_D"         \
# "Data_MuonEG_E"         \
# "Data_MuonEG_F"         \
# "DYJetsToLL_M-50"            \
# "WJetsToLNu"     \
# "TTJets"          \
# "TTtoLL"          \
# "ST_s-channel_4f_leptonDecays"             \
# "ST_t-channel_antitop_4f_inclusiveDecays"  \
# "ST_t-channel_top_4f_inclusiveDecays"      \
# "ST_tW_antitop_5f_NoFullyHadronicDecays"   \
# "ST_tW_top_5f_NoFullyHadronicDecays"        \
# "WW"                 \
# "WZ"                 \
# "ZZ"                 \
# "WGToLNuG"              \
# "ZGTo2LG"               \
# "ZH_HToBB_ZToLL"        \
# "ggZH_HToBB_ZToLL"      \
# "QCD_HT100to200"        \
# "QCD_HT200to300"        \
# "QCD_HT300to500"        \
# "QCD_HT500to700"        \
# "QCD_HT700to1000"       \
# "QCD_HT1500to2000"      \
# "QCD_HT2000toInf"       \
)
# "Data_DoubleMuon_B"         \
# "Data_DoubleMuon_C"         \
# "Data_DoubleMuon_D"         \
# "Data_DoubleMuon_E"         \
# "Data_DoubleMuon_F"         \
# "Data_DoubleEG_B"         \
# "Data_DoubleEG_C"         \
# "Data_DoubleEG_D"         \
# "Data_DoubleEG_E"         \
# "Data_DoubleEG_F"         \
# "Data_MuonEG_B"         \
# "Data_MuonEG_C"         \
# "Data_MuonEG_D"         \
# "Data_MuonEG_E"         \
# "Data_MuonEG_F"         \
# "DYJetsToLL_M-50"            \
# "WJetsToLNu"     \
# "TTJets"          \
# "ST_s-channel_4f_leptonDecays"             \
# "ST_t-channel_antitop_4f_inclusiveDecays"  \
# "ST_t-channel_top_4f_inclusiveDecays"      \
# "ST_tW_antitop_5f_NoFullyHadronicDecays"   \
# "ST_tW_top_5f_NoFullyHadronicDecays"        \
# "WW"                 \
# "WZ"                 \
# "ZZ"                 \
# "WGToLNuG"              \
# "QCD_HT100to200"        \
# "QCD_HT200to300"        \
# "QCD_HT300to500"        \
# "QCD_HT500to700"        \
# "QCD_HT700to1000"       \
# "QCD_HT1000to1500"      \
# "QCD_HT1500to2000"      \
# "QCD_HT2000toInf"       \

printf "Version: ${aversion}\n"

## compie analyzer
pushd ${CMSSW_BASE}/src/${FWVersion}/analyzers
make clean; make 
popd

## make info file - put "loggit" on any line you want to keep 
mkdir -p ${CMSSW_BASE}/src/${FWVersion}/submitters/gitignore/${aversion}
about="${CMSSW_BASE}/src/${FWVersion}/submitters/gitignore/${aversion}/about.txt"
printf "## you know why you're running this job\n\n\n\n\n\n"   >  ${about}
grep -h "loggit" ${CMSSW_BASE}/src/${FWVersion}/analyzers/* >> ${about}
 
makeasubmitdir () {
 printf "Making submits for $1\n"
 
 # go to the directory
 submitdir=${asubdir}/gitignore/${aversion}/$1
 mkdir -p ${submitdir} 
 pushd    ${submitdir}  > /dev/null
 printf " The directory is %s\n" $(pwd)
 
 mkdir -p logs
 
 # write base for submit file
 printf "universe = vanilla\n" > submitfile
 printf "Executable = ${CMSSW_BASE}/src/${FWVersion}/submitters/runjob.sh\n" >> submitfile
 printf "Should_Transfer_Files = YES \n" >> submitfile
 printf "WhenToTransferOutput = ON_EXIT\n" >> submitfile
 printf "Transfer_Input_Files = ${CMSSW_BASE}/src/${FWVersion}/analyzers/runanalyzer.exe,${CMSSW_BASE}/src/${FWVersion}/lists/$1.list,${CMSSW_BASE}/src/${FWVersion}/lists/$1.info,${CMSSW_BASE}/src/${FWVersion}/analyzers/2017_puWeights_DoubleEG_69200.root,${CMSSW_BASE}/src/${FWVersion}/analyzers/2017_puWeights_MuonEG_69200.root,${CMSSW_BASE}/src/${FWVersion}/analyzers/2017_puWeights_DoubleMuon_69200.root,${CMSSW_BASE}/src/${FWVersion}/analyzers/2017_ElectronTight.root,${CMSSW_BASE}/src/${FWVersion}/analyzers/2017_ElectronMedium.root,${CMSSW_BASE}/src/${FWVersion}/analyzers/2017_ElectronLoose.root,${CMSSW_BASE}/src/${FWVersion}/analyzers/feff_ZH.root\n" >> submitfile

 printf "notify_user = $(whoami)@cern.ch\n" >> submitfile
 printf "x509userproxy = $X509_USER_PROXY\n" >> submitfile
 printf "\n" >> submitfile
 printf "Output = logs/runanalyzer_\$(Cluster)_\$(Process).stdout\n" >> submitfile
 printf "Error  = logs/runanalyzer_\$(Cluster)_\$(Process).stderr\n" >> submitfile
 printf "Log    = logs/runanalyzer_\$(Cluster)_\$(Process).log\n" >> submitfile
 printf "\n" >> submitfile

 # make haddfile (make now for merging expected results)
 haddfile_OPTtree="./haddit_OPTtree.sh"
 haddfile_NM1trees="./haddit_NM1trees.sh"
 haddfile_BkgEst="./haddit_BkgEst.sh"
 haddfile_AODGenEventWeight="./haddit_AODGenEventWeight.sh"
 haddfile_AOD0thnPU="./haddit_AOD0thnPU.sh"
 #haddfile_OneEleSig_histograms="./haddit_OneEleSig_histograms.sh"                           
 haddfile_TwoEleSig_histograms="./haddit_TwoEleSig_histograms.sh"                           
 #haddfile_OneMuSig_histograms="./haddit_OneMuSig_histograms.sh"                           
 haddfile_TwoMuSig_histograms="./haddit_TwoMuSig_histograms.sh"                           
 #haddfile_OneEleDY_histograms="./haddit_OneEleDY_histograms.sh"                           
 haddfile_TwoEleDY_histograms="./haddit_TwoEleDY_histograms.sh"                           
 #haddfile_OneMuDY_histograms="./haddit_OneMuDY_histograms.sh"                           
 haddfile_TwoMuDY_histograms="./haddit_TwoMuDY_histograms.sh"                           
 #haddfile_OneEleZH_histograms="./haddit_OneEleZH_histograms.sh"                           
 haddfile_TwoEleZH_histograms="./haddit_TwoEleZH_histograms.sh"                           
 #haddfile_OneMuZH_histograms="./haddit_OneMuZH_histograms.sh"                           
 haddfile_TwoMuZH_histograms="./haddit_TwoMuZH_histograms.sh"                           
 #haddfile_OneEleOffZ_histograms="./haddit_OneEleOffZ_histograms.sh"                           
 haddfile_TwoEleOffZ_histograms="./haddit_TwoEleOffZ_histograms.sh"                           
 #haddfile_OneMuOffZ_histograms="./haddit_OneMuOffZ_histograms.sh"                           
 haddfile_TwoMuOffZ_histograms="./haddit_TwoMuOffZ_histograms.sh"                           
 #haddfile_OneEleNoPair_histograms="./haddit_OneEleNoPair_histograms.sh"                           
 #haddfile_OneMuNoPair_histograms="./haddit_OneMuNoPair_histograms.sh"                           
 haddfile_EleMuOSOF_histograms="./haddit_EleMuOSOF_histograms.sh"                           
 haddfile_EleMuOSOFL_histograms="./haddit_EleMuOSOFL_histograms.sh"                           
 haddfile_OnePho_histograms="./haddit_OnePho_histograms.sh"                           


 hadddir="${rootdir}/${aversion}"
 mkdir -p ${hadddir}
 #printf "#!/bin/bash\n\n" > ${haddfile_OneEleSig_histograms}    
 printf "#!/bin/bash\n\n" > ${haddfile_TwoEleSig_histograms}    
 #printf "#!/bin/bash\n\n" > ${haddfile_OneMuSig_histograms}     
 printf "#!/bin/bash\n\n" > ${haddfile_TwoMuSig_histograms}     
 #printf "#!/bin/bash\n\n" > ${haddfile_OneEleDY_histograms}     
 printf "#!/bin/bash\n\n" > ${haddfile_TwoEleDY_histograms}     
 #printf "#!/bin/bash\n\n" > ${haddfile_OneMuDY_histograms}      
 printf "#!/bin/bash\n\n" > ${haddfile_TwoMuDY_histograms}      
 #printf "#!/bin/bash\n\n" > ${haddfile_OneEleZH_histograms}     
 printf "#!/bin/bash\n\n" > ${haddfile_TwoEleZH_histograms}     
 #printf "#!/bin/bash\n\n" > ${haddfile_OneMuZH_histograms}      
 printf "#!/bin/bash\n\n" > ${haddfile_TwoMuZH_histograms}      
 #printf "#!/bin/bash\n\n" > ${haddfile_OneEleOffZ_histograms}   
 printf "#!/bin/bash\n\n" > ${haddfile_TwoEleOffZ_histograms}   
 #printf "#!/bin/bash\n\n" > ${haddfile_OneMuOffZ_histograms}    
 printf "#!/bin/bash\n\n" > ${haddfile_TwoMuOffZ_histograms}    
 #printf "#!/bin/bash\n\n" > ${haddfile_OneEleNoPair_histograms} 
 #printf "#!/bin/bash\n\n" > ${haddfile_OneMuNoPair_histograms}  
 printf "#!/bin/bash\n\n" > ${haddfile_EleMuOSOF_histograms}    
 printf "#!/bin/bash\n\n" > ${haddfile_EleMuOSOFL_histograms}    
 printf "#!/bin/bash\n\n" > ${haddfile_OnePho_histograms}       
 printf "#!/bin/bash\n\n" > ${haddfile_OPTtree}          
 printf "#!/bin/bash\n\n" > ${haddfile_NM1trees}          
 printf "#!/bin/bash\n\n" > ${haddfile_BkgEst}
 printf "#!/bin/bash\n\n" > ${haddfile_AODGenEventWeight}
 printf "#!/bin/bash\n\n" > ${haddfile_AOD0thnPU}

 # make checker
 checkfile="./checker.sh"
 printf "#!/bin/bash\n\n" > ${checkfile}

 # hadd command to go in haddfile
  # name of final merged file
 #printf "hadd ${hadddir}/$1_OneEleSig_histograms.root"     >>       ${haddfile_OneEleSig_histograms}    
 printf "hadd ${hadddir}/$1_TwoEleSig_histograms.root"     >>       ${haddfile_TwoEleSig_histograms}    
 #printf "hadd ${hadddir}/$1_OneMuSig_histograms.root"      >>       ${haddfile_OneMuSig_histograms}     
 printf "hadd ${hadddir}/$1_TwoMuSig_histograms.root"      >>       ${haddfile_TwoMuSig_histograms}     
 #printf "hadd ${hadddir}/$1_OneEleDY_histograms.root"      >>       ${haddfile_OneEleDY_histograms}     
 printf "hadd ${hadddir}/$1_TwoEleDY_histograms.root"      >>       ${haddfile_TwoEleDY_histograms}     
 #printf "hadd ${hadddir}/$1_OneMuDY_histograms.root"       >>       ${haddfile_OneMuDY_histograms}      
 printf "hadd ${hadddir}/$1_TwoMuDY_histograms.root"       >>       ${haddfile_TwoMuDY_histograms}      
 #printf "hadd ${hadddir}/$1_OneEleZH_histograms.root"      >>       ${haddfile_OneEleZH_histograms}     
 printf "hadd ${hadddir}/$1_TwoEleZH_histograms.root"      >>       ${haddfile_TwoEleZH_histograms}     
 #printf "hadd ${hadddir}/$1_OneMuZH_histograms.root"       >>       ${haddfile_OneMuZH_histograms}      
 printf "hadd ${hadddir}/$1_TwoMuZH_histograms.root"       >>       ${haddfile_TwoMuZH_histograms}      
 #printf "hadd ${hadddir}/$1_OneEleOffZ_histograms.root"    >>       ${haddfile_OneEleOffZ_histograms}   
 printf "hadd ${hadddir}/$1_TwoEleOffZ_histograms.root"    >>       ${haddfile_TwoEleOffZ_histograms}   
 #printf "hadd ${hadddir}/$1_OneMuOffZ_histograms.root"     >>       ${haddfile_OneMuOffZ_histograms}    
 printf "hadd ${hadddir}/$1_TwoMuOffZ_histograms.root"     >>       ${haddfile_TwoMuOffZ_histograms}    
 #printf "hadd ${hadddir}/$1_OneEleNoPair_histograms.root"  >>       ${haddfile_OneEleNoPair_histograms} 
 #printf "hadd ${hadddir}/$1_OneMuNoPair_histograms.root"   >>       ${haddfile_OneMuNoPair_histograms}  
 printf "hadd ${hadddir}/$1_EleMuOSOF_histograms.root"     >>       ${haddfile_EleMuOSOF_histograms}    
 printf "hadd ${hadddir}/$1_EleMuOSOFL_histograms.root"    >>       ${haddfile_EleMuOSOFL_histograms}    
 printf "hadd ${hadddir}/$1_OnePho_histograms.root"        >>       ${haddfile_OnePho_histograms}       
 printf "hadd ${hadddir}/$1_OPTtree.root"                  >>       ${haddfile_OPTtree}           
 printf "hadd ${hadddir}/$1_NM1tree.root"                  >>       ${haddfile_NM1trees}           
 printf "hadd ${hadddir}/$1_BkgEst.root"                   >>       ${haddfile_BkgEst}           
 printf "hadd ${hadddir}/$1_AODGenEventWeight.root"        >>       ${haddfile_AODGenEventWeight}           
 printf "hadd ${hadddir}/$1_AOD0thnPU.root"                >>       ${haddfile_AOD0thnPU}           

 # breaking up input file list
 nfilesinlist=$( wc -l < "${CMSSW_BASE}/src/${FWVersion}/lists/$1.list" )
 filenrlow=0
 jobfilenr=0

 printf " nfilesinlist = ${nfilesinlist} / ${maxfilesperjob} \n\n"
 
 until [ ${filenrlow} -gt ${nfilesinlist} ]
 do

  printf "Arguments = $1 ${lumi} ${nevents} ${maxfilesperjob} ${filenrlow} _${jobfilenr} $2 \n" >> submitfile
  printf "Queue\n" >> submitfile
  printf "\n" >> submitfile

  # add files to be produced to haddfiles
  #printf "\\"  >> ${haddfile_OneEleSig_histograms}    
  printf "\\"  >> ${haddfile_TwoEleSig_histograms}    
  #printf "\\"  >> ${haddfile_OneMuSig_histograms}     
  printf "\\"  >> ${haddfile_TwoMuSig_histograms}     
  #printf "\\"  >> ${haddfile_OneEleDY_histograms}     
  printf "\\"  >> ${haddfile_TwoEleDY_histograms}     
  #printf "\\"  >> ${haddfile_OneMuDY_histograms}      
  printf "\\"  >> ${haddfile_TwoMuDY_histograms}      
  #printf "\\"  >> ${haddfile_OneEleZH_histograms}     
  printf "\\"  >> ${haddfile_TwoEleZH_histograms}     
  #printf "\\"  >> ${haddfile_OneMuZH_histograms}      
  printf "\\"  >> ${haddfile_TwoMuZH_histograms}      
  #printf "\\"  >> ${haddfile_OneEleOffZ_histograms}   
  printf "\\"  >> ${haddfile_TwoEleOffZ_histograms}   
  #printf "\\"  >> ${haddfile_OneMuOffZ_histograms}    
  printf "\\"  >> ${haddfile_TwoMuOffZ_histograms}    
  #printf "\\"  >> ${haddfile_OneEleNoPair_histograms} 
  #printf "\\"  >> ${haddfile_OneMuNoPair_histograms}  
  printf "\\"  >> ${haddfile_EleMuOSOF_histograms}    
  printf "\\"  >> ${haddfile_EleMuOSOFL_histograms}    
  printf "\\"  >> ${haddfile_OnePho_histograms}       
  printf "\\"  >> ${haddfile_OPTtree}           
  printf "\\"  >> ${haddfile_NM1trees}           
  printf "\\"  >> ${haddfile_BkgEst}           
  printf "\\"  >> ${haddfile_AODGenEventWeight}           
  printf "\\"  >> ${haddfile_AOD0thnPU}           

  #printf "\n $(pwd)/$1_${jobfilenr}_OneEleSig_histograms.root"     >> ${haddfile_OneEleSig_histograms}    
  printf "\n $(pwd)/$1_${jobfilenr}_TwoEleSig_histograms.root"     >> ${haddfile_TwoEleSig_histograms}    
  #printf "\n $(pwd)/$1_${jobfilenr}_OneMuSig_histograms.root"      >> ${haddfile_OneMuSig_histograms}     
  printf "\n $(pwd)/$1_${jobfilenr}_TwoMuSig_histograms.root"      >> ${haddfile_TwoMuSig_histograms}     
  #printf "\n $(pwd)/$1_${jobfilenr}_OneEleDY_histograms.root"      >> ${haddfile_OneEleDY_histograms}     
  printf "\n $(pwd)/$1_${jobfilenr}_TwoEleDY_histograms.root"      >> ${haddfile_TwoEleDY_histograms}     
  #printf "\n $(pwd)/$1_${jobfilenr}_OneMuDY_histograms.root"       >> ${haddfile_OneMuDY_histograms}      
  printf "\n $(pwd)/$1_${jobfilenr}_TwoMuDY_histograms.root"       >> ${haddfile_TwoMuDY_histograms}      
  #printf "\n $(pwd)/$1_${jobfilenr}_OneEleZH_histograms.root"      >> ${haddfile_OneEleZH_histograms}     
  printf "\n $(pwd)/$1_${jobfilenr}_TwoEleZH_histograms.root"      >> ${haddfile_TwoEleZH_histograms}     
  #printf "\n $(pwd)/$1_${jobfilenr}_OneMuZH_histograms.root"       >> ${haddfile_OneMuZH_histograms}      
  printf "\n $(pwd)/$1_${jobfilenr}_TwoMuZH_histograms.root"       >> ${haddfile_TwoMuZH_histograms}      
  #printf "\n $(pwd)/$1_${jobfilenr}_OneEleOffZ_histograms.root"    >> ${haddfile_OneEleOffZ_histograms}   
  printf "\n $(pwd)/$1_${jobfilenr}_TwoEleOffZ_histograms.root"    >> ${haddfile_TwoEleOffZ_histograms}   
  #printf "\n $(pwd)/$1_${jobfilenr}_OneMuOffZ_histograms.root"     >> ${haddfile_OneMuOffZ_histograms}    
  printf "\n $(pwd)/$1_${jobfilenr}_TwoMuOffZ_histograms.root"     >> ${haddfile_TwoMuOffZ_histograms}    
  #printf "\n $(pwd)/$1_${jobfilenr}_OneEleNoPair_histograms.root"  >> ${haddfile_OneEleNoPair_histograms} 
  #printf "\n $(pwd)/$1_${jobfilenr}_OneMuNoPair_histograms.root"   >> ${haddfile_OneMuNoPair_histograms}  
  printf "\n $(pwd)/$1_${jobfilenr}_EleMuOSOF_histograms.root"     >> ${haddfile_EleMuOSOF_histograms}    
  printf "\n $(pwd)/$1_${jobfilenr}_EleMuOSOFL_histograms.root"    >> ${haddfile_EleMuOSOFL_histograms}    
  printf "\n $(pwd)/$1_${jobfilenr}_OnePho_histograms.root"        >> ${haddfile_OnePho_histograms}       
  printf "\n $(pwd)/$1_${jobfilenr}_OPTtree.root"                  >> ${haddfile_OPTtree}           
  printf "\n $(pwd)/$1_${jobfilenr}_NM1tree.root"                  >> ${haddfile_NM1trees}           
  printf "\n $(pwd)/$1_${jobfilenr}_BkgEst.root"                   >> ${haddfile_BkgEst}
  printf "\n $(pwd)/$1_${jobfilenr}_AODGenEventWeight.root"        >> ${haddfile_AODGenEventWeight}
  printf "\n $(pwd)/$1_${jobfilenr}_AOD0thnPU.root"                >> ${haddfile_AOD0thnPU}

  # add file to checker, all histos are made at the same time, so only check one
  printf "\n if [ ! -f $(pwd)/$1_${jobfilenr}_OPTtree.root ]; then printf \" $(pwd)/$1_${jobfilenr}_OPTtree.root \\n\"; fi " >> ${checkfile}

  # increment filenumber counters
  #printf "NFILES: %s %s %s\n" $nfilesinlist $filenrlow $jobfilenr
  filenrlow=$(( ${filenrlow} + ${maxfilesperjob} ))
  jobfilenr=$(( ${jobfilenr} + 1 ))

 done # until filenrlow > nfilesinlist

 #printf "\n\n" >> ${haddfile_OneEleSig_histograms}    
 printf "\n\n" >> ${haddfile_TwoEleSig_histograms}    
 #printf "\n\n" >> ${haddfile_OneMuSig_histograms}     
 printf "\n\n" >> ${haddfile_TwoMuSig_histograms}     
 #printf "\n\n" >> ${haddfile_OneEleDY_histograms}     
 printf "\n\n" >> ${haddfile_TwoEleDY_histograms}     
 #printf "\n\n" >> ${haddfile_OneMuDY_histograms}      
 printf "\n\n" >> ${haddfile_TwoMuDY_histograms}      
 #printf "\n\n" >> ${haddfile_OneEleZH_histograms}     
 printf "\n\n" >> ${haddfile_TwoEleZH_histograms}     
 #printf "\n\n" >> ${haddfile_OneMuZH_histograms}      
 printf "\n\n" >> ${haddfile_TwoMuZH_histograms}      
 #printf "\n\n" >> ${haddfile_OneEleOffZ_histograms}   
 printf "\n\n" >> ${haddfile_TwoEleOffZ_histograms}   
 #printf "\n\n" >> ${haddfile_OneMuOffZ_histograms}    
 printf "\n\n" >> ${haddfile_TwoMuOffZ_histograms}    
 #printf "\n\n" >> ${haddfile_OneEleNoPair_histograms} 
 #printf "\n\n" >> ${haddfile_OneMuNoPair_histograms}  
 printf "\n\n" >> ${haddfile_EleMuOSOF_histograms}    
 printf "\n\n" >> ${haddfile_EleMuOSOFL_histograms}    
 printf "\n\n" >> ${haddfile_OnePho_histograms}       
 printf "\n\n" >> ${haddfile_OPTtree}           
 printf "\n\n" >> ${haddfile_NM1trees}           
 printf "\n\n" >> ${haddfile_BkgEst}
 printf "\n\n" >> ${haddfile_AODGenEventWeight}
 printf "\n\n" >> ${haddfile_AOD0thnPU}

 if [ ${doSubmit} = true ]
 then
  condor_submit submitfile
 fi
 
 popd > /dev/null
}


# actually call the function
for sample in ${samples[@]} 
do
 # set isMC flag if MC
 if [[ ${sample} == "Data"* ]]
 then
  mc=""
 else
  mc="-m"
 fi

 makeasubmitdir ${sample} ${mc}

done

printf "Put notes about this job here:\n\n  vim  ${about}\n\n"

