# @file    TestModel_newSetters.rb
# @brief   Model unit tests for new set function API
#
# @author  Akiya Jouraku (Ruby conversion)
# @author  Sarah Keating 
#
#
# ====== WARNING ===== WARNING ===== WARNING ===== WARNING ===== WARNING ======
#
# DO NOT EDIT THIS FILE.
#
# This file was generated automatically by converting the file located at
# src/sbml/test/TestModel_newSetters.c
# using the conversion program dev/utilities/translateTests/translateTests.pl.
# Any changes made here will be lost the next time the file is regenerated.
#
# -----------------------------------------------------------------------------
# This file is part of libSBML.  Please visit http://sbml.org for more
# information about SBML, and the latest version of libSBML.
#
# Copyright 2005-2010 California Institute of Technology.
# Copyright 2002-2005 California Institute of Technology and
#                     Japan Science and Technology Corporation.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation.  A copy of the license agreement is provided
# in the file named "LICENSE.txt" included with this software distribution
# and also available online as http://sbml.org/software/libsbml/license.html
# -----------------------------------------------------------------------------
require 'test/unit'
require 'libSBML'

class TestModel_newSetters < Test::Unit::TestCase

  def setup
    @@m = LibSBML::Model.new(2,4)
    if (@@m == nil)
    end
  end

  def teardown
    @@m = nil
  end

  def test_Model_addCompartment1
    m = LibSBML::Model.new(2,2)
    c = LibSBML::Compartment.new(2,2)
    i = m.addCompartment(c)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    c.setId( "c")
    i = m.addCompartment(c)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumCompartments() == 1 )
    c = nil
    m = nil
  end

  def test_Model_addCompartment2
    m = LibSBML::Model.new(2,2)
    c = LibSBML::Compartment.new(2,1)
    c.setId( "c")
    i = m.addCompartment(c)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumCompartments() == 0 )
    c = nil
    m = nil
  end

  def test_Model_addCompartment3
    m = LibSBML::Model.new(2,2)
    c = LibSBML::Compartment.new(1,2)
    c.setId( "c")
    i = m.addCompartment(c)
    assert( i == LibSBML::LIBSBML_LEVEL_MISMATCH )
    assert( m.getNumCompartments() == 0 )
    c = nil
    m = nil
  end

  def test_Model_addCompartment4
    m = LibSBML::Model.new(2,2)
    c = nil
    i = m.addCompartment(c)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumCompartments() == 0 )
    m = nil
  end

  def test_Model_addCompartment5
    m = LibSBML::Model.new(2,2)
    c = LibSBML::Compartment.new(2,2)
    c.setId( "c")
    c1 = LibSBML::Compartment.new(2,2)
    c1.setId( "c")
    i = m.addCompartment(c)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumCompartments() == 1 )
    i = m.addCompartment(c1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumCompartments() == 1 )
    c = nil
    c1 = nil
    m = nil
  end

  def test_Model_addCompartmentType1
    m = LibSBML::Model.new(2,2)
    ct = LibSBML::CompartmentType.new(2,2)
    i = m.addCompartmentType(ct)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    ct.setId( "ct")
    i = m.addCompartmentType(ct)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumCompartmentTypes() == 1 )
    ct = nil
    m = nil
  end

  def test_Model_addCompartmentType2
    m = LibSBML::Model.new(2,2)
    ct = LibSBML::CompartmentType.new(2,3)
    ct.setId( "ct")
    i = m.addCompartmentType(ct)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumCompartmentTypes() == 0 )
    ct = nil
    m = nil
  end

  def test_Model_addCompartmentType3
    m = LibSBML::Model.new(2,2)
    ct = nil
    i = m.addCompartmentType(ct)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumCompartmentTypes() == 0 )
    m = nil
  end

  def test_Model_addCompartmentType4
    m = LibSBML::Model.new(2,2)
    ct = LibSBML::CompartmentType.new(2,2)
    ct.setId( "ct")
    ct1 = LibSBML::CompartmentType.new(2,2)
    ct1.setId( "ct")
    i = m.addCompartmentType(ct)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumCompartmentTypes() == 1 )
    i = m.addCompartmentType(ct1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumCompartmentTypes() == 1 )
    ct = nil
    ct1 = nil
    m = nil
  end

  def test_Model_addConstraint1
    m = LibSBML::Model.new(2,2)
    c = LibSBML::Constraint.new(2,2)
    i = m.addConstraint(c)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    c.setMath(LibSBML::parseFormula("a+b"))
    i = m.addConstraint(c)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumConstraints() == 1 )
    c = nil
    m = nil
  end

  def test_Model_addConstraint2
    m = LibSBML::Model.new(2,2)
    c = LibSBML::Constraint.new(2,3)
    c.setMath(LibSBML::parseFormula("a+b"))
    i = m.addConstraint(c)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumConstraints() == 0 )
    c = nil
    m = nil
  end

  def test_Model_addConstraint3
    m = LibSBML::Model.new(2,2)
    c = nil
    i = m.addConstraint(c)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumConstraints() == 0 )
    m = nil
  end

  def test_Model_addEvent1
    m = LibSBML::Model.new(2,2)
    e = LibSBML::Event.new(2,2)
    t = LibSBML::Trigger.new(2,2)
    i = m.addEvent(e)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    t.setMath(LibSBML.parseFormula("true"))
    e.setTrigger(t)
    i = m.addEvent(e)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    e.createEventAssignment()
    i = m.addEvent(e)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumEvents() == 1 )
    e = nil
    m = nil
  end

  def test_Model_addEvent2
    m = LibSBML::Model.new(2,2)
    e = LibSBML::Event.new(2,1)
    t = LibSBML::Trigger.new(2,1)
    t.setMath(LibSBML.parseFormula("true"))
    e.setTrigger(t)
    e.createEventAssignment()
    i = m.addEvent(e)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumEvents() == 0 )
    e = nil
    m = nil
  end

  def test_Model_addEvent3
    m = LibSBML::Model.new(2,2)
    e = nil
    i = m.addEvent(e)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumEvents() == 0 )
    m = nil
  end

  def test_Model_addEvent4
    m = LibSBML::Model.new(2,2)
    e = LibSBML::Event.new(2,2)
    t = LibSBML::Trigger.new(2,2)
    t.setMath(LibSBML.parseFormula("true"))
    e.setId( "e")
    e.setTrigger(t)
    e.createEventAssignment()
    e1 = LibSBML::Event.new(2,2)
    e1.setId( "e")
    e1.setTrigger(t)
    e1.createEventAssignment()
    i = m.addEvent(e)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumEvents() == 1 )
    i = m.addEvent(e1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumEvents() == 1 )
    e = nil
    e1 = nil
    m = nil
  end

  def test_Model_addFunctionDefinition1
    m = LibSBML::Model.new(2,2)
    fd = LibSBML::FunctionDefinition.new(2,2)
    i = m.addFunctionDefinition(fd)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    fd.setId( "fd")
    i = m.addFunctionDefinition(fd)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    fd.setMath(LibSBML::parseFormula("fd"))
    i = m.addFunctionDefinition(fd)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumFunctionDefinitions() == 1 )
    fd = nil
    m = nil
  end

  def test_Model_addFunctionDefinition2
    m = LibSBML::Model.new(2,2)
    fd = LibSBML::FunctionDefinition.new(2,1)
    fd.setId( "fd")
    fd.setMath(LibSBML::parseFormula("fd"))
    i = m.addFunctionDefinition(fd)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumFunctionDefinitions() == 0 )
    fd = nil
    m = nil
  end

  def test_Model_addFunctionDefinition3
    m = LibSBML::Model.new(2,2)
    fd = nil
    i = m.addFunctionDefinition(fd)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumFunctionDefinitions() == 0 )
    m = nil
  end

  def test_Model_addFunctionDefinition4
    m = LibSBML::Model.new(2,2)
    fd = LibSBML::FunctionDefinition.new(2,2)
    fd.setId( "fd")
    fd.setMath(LibSBML::parseFormula("fd"))
    fd1 = LibSBML::FunctionDefinition.new(2,2)
    fd1.setId( "fd")
    fd1.setMath(LibSBML::parseFormula("fd"))
    i = m.addFunctionDefinition(fd)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumFunctionDefinitions() == 1 )
    i = m.addFunctionDefinition(fd1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumFunctionDefinitions() == 1 )
    fd = nil
    fd1 = nil
    m = nil
  end

  def test_Model_addInitialAssignment1
    m = LibSBML::Model.new(2,2)
    ia = LibSBML::InitialAssignment.new(2,2)
    i = m.addInitialAssignment(ia)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    ia.setSymbol( "i")
    i = m.addInitialAssignment(ia)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    ia.setMath(LibSBML::parseFormula("gg"))
    i = m.addInitialAssignment(ia)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumInitialAssignments() == 1 )
    ia = nil
    m = nil
  end

  def test_Model_addInitialAssignment2
    m = LibSBML::Model.new(2,2)
    ia = LibSBML::InitialAssignment.new(2,3)
    ia.setSymbol( "i")
    ia.setMath(LibSBML::parseFormula("gg"))
    i = m.addInitialAssignment(ia)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumInitialAssignments() == 0 )
    ia = nil
    m = nil
  end

  def test_Model_addInitialAssignment3
    m = LibSBML::Model.new(2,2)
    ia = nil
    i = m.addInitialAssignment(ia)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumInitialAssignments() == 0 )
    m = nil
  end

  def test_Model_addInitialAssignment4
    m = LibSBML::Model.new(2,2)
    ia = LibSBML::InitialAssignment.new(2,2)
    ia.setSymbol( "ia")
    ia.setMath(LibSBML::parseFormula("a+b"))
    ia1 = LibSBML::InitialAssignment.new(2,2)
    ia1.setSymbol( "ia")
    ia1.setMath(LibSBML::parseFormula("a+b"))
    i = m.addInitialAssignment(ia)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumInitialAssignments() == 1 )
    i = m.addInitialAssignment(ia1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumInitialAssignments() == 1 )
    ia = nil
    ia1 = nil
    m = nil
  end

  def test_Model_addParameter1
    m = LibSBML::Model.new(2,2)
    p = LibSBML::Parameter.new(2,2)
    i = m.addParameter(p)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    p.setId( "p")
    i = m.addParameter(p)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumParameters() == 1 )
    p = nil
    m = nil
  end

  def test_Model_addParameter2
    m = LibSBML::Model.new(2,2)
    p = LibSBML::Parameter.new(2,1)
    p.setId( "p")
    i = m.addParameter(p)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumParameters() == 0 )
    p = nil
    m = nil
  end

  def test_Model_addParameter3
    m = LibSBML::Model.new(2,2)
    p = LibSBML::Parameter.new(1,2)
    p.setId( "p")
    i = m.addParameter(p)
    assert( i == LibSBML::LIBSBML_LEVEL_MISMATCH )
    assert( m.getNumParameters() == 0 )
    p = nil
    m = nil
  end

  def test_Model_addParameter4
    m = LibSBML::Model.new(2,2)
    p = nil
    i = m.addParameter(p)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumParameters() == 0 )
    m = nil
  end

  def test_Model_addParameter5
    m = LibSBML::Model.new(2,2)
    p = LibSBML::Parameter.new(2,2)
    p.setId( "p")
    p1 = LibSBML::Parameter.new(2,2)
    p1.setId( "p")
    i = m.addParameter(p)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumParameters() == 1 )
    i = m.addParameter(p1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumParameters() == 1 )
    p = nil
    p1 = nil
    m = nil
  end

  def test_Model_addReaction1
    m = LibSBML::Model.new(2,2)
    r = LibSBML::Reaction.new(2,2)
    i = m.addReaction(r)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    r.setId( "r")
    i = m.addReaction(r)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumReactions() == 1 )
    r = nil
    m = nil
  end

  def test_Model_addReaction2
    m = LibSBML::Model.new(2,2)
    r = LibSBML::Reaction.new(2,1)
    r.setId( "r")
    i = m.addReaction(r)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumReactions() == 0 )
    r = nil
    m = nil
  end

  def test_Model_addReaction3
    m = LibSBML::Model.new(2,2)
    r = LibSBML::Reaction.new(1,2)
    r.setId( "r")
    i = m.addReaction(r)
    assert( i == LibSBML::LIBSBML_LEVEL_MISMATCH )
    assert( m.getNumReactions() == 0 )
    r = nil
    m = nil
  end

  def test_Model_addReaction4
    m = LibSBML::Model.new(2,2)
    r = nil
    i = m.addReaction(r)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumReactions() == 0 )
    m = nil
  end

  def test_Model_addReaction5
    m = LibSBML::Model.new(2,2)
    r = LibSBML::Reaction.new(2,2)
    r.setId( "r")
    r1 = LibSBML::Reaction.new(2,2)
    r1.setId( "r")
    i = m.addReaction(r)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumReactions() == 1 )
    i = m.addReaction(r1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumReactions() == 1 )
    r = nil
    r1 = nil
    m = nil
  end

  def test_Model_addRule1
    m = LibSBML::Model.new(2,2)
    r = LibSBML::AssignmentRule.new(2,2)
    i = m.addRule(r)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    r.setVariable( "f")
    i = m.addRule(r)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    r.setMath(LibSBML::parseFormula("a-n"))
    i = m.addRule(r)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumRules() == 1 )
    r = nil
    m = nil
  end

  def test_Model_addRule2
    m = LibSBML::Model.new(2,2)
    r = LibSBML::AssignmentRule.new(2,1)
    r.setVariable( "f")
    r.setMath(LibSBML::parseFormula("a-n"))
    i = m.addRule(r)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumRules() == 0 )
    r = nil
    m = nil
  end

  def test_Model_addRule3
    m = LibSBML::Model.new(2,2)
    r = LibSBML::AssignmentRule.new(1,2)
    r.setVariable( "f")
    r.setMath(LibSBML::parseFormula("a-n"))
    i = m.addRule(r)
    assert( i == LibSBML::LIBSBML_LEVEL_MISMATCH )
    assert( m.getNumRules() == 0 )
    r = nil
    m = nil
  end

  def test_Model_addRule4
    m = LibSBML::Model.new(2,2)
    r = nil
    i = m.addRule(r)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumRules() == 0 )
    m = nil
  end

  def test_Model_addRule5
    m = LibSBML::Model.new(2,2)
    ar = LibSBML::AssignmentRule.new(2,2)
    ar.setVariable( "ar")
    ar.setMath(LibSBML::parseFormula("a-j"))
    ar1 = LibSBML::AssignmentRule.new(2,2)
    ar1.setVariable( "ar")
    ar1.setMath(LibSBML::parseFormula("a-j"))
    i = m.addRule(ar)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumRules() == 1 )
    i = m.addRule(ar1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumRules() == 1 )
    ar = nil
    ar1 = nil
    m = nil
  end

  def test_Model_addSpecies1
    m = LibSBML::Model.new(2,2)
    s = LibSBML::Species.new(2,2)
    i = m.addSpecies(s)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    s.setId( "s")
    i = m.addSpecies(s)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    s.setCompartment( "c")
    i = m.addSpecies(s)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumSpecies() == 1 )
    s = nil
    m = nil
  end

  def test_Model_addSpecies2
    m = LibSBML::Model.new(2,2)
    s = LibSBML::Species.new(2,1)
    s.setId( "s")
    s.setCompartment( "c")
    i = m.addSpecies(s)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumSpecies() == 0 )
    s = nil
    m = nil
  end

  def test_Model_addSpecies3
    m = LibSBML::Model.new(2,2)
    s = LibSBML::Species.new(1,2)
    s.setId( "s")
    s.setCompartment( "c")
    s.setInitialAmount(2)
    i = m.addSpecies(s)
    assert( i == LibSBML::LIBSBML_LEVEL_MISMATCH )
    assert( m.getNumSpecies() == 0 )
    s = nil
    m = nil
  end

  def test_Model_addSpecies4
    m = LibSBML::Model.new(2,2)
    s = nil
    i = m.addSpecies(s)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumSpecies() == 0 )
    m = nil
  end

  def test_Model_addSpecies5
    m = LibSBML::Model.new(2,2)
    s = LibSBML::Species.new(2,2)
    s.setId( "s")
    s.setCompartment( "c")
    s1 = LibSBML::Species.new(2,2)
    s1.setId( "s")
    s1.setCompartment( "c")
    i = m.addSpecies(s)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumSpecies() == 1 )
    i = m.addSpecies(s1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumSpecies() == 1 )
    s = nil
    s1 = nil
    m = nil
  end

  def test_Model_addSpeciesType1
    m = LibSBML::Model.new(2,2)
    st = LibSBML::SpeciesType.new(2,2)
    i = m.addSpeciesType(st)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    st.setId( "st")
    i = m.addSpeciesType(st)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumSpeciesTypes() == 1 )
    st = nil
    m = nil
  end

  def test_Model_addSpeciesType2
    m = LibSBML::Model.new(2,2)
    st = LibSBML::SpeciesType.new(2,3)
    st.setId( "st")
    i = m.addSpeciesType(st)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumSpeciesTypes() == 0 )
    st = nil
    m = nil
  end

  def test_Model_addSpeciesType3
    m = LibSBML::Model.new(2,2)
    st = nil
    i = m.addSpeciesType(st)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumSpeciesTypes() == 0 )
    m = nil
  end

  def test_Model_addSpeciesType4
    m = LibSBML::Model.new(2,2)
    st = LibSBML::SpeciesType.new(2,2)
    st.setId( "st")
    st1 = LibSBML::SpeciesType.new(2,2)
    st1.setId( "st")
    i = m.addSpeciesType(st)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumSpeciesTypes() == 1 )
    i = m.addSpeciesType(st1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumSpeciesTypes() == 1 )
    st = nil
    st1 = nil
    m = nil
  end

  def test_Model_addUnitDefinition1
    m = LibSBML::Model.new(2,2)
    ud = LibSBML::UnitDefinition.new(2,2)
    i = m.addUnitDefinition(ud)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    ud.createUnit()
    i = m.addUnitDefinition(ud)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    ud.setId( "ud")
    i = m.addUnitDefinition(ud)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumUnitDefinitions() == 1 )
    ud = nil
    m = nil
  end

  def test_Model_addUnitDefinition2
    m = LibSBML::Model.new(2,2)
    ud = LibSBML::UnitDefinition.new(2,1)
    ud.createUnit()
    ud.setId( "ud")
    i = m.addUnitDefinition(ud)
    assert( i == LibSBML::LIBSBML_VERSION_MISMATCH )
    assert( m.getNumUnitDefinitions() == 0 )
    ud = nil
    m = nil
  end

  def test_Model_addUnitDefinition3
    m = LibSBML::Model.new(2,2)
    ud = LibSBML::UnitDefinition.new(1,2)
    ud.createUnit()
    ud.setId( "ud")
    i = m.addUnitDefinition(ud)
    assert( i == LibSBML::LIBSBML_LEVEL_MISMATCH )
    assert( m.getNumUnitDefinitions() == 0 )
    ud = nil
    m = nil
  end

  def test_Model_addUnitDefinition4
    m = LibSBML::Model.new(2,2)
    ud = nil
    i = m.addUnitDefinition(ud)
    assert( i == LibSBML::LIBSBML_OPERATION_FAILED )
    assert( m.getNumUnitDefinitions() == 0 )
    m = nil
  end

  def test_Model_addUnitDefinition5
    m = LibSBML::Model.new(2,2)
    ud = LibSBML::UnitDefinition.new(2,2)
    ud.setId( "ud")
    ud.createUnit()
    ud1 = LibSBML::UnitDefinition.new(2,2)
    ud1.setId( "ud")
    ud1.createUnit()
    i = m.addUnitDefinition(ud)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert( m.getNumUnitDefinitions() == 1 )
    i = m.addUnitDefinition(ud1)
    assert( i == LibSBML::LIBSBML_DUPLICATE_OBJECT_ID )
    assert( m.getNumUnitDefinitions() == 1 )
    ud = nil
    ud1 = nil
    m = nil
  end

  def test_Model_createCompartment
    m = LibSBML::Model.new(2,2)
    p = m.createCompartment()
    assert( m.getNumCompartments() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createCompartmentType
    m = LibSBML::Model.new(2,2)
    p = m.createCompartmentType()
    assert( m.getNumCompartmentTypes() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createConstraint
    m = LibSBML::Model.new(2,2)
    p = m.createConstraint()
    assert( m.getNumConstraints() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createEvent
    m = LibSBML::Model.new(2,2)
    p = m.createEvent()
    assert( m.getNumEvents() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createEventAssignment
    m = LibSBML::Model.new(2,2)
    p = m.createEvent()
    ea = m.createEventAssignment()
    assert( p.getNumEventAssignments() == 1 )
    assert( (ea).getLevel() == 2 )
    assert( (ea).getVersion() == 2 )
    m = nil
  end

  def test_Model_createFunctionDefinition
    m = LibSBML::Model.new(2,2)
    p = m.createFunctionDefinition()
    assert( m.getNumFunctionDefinitions() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createInitialAssignment
    m = LibSBML::Model.new(2,2)
    p = m.createInitialAssignment()
    assert( m.getNumInitialAssignments() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createKineticLaw
    m = LibSBML::Model.new(2,2)
    p = m.createReaction()
    kl = m.createKineticLaw()
    assert( p.isSetKineticLaw() == true )
    assert( (kl).getLevel() == 2 )
    assert( (kl).getVersion() == 2 )
    m = nil
  end

  def test_Model_createKineticLawParameters
    m = LibSBML::Model.new(2,2)
    r = m.createReaction()
    kl = m.createKineticLaw()
    p = m.createKineticLawParameter()
    assert( r.isSetKineticLaw() == true )
    assert( kl.getNumParameters() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createModifier
    m = LibSBML::Model.new(2,2)
    p = m.createReaction()
    sr = m.createModifier()
    assert( p.getNumModifiers() == 1 )
    assert( (sr).getLevel() == 2 )
    assert( (sr).getVersion() == 2 )
    m = nil
  end

  def test_Model_createParameter
    m = LibSBML::Model.new(2,2)
    p = m.createParameter()
    assert( m.getNumParameters() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createProduct
    m = LibSBML::Model.new(2,2)
    p = m.createReaction()
    sr = m.createProduct()
    assert( p.getNumProducts() == 1 )
    assert( (sr).getLevel() == 2 )
    assert( (sr).getVersion() == 2 )
    m = nil
  end

  def test_Model_createReactant
    m = LibSBML::Model.new(2,2)
    p = m.createReaction()
    sr = m.createReactant()
    assert( p.getNumReactants() == 1 )
    assert( (sr).getLevel() == 2 )
    assert( (sr).getVersion() == 2 )
    m = nil
  end

  def test_Model_createReaction
    m = LibSBML::Model.new(2,2)
    p = m.createReaction()
    assert( m.getNumReactions() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createRule
    m = LibSBML::Model.new(2,2)
    p = m.createAssignmentRule()
    assert( m.getNumRules() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createSpecies
    m = LibSBML::Model.new(2,2)
    p = m.createSpecies()
    assert( m.getNumSpecies() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createSpeciesType
    m = LibSBML::Model.new(2,2)
    p = m.createSpeciesType()
    assert( m.getNumSpeciesTypes() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_createUnit
    m = LibSBML::Model.new(2,2)
    p = m.createUnitDefinition()
    u = m.createUnit()
    assert( p.getNumUnits() == 1 )
    assert( (u).getLevel() == 2 )
    assert( (u).getVersion() == 2 )
    m = nil
  end

  def test_Model_createUnitDefinition
    m = LibSBML::Model.new(2,2)
    p = m.createUnitDefinition()
    assert( m.getNumUnitDefinitions() == 1 )
    assert( (p).getLevel() == 2 )
    assert( (p).getVersion() == 2 )
    m = nil
  end

  def test_Model_setId1
    id =  "1e1";
    i = @@m.setId(id)
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, @@m.isSetId()
  end

  def test_Model_setId2
    id =  "e1";
    i = @@m.setId(id)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert (( id == @@m.getId() ))
    assert_equal true, @@m.isSetId()
    i = @@m.setId("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@m.isSetId()
  end

  def test_Model_setId3
    id =  "e1";
    i = @@m.setId(id)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert (( id == @@m.getId() ))
    assert_equal true, @@m.isSetId()
    i = @@m.unsetId()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@m.isSetId()
  end

  def test_Model_setModelHistory1
    @@m.setMetaId("_001")
    mh = LibSBML::ModelHistory.new()
    i = @@m.setModelHistory(mh)
    assert( i == LibSBML::LIBSBML_INVALID_OBJECT )
    assert_equal false, @@m.isSetModelHistory()
    i = @@m.unsetModelHistory()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@m.isSetModelHistory()
    mh = nil
  end

  def test_Model_setModelHistory2
    @@m.setMetaId("_001")
    i = @@m.setModelHistory(nil)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@m.isSetModelHistory()
    i = @@m.unsetModelHistory()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@m.isSetModelHistory()
  end

  def test_Model_setName1
    name =  "3Set_k2";
    i = @@m.setName(name)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal true, @@m.isSetName()
  end

  def test_Model_setName2
    name =  "Set k2";
    i = @@m.setName(name)
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert (( name == @@m.getName() ))
    assert_equal true, @@m.isSetName()
    i = @@m.unsetName()
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@m.isSetName()
  end

  def test_Model_setName3
    i = @@m.setName("")
    assert( i == LibSBML::LIBSBML_OPERATION_SUCCESS )
    assert_equal false, @@m.isSetName()
  end

  def test_Model_setName4
    m = LibSBML::Model.new(1,2)
    i = m.setName( "11dd")
    assert( i == LibSBML::LIBSBML_INVALID_ATTRIBUTE_VALUE )
    assert_equal false, m.isSetName()
  end

end
