#!/bin/bash

export BASE_DIR=/afs/cern.ch/work/k/kmei/TauGeneration
export CMSSW_PROJECT_SRC=$BASE_DIR/CMSSW_8_0_21/src
export CFG_FILE=$CMSSW_PROJECT_SRC/RECOtoAODSIMcfg_TEMPLATE.py
export X509_USER_PROXY=/afs/cern.ch/user/k/kmei/proxy/myProxy

cd $CMSSW_PROJECT_SRC
eval `scramv1 runtime -sh`
cmsRun $CFG_FILE inputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/RECO/test_RECO_gluino_ctau3.root outputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/AODSIM/test_AODSIM_gluino_ctau3.root maxEvent=500
rm core.*

