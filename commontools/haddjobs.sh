#!/bin/bash

# just calls the hadd scripts automatically generated
# submission time in ${basedir}/submitters/gitignore/${aversion}/${sample}/haddit.sh
mkdir -p "${rootdir}/${aversion}"
mkdir -p "${plotdir}/${aversion}"
mkdir -p "${plotdir}/${aversion}/logs"

samples=( \
 "Data_DoubleMuon_B"         \
 "Data_DoubleMuon_C"         \
 "Data_DoubleMuon_D"         \
 "Data_DoubleMuon_E"         \
 "Data_DoubleMuon_F"         \
 "Data_DoubleEG_B"         \
 "Data_DoubleEG_C"         \
 "Data_DoubleEG_D"         \
 "Data_DoubleEG_E"         \
 "Data_DoubleEG_F"         \
 "Data_MuonEG_B"         \
 "Data_MuonEG_C"         \
 "Data_MuonEG_D"         \
 "Data_MuonEG_E"         \
 "Data_MuonEG_F"         \
 "DYJetsToLL_M-50"            \
 "WJetsToLNu"     \
 "TTJets"          \
 "ST_s-channel_4f_leptonDecays"             \
 "ST_t-channel_antitop_4f_inclusiveDecays"  \
 "ST_t-channel_top_4f_inclusiveDecays"      \
 "ST_tW_antitop_5f_NoFullyHadronicDecays"   \
 "ST_tW_top_5f_NoFullyHadronicDecays"        \
 "WW"                 \
 "WZ"                 \
 "ZZ"                 \
 "WGToLNuG"              \
 "QCD_HT100to200"        \
 "QCD_HT200to300"        \
 "QCD_HT300to500"        \
 "QCD_HT500to700"        \
 "QCD_HT700to1000"       \
 "QCD_HT1000to1500"      \
 "QCD_HT1500to2000"      \
 "QCD_HT2000toInf"       \
)

for sample in ${samples[@]}
do

 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OPTtree.sh"
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_NM1trees.sh"
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_BkgEst.sh"
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
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleOffZ_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuOffZ_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuOffZ_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleNoPair_histograms.sh"    
 #chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuNoPair_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOF_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOFL_histograms.sh"    
 chmod +x "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OnePho_histograms.sh"    


 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OPTtree.sh"
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_NM1trees.sh"
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_BkgEst.sh"
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
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoEleOffZ_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuOffZ_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_TwoMuOffZ_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneEleNoPair_histograms.sh"    
 #bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OneMuNoPair_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOF_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_EleMuOSOFL_histograms.sh"    
 bash "${basedir}/submitters/gitignore/${aversion}/${sample}/haddit_OnePho_histograms.sh"    

done
