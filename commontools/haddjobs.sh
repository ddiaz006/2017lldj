#!/bin/bash

# just calls the hadd scripts automatically generated
# submission time in ${basedir}/submitters/gitignore/${aversion}/${sample}/haddit.sh
mkdir -p "${rootdir}/${aversion}"
mkdir -p "${plotdir}/${aversion}"
mkdir -p "${plotdir}/${aversion}/logs"

samples=( \
 #"Data_DoubleMuon_B"         \
 #"Data_DoubleMuon_C"         \
 #"Data_DoubleMuon_D"         \
 #"Data_DoubleMuon_E"         \
 #"Data_DoubleMuon_F"         \
 #"Data_DoubleEG_B"         \
 #"Data_DoubleEG_C"         \
 #"Data_DoubleEG_D"         \
 #"Data_DoubleEG_E"         \
 #"Data_DoubleEG_F"         \
 #"Data_MuonEG_B"         \
 #"Data_MuonEG_C"         \
 #"Data_MuonEG_D"         \
 #"Data_MuonEG_E"         \
 #"Data_MuonEG_F"         \
 #"DYJetsToLL_M-50"            \
 #"WJetsToLNu"     \
 #"TTJets"          \
 #"TTtoLL"          \
 #"ST_s-channel_4f_leptonDecays"             \
 #"ST_t-channel_antitop_4f_inclusiveDecays"  \
 #"ST_t-channel_top_4f_inclusiveDecays"      \
 #"ST_tW_antitop_5f_NoFullyHadronicDecays"   \
 #"ST_tW_top_5f_NoFullyHadronicDecays"        \
 #"WW"                 \
 #"WZ"                 \
 #"ZZ"                 \
 #"WGToLNuG"              \
 #"ZGTo2LG"               \
 #"ZH_HToBB_ZToLL"        \
 #"ggZH_HToBB_ZToLL"      \
 #"QCD_HT100to200"        \
 #"QCD_HT200to300"        \
 #"QCD_HT300to500"        \
 #"QCD_HT500to700"        \
 #"QCD_HT700to1000"       \
 #"QCD_HT1500to2000"      \
 #"QCD_HT2000toInf"       \
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
)

for sample in ${samples[@]}
do

 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OPTtree.sh"
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_NM1trees.sh"
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_BkgEst.sh"
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_AODGenEventWeight.sh"
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleSig_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleSig_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuSig_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuSig_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleDY_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleDY_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuDY_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuDY_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleZH_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleZH_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuZH_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuZH_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleOffZ_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleOffZ_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuOffZ_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuOffZ_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleNoPair_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuNoPair_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOF_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOFL_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OnePho_histograms.sh"    


 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OPTtree.sh"
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_NM1trees.sh"
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_BkgEst.sh"
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_AODGenEventWeight.sh"
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleSig_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleSig_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuSig_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuSig_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleDY_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleDY_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuDY_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuDY_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleZH_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleZH_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuZH_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuZH_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleOffZ_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleOffZ_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuOffZ_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuOffZ_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleNoPair_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuNoPair_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOF_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOFL_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OnePho_histograms.sh"    

done
