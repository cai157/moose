# ----------------------------------------------------------------------
#  GRAPH
#
#  This simple example shows how you can use the Rappture toolkit
#  to handle I/O for a simple simulator--in this case, one that
#  evaluates an x/y graph
#
# ======================================================================
#  AUTHOR:  Michael McLennan, Purdue University
#  Copyright (c) 2004-2012  HUBzero Foundation, LLC
#
#  See the file "license.terms" for information on usage and
#  redistribution of this file, and for a DISCLAIMER OF ALL WARRANTIES.
# ======================================================================

import Rappture
import sys, os, commands, string
from math import *

io = Rappture.library(sys.argv[1])

xmin = float(io.get('input.number(xmin).current'))
xmax = float(io.get('input.number(xmax).current'))
#formula = io.get('input.string(formula).current')
#print 'formula = %s' % formula
#npts = 100

io.put('output.number(result).current',xmax)
#io.put('output.curve(result).yaxis.label','Y')
#io.put('output.curve(result).xaxis.label','X')

try:
  out = commands.getoutput('~/projects/DREAM3D-6.3.29-Linux-x86_64/bin/PipelineRunner -p ~/projects/DREAM3D-6.3.29-Linux-x86_64/PrebuiltPipelines/Workshop/Synthetic/SingleCubicPhaseEquiaxedLayer.json')
except:
  sys.stderr.write('Error during dream3d execution in granta.m')
  exit(1);

try:
  out = commands.getoutput('octave --silent dream3dtoabaqus.m')
except:
  sys.stderr.write('Error during octave execution in dream3dtoabaqus.m')
  exit(1);

try:
  out = commands.getoutput('octave --silent granta.m')
except:
  sys.stderr.write('Error during octave execution in granta.m')
  exit(1);

try:
  out = commands.getoutput('cp ~/projects/DREAM3D-6.3.29-Linux-x86_64/bin/Data/Output/Job-1_final.inp ~/Scaricati/20130903/examples/granta/')
except:
  sys.stderr.write('Error during copy of Job-1_final.inp')
  exit(1);

try:
  out = commands.getoutput('cp ~/Scaricati/20130903/examples/granta/Data/Output/CubicSingleEquiaxedOutLayer.vtk ~/Scaricati/20130903/examples/granta/')
except:
  sys.stderr.write('Error during copy of CubicSingleEquiaxedOutLayer.vtk')
  exit(1);

try:
  out = commands.getoutput('python readvtk.py')
except:
  sys.stderr.write('Error during python execution of readvtk.py')
  exit(1);

try:
  out = commands.getoutput('./UOcrysp-opt -i crysp.i')
except:
  sys.stderr.write('Error during moose execution')
  exit(1);

try:
  out = commands.getoutput('paraview polycrystal.e')
except:
  sys.stderr.write('Error during paraview execution')
  exit(1);

#for i in range(npts):
#    x = (xmax-xmin)/npts * i + xmin;
#    y = eval(formula)
#    io.put('output.curve(result).component.xy', '%g %g\n' % (x,y), append=1)

Rappture.result(io)
