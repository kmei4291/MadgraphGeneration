#!/bin/bash

export BASE_DIR=/afs/cern.ch/work/k/kmei/Generation
export CMSSW_PROJECT_SRC=$BASE_DIR/CMSSW_8_0_21/src
export CFG_FILE=$BASE_DIR/templates/GENSIMtoRECOcfg_TEMPLATE.py
export X509_USER_PROXY=/afs/cern.ch/user/k/kmei/proxy/myProxy

cd $CMSSW_PROJECT_SRC
eval `scramv1 runtime -sh`
cmsRun $CFG_FILE inputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/GENSIM/test_GENSIM_gluino_ctau3.root outputFile=file:/eos/user/k/kmei/OctGenSplitSUSY/RECO/test_RECO_gluino_ctau3.root maxEvent=500
rm core.*

