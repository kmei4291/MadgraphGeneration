#This is the general folder for generation of Long Lived Signal using the CMSSW framework for 2016-2017

#Setting up MadGraph

As of October 2017, the recommendation for Madgraph (used for 2015/2016 data) is to use CMSSW\_7\_X\_Y with MadGraph v.2.4.3. In this case, I used CMSSW\_7\_1\_19\_patch1. To setup:
	cmsrel CMSSW\_7\_1\_19\_patch1
	cd CMSSW\_7\_1\_19\_patch1/src
	cmsenv

##Setting up LHAPDF
After untarring Madgraph, you will have to install LHAPDF separately (the script that comes with Madgraph is woefully unable to handle
the CMSSW environment). To do that get LHAPDF-6.1.6 and untar it in your MadGraph.

The instructions for installation is right here:
	https://lhapdf.hepforge.org/#installsec

But functionally, you have to run the following commands (you need a Boost version greater than 1.47):
	In bash:
		source prepare_madgraph.sh (for an example script, look at /afs/cern.ch/user/k/kmei/TarFiles/Generation/prepare_madgraph.sh)
		./configure --with-boost=/afs/cern.ch/sw/lcg/external/Boost/1.53.0_python2.7/x86_64-slc6-gcc48-opt --prefix=$PWD/../local
		make -j8 && make install

You will see a lot of warnings related to Boost, but this should not affect your final build. The above code creates a folder in your
MadGraph main folder called local where you should get your PDFs. One example is:

	wget http://www.hepforge.org/archive/lhapdf/pdfsets/6.1/PDF4LHC15_nlo_mc_pdfas.tar.gz -O- | tar xz -C /afs/cern.ch/work/k/kmei/Generation/madgraph/MG5_aMC_v2_4_3/local/share/LHAPDF

To generate events (in this case proton proton to gluino gluino), you will need to do:
	./bin/mg5_aMC
	import model mssm #You will need to import a BSM model
	define p = p b b~
	define j = j b b~
	generate p p > go go
	output ppTOgogo
	launch #This will generate 10000 events

To change number of events generated, change the NLO file (to LHAPDF) go to:
	vim ppTOgogo/Cards/run_card.dat
	
##Setting up PYTHIA8
To do this, all you have to do is run MG5\_aMC and install pythia:
	./bin/mg5_aMC
	install pythia-pgs

For now, the PYTHIA8 isn't used explicitly when running MadGraph, but rather when running the resulting LHE file through the CMSSW framework (during the LHE to GENSIM to RECO step).

##Setting up SysCalc

To do this, all you have to do is run MG5\_aMC and install SysCalc:
	./bin/mg5_aMC
	install SysCalc


#WORKFLOW

#Specific changes to MadGraph

Depending on the model, it may be important to change the parameters of MadGraph in a way that will tune the particles to fit your expected model. 

##Choose your LHAPDF file

Decide on the parton distribution functions that you will want to use for your analysis. Based off of Alexis's SUSY analysis, these are the LHAPDF files:
	NNPDF30\_lo\_as\_0130 
	NNPDF30\_nlo\_as\_0118 
	CT10nlo 
	MMHT2014nlo68cl 
