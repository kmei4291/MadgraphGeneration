#!/bin/bash

export BASE_DIR=/afs/cern.ch/work/k/kmei/Generation
export CMSSW_PROJECT_SRC=$BASE_DIR/CMSSW_7_1_19_patch1/src
export CFG_FILE=$BASE_DIR/templates/LHEtopLHEcfg_TEMPLATE.py
export X509_USER_PROXY=/afs/cern.ch/user/k/kmei/proxy/myProxy

cd $CMSSW_PROJECT_SRC
eval `scramv1 runtime -sh`
cmsRun $CFG_FILE inputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/LHE/test.lhe outputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/pLHE/test_pLHE.root maxEvent=10000
rm core.*

