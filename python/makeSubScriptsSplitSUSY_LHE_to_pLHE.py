#!/usr/bin/python
import os
#with open('xsec.txt') as fXsec:
#    xsecInfo = fXsec.read().splitlines()
#    pass
with open('fileLists/test_LHE.txt') as freco:
    fileList = freco.read().splitlines()
    pass

#intLumi = 38270.0
#globalTag = '80X_mcRun2_asymptotic_2016_TrancheIV_v6'
#EvT = float(xsecInfo[3].split()[1])
#xsec = float(xsecInfo[0].split()[1])
#totE = float(xsecInfo[2].split()[1])
#tName = 'qcd'
#pName = xsecInfo[4].split()[1]
#fileList = ['file:/afs/cern.ch/work/k/kmei/TempGeneration/h2toTauTau_LHE.root']
#outputFile = 'file:/eos/user/k/kmei/PYTHIA8/h2toTauTau_300GeV_10mm_GENSIM_bsub_test_2000.root'
maxEvent = 10000


#for n in redoFiles:
for i,iFile in enumerate(fileList):
    #i = int(n)
	#print iFile.split('/')[7].split('.')[0] ##
	inputFile='file:'+iFile
	outputFile = 'file:/eos/user/k/kmei/OctGenSplitSUSY/pLHE/'+str(iFile.split('/')[7].split('.')[0])+'_pLHE.root'
	outF = open("sh/runSplitSUSY_pLHE_" + str(i) + ".sh" , 'w')
	outF.write("#!/bin/bash\n")
	outF.write("\n")
	outF.write('export BASE_DIR=/afs/cern.ch/work/k/kmei/Generation\n')
	outF.write('export CMSSW_PROJECT_SRC=$BASE_DIR/CMSSW_7_1_19_patch1/src\n')
    #outF.write('export JOB_DIR=$BASE_DIR/%s/%s\n'%(tName,pName))
	#outF.write('export CFG_FILE=$CMSSW_PROJECT_SRC/LHEtoGENSIMcfg_TEMPLATE.py\n')
	outF.write('export CFG_FILE=$BASE_DIR/templates/LHEtopLHEcfg_TEMPLATE.py\n')
	outF.write('export X509_USER_PROXY=/afs/cern.ch/user/k/kmei/proxy/myProxy\n')
	outF.write("\n")
	outF.write("cd $CMSSW_PROJECT_SRC\n")
	outF.write("eval `scramv1 runtime -sh`\n")
    #outF.write("cd $JOB_DIR\n")
	outF.write('cmsRun $CFG_FILE inputFile=%s outputFile=%s maxEvent=%i\n'%(inputFile,outputFile,maxEvent))
	outF.write("rm core.*\n")
	outF.write("\n")
	outF.close()
	os.system("bsub -q 8nh -J SplitSUSY_" + str(i) + " < sh/runSplitSUSY_pLHE_" + str(i) + ".sh")
    #os.system("bsub -R \"pool>3000\" -q 1nh -J qcdHT2AR" + str(i) + " < sh/runAnaRECOqcd" + str(i) + ".sh")
