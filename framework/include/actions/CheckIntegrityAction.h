//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef CHECKINTEGRITYACTION_H
#define CHECKINTEGRITYACTION_H

#include "Action.h"

class CheckIntegrityAction;

template <>
InputParameters validParams<CheckIntegrityAction>();

class CheckIntegrityAction : public Action
{
public:
  CheckIntegrityAction(InputParameters params);

  virtual void act() override;
};

#endif // CHECKINTEGRITYACTION_H
