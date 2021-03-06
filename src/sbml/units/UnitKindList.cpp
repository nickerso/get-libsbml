/**
 * @cond doxygenLibsbmlInternal
 *
 * @file    UnitKindList.cpp
 * @brief   Maintains a list of UnitKinds. 
 * @author  Ben Bornstein
 *
 * $UnitKind:  Exp $
 * $HeadURL: https://sbml.svn.sourceforge.net/svnroot/sbml/trunk/libsbml/src/units/UnitKindList.cpp $
 *
 * <!--------------------------------------------------------------------------
 * This file is part of libSBML.  Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright (C) 2013-2016 jointly by the following organizations:
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
 *     3. University of Heidelberg, Heidelberg, Germany
 *
 * Copyright (C) 2009-2013 jointly by the following organizations: 
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
 *  
 * Copyright (C) 2006-2008 by the California Institute of Technology,
 *     Pasadena, CA, USA 
 *  
 * Copyright (C) 2002-2005 jointly by the following organizations: 
 *     1. California Institute of Technology, Pasadena, CA, USA
 *     2. Japan Science and Technology Agency, Japan
 * 
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation.  A copy of the license agreement is provided
 * in the file named "LICENSE.txt" included with this software distribution and
 * also available online as http://sbml.org/software/libsbml/license.html
 * ---------------------------------------------------------------------- -->*/

#include <algorithm>
#include <sbml/units/UnitKindList.h>


using std::string;
using std::vector;

LIBSBML_CPP_NAMESPACE_BEGIN

/**
 * @return true if UnitKind is already in this UnitKindList, false otherwise.
 */
bool
UnitKindList::contains (const std::string UnitKind) const
{
  UnitKindList::const_iterator end = mKinds.end();
  
  return std::find(mKinds.begin(), end, UnitKind) != end;
}


/**
 * Removes the first occurence of this UnitKind in this UnitKindList.
 */
void
UnitKindList::removeUnitKind (const std::string UnitKind)
{
  UnitKindList::iterator end = mKinds.end();
  UnitKindList::iterator pos = std::find(mKinds.begin(), end, UnitKind);


  if (pos != end) mKinds.erase(pos, pos+1);
}

LIBSBML_CPP_NAMESPACE_END
/** @endcond */
