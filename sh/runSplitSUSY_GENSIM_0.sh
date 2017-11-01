#!/bin/bash

export BASE_DIR=/afs/cern.ch/work/k/kmei/Generation
export CMSSW_PROJECT_SRC=$BASE_DIR/CMSSW_7_1_20_patch2/src
export CFG_FILE=$BASE_DIR/templates/pLHEtoGENSIMcfg_TEMPLATE.py
export X509_USER_PROXY=/afs/cern.ch/user/k/kmei/proxy/myProxy

cd $CMSSW_PROJECT_SRC
eval `scramv1 runtime -sh`
cmsRun $CFG_FILE inputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/pLHE/test_pLHE.root outputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/test_GENSIM_gluino_ctau3.root maxEvent=500 glutau0=3.000000
rm core.*

