/**
 * @file    MathML.cpp
 * @brief   Utilities for reading and writing MathML to/from text strings.
 * @author  Ben Bornstein
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

#include <sbml/xml/XMLToken.h>
#include <sbml/xml/XMLNode.h>
#include <sbml/xml/XMLInputStream.h>

#include <sbml/SBMLError.h>
#include <sbml/SBMLErrorLog.h>

#include <sbml/util/util.h>

#include <sbml/common/common.h>

#include <sbml/math/ASTNode.h>
#include <sbml/math/MathML.h>
#include <sbml/extension/ASTBasePlugin.h>

/** @cond doxygenIgnored */
using namespace std;
/** @endcond */

LIBSBML_CPP_NAMESPACE_BEGIN

#ifdef __cplusplus

/** @cond doxygenLibsbmlInternal */

MathML::MathML(SBMLNamespaces* sbmlns) :
    mPrefix ("")
  , mSBMLns (sbmlns)
{
}

MathML::MathML() :
    mPrefix ("")
  , mSBMLns (NULL)
{
}


MathML::~MathML() 
{
}


void 
MathML::setPrefix(const std::string& prefix)
{
  mPrefix = prefix;
}

ASTNode* 
MathML::readMathML(XMLInputStream& stream)
{
  if (mSBMLns != NULL)
  {
    stream.setSBMLNamespaces(mSBMLns);
  }

  stream.skipText();

  unsigned int numErrorsB4Read = stream.getErrorLog()->getNumErrors();

  ASTNode* node = new ASTNode(stream.getSBMLNamespaces());
  
  bool read = node->read(stream, mPrefix);
  
  if (read == false 
    || hasSeriousErrors(stream.getErrorLog(), numErrorsB4Read) == true)
  {
    delete node;
    node = NULL;
  }

  return node;
}

 
void 
MathML::writeMathML(XMLOutputStream& stream, const ASTNode* node)
{
  if (node == NULL ) return;

  if (mSBMLns != NULL)
  {
    stream.setSBMLNamespaces(mSBMLns);
  }

  writeOpenMathElement(stream, node);
  node->write(stream);
  writeCloseMathElement(stream);
}


bool
MathML::hasSeriousErrors(XMLErrorLog* log, unsigned int index)
{
  bool seriousErrors = false;

  unsigned int numErrors = log->getNumErrors();

  while (seriousErrors == false && index < numErrors)
  {
    unsigned int errorId = log->getError(index)->getErrorId();
    switch (errorId)
    {
      case BadMathMLNodeType:
      case BadMathML:
        seriousErrors = true;
        break;
      default:
        break;
    }

    index++;
  }

  return seriousErrors;
}


void 
MathML::writeOpenMathElement(XMLOutputStream& stream, const ASTNode* node)
{
  static const std::string uri = "http://www.w3.org/1998/Math/MathML";

  stream.startElement("math");
  stream.writeAttribute("xmlns", uri);

    // need to know if we have units
  if (node->hasCnUnits() == true && stream.getSBMLNamespaces() != NULL
    && stream.getSBMLNamespaces()->getLevel() > 2)
  {
    std::string prefix = node->getUnitsPrefix();
    if (prefix.empty() == true)
    {
      prefix = "sbml";
    }
    stream.writeAttribute(prefix, "xmlns", stream.getSBMLNamespaces()->getURI());
  }

  for (unsigned int i = 0; i < node->getNumPlugins(); i++)
  {
    node->getPlugin(i)->writeXMLNS(stream);
  }
}


void 
MathML::writeCloseMathElement(XMLOutputStream& stream)
{
  stream.endElement("math");
}


/** @cond doxygenLibsbmlInternal */
LIBSBML_EXTERN
ASTNode*
readMathML (XMLInputStream& stream, const std::string& reqd_prefix)
{
  MathML* mathml = new MathML();
  mathml->setPrefix(reqd_prefix);
  ASTNode * node = mathml->readMathML(stream);
  delete mathml;
  return node;
}
/** @endcond */

/** @cond doxygenLibsbmlInternal */
LIBSBML_EXTERN
void
writeMathML (const ASTNode* node, XMLOutputStream& stream, SBMLNamespaces *sbmlns)
{
  if (node == NULL ) return;
  MathML* mathml = new MathML(sbmlns);
  mathml->writeMathML(stream, node);
  delete mathml;
}
/** @endcond */

#endif /* __cplusplus */

/* ---------------------------------------------------------------------- */
/*                           Public Functions                             */
/* ---------------------------------------------------------------------- */


/**
 * @if conly
 * @memberof ASTNode_t
 * @endif
 */
LIBSBML_EXTERN
ASTNode_t *
readMathMLFromString (const char *xml)
{
  if (xml == NULL) return NULL;

  const char* dummy_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
  const char* xmlstr_c;
  string xmlwheader;

  if (!strncmp(xml, dummy_xml, 14))
  {
    xmlstr_c = xml;
  }
  else
  {
    xmlwheader = dummy_xml;
    xmlwheader += xml;
    
    xmlstr_c = xmlwheader.c_str();
  }

  XMLInputStream stream(xmlstr_c, false);
  SBMLErrorLog   log;

  stream.setErrorLog(&log);
  SBMLNamespaces sbmlns;
  stream.setSBMLNamespaces(&sbmlns);

  ASTNode* ast = readMathML (stream);

  return ast;
}


/**
 * @if conly
 * @memberof ASTNode_t
 * @endif
 */
LIBSBML_EXTERN
ASTNode_t *
readMathMLFromStringWithNamespaces (const char *xml, XMLNamespaces_t * xmlns)
{
  if (xml == NULL) return NULL;

  bool needDelete = false;

  const char* dummy_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
  const char* xmlstr_c;
  
  if (!strncmp(xml, dummy_xml, 14))
  {
    xmlstr_c = xml;
  }
  else
  {
    std::ostringstream oss;

    oss << dummy_xml;
    oss << xml;


    xmlstr_c = safe_strdup(oss.str().c_str());
    needDelete = true;
  }

  XMLInputStream stream(xmlstr_c, false);
  SBMLErrorLog   log;

  stream.setErrorLog(&log);
  SBMLNamespaces sbmlns;
  if (xmlns != NULL)
  {
    sbmlns.addNamespaces(xmlns);
  }
  stream.setSBMLNamespaces(&sbmlns);

  ASTNode * ast = readMathML(stream);

  if (needDelete) free(const_cast<char*>(xmlstr_c));
  
  return ast;
}


/**
 * @if conly
 * @memberof ASTNode_t
 * @endif
 */
LIBSBML_EXTERN
char *
writeMathMLToString (const ASTNode* node)
{
  ostringstream   os;
  XMLOutputStream stream(os);
  SBMLNamespaces sbmlns;
  //stream.setSBMLNamespaces(&sbmlns);

  char * result = NULL;

  if (node != NULL)
  { 
    MathML* mathml = new MathML(&sbmlns);
    mathml->writeMathML(stream, node);

    result = safe_strdup( os.str().c_str() );
    delete mathml;
  }

  return result;
}

LIBSBML_EXTERN
std::string
writeMathMLToStdString (const ASTNode* node)
{
  if (node == NULL) return "";
  
  ostringstream   os;
  XMLOutputStream stream(os);
  SBMLNamespaces sbmlns;
  MathML* mathml = new MathML(&sbmlns);
  mathml->writeMathML(stream, node);
  delete mathml;

  return os.str();
}
/** @endcond */

LIBSBML_CPP_NAMESPACE_END
