/**
 * @file customResolver.java
 * @brief Demonstrates implementation of a custom resolver for comp models
 * @author Frank Bergmann
 * 
 * <!--------------------------------------------------------------------------
 * This sample program is distributed under a different license than the rest
 * of libSBML.  This program uses the open-source MIT license, as follows:
 *
 * Copyright (c) 2013-2016 by the California Institute of Technology
 * (California, USA), the European Bioinformatics Institute (EMBL-EBI, UK)
 * and the University of Heidelberg (Germany), with support from the National
 * Institutes of Health (USA) under grant R01GM070923.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * Neither the name of the California Institute of Technology (Caltech), nor
 * of the European Bioinformatics Institute (EMBL-EBI), nor of the University
 * of Heidelberg, nor the names of any contributors, may be used to endorse
 * or promote products derived from this software without specific prior
 * written permission.
 * ------------------------------------------------------------------------ -->
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import org.sbml.libsbml.CompPkgNamespaces;
import org.sbml.libsbml.CompSBMLDocumentPlugin;
import org.sbml.libsbml.ExternalModelDefinition;
import org.sbml.libsbml.Model;
import org.sbml.libsbml.SBMLDocument;
import org.sbml.libsbml.SBMLExtensionRegistry;
import org.sbml.libsbml.SBMLResolver;
import org.sbml.libsbml.SBMLResolverRegistry;
import org.sbml.libsbml.SBMLUri;
import org.sbml.libsbml.libsbml;

public class customResolver
    extends SBMLResolver
{
    public customResolver()
    {
        super();
    }


    public customResolver(customResolver orig)
    {
        super(orig);
    }


    public @Override
    SBMLResolver cloneObject()
    {
        return new customResolver(this);
    }


    public @Override
    SBMLDocument resolve(String uri, String baseUri)
    {
        try
        {
            URL website = new URL(uri);
            URLConnection connection = website.openConnection();
            BufferedReader in = new BufferedReader(
                                                   new InputStreamReader(
                                                                         connection.getInputStream()));

            StringBuilder response = new StringBuilder();
            String inputLine;

            while ((inputLine = in.readLine()) != null)
                response.append(inputLine);

            in.close();

            return libsbml.readSBMLFromString(response.toString());
        }
        catch (Exception e)
        {
            // couldn't download file handle this somehow
            e.printStackTrace();
            return null;
        }
    }


    public @Override
    SBMLUri resolveUri(String uri, String baseUri)
    {
        SBMLUri uriObject = new SBMLUri(uri);
        if (!uriObject.getScheme().equals("http")) return null;
        return uriObject;
    }


    public static void main(String[] args)
    {
        if (!SBMLExtensionRegistry.isPackageEnabled("comp"))
        {
            println("This copy of libSBML does not contain the 'comp' extension");
            println("Unable to proceed with the resolver example the model.");
            System.exit(2);
        }

        // create custom resolver
        customResolver resolver = new customResolver();

        // add the resolver and store its index, so we can free it later.
        int index = SBMLResolverRegistry.getInstance().addResolver(resolver);

        // create a new document with comp enabled
        SBMLDocument doc = new SBMLDocument(new CompPkgNamespaces());

        // get a hold of a plugin object
        CompSBMLDocumentPlugin plugin = (CompSBMLDocumentPlugin) doc.getPlugin("comp");

        // create an external model definition
        ExternalModelDefinition external = plugin.createExternalModelDefinition();

        // set the source to the URI
        external.setSource("http://www.ebi.ac.uk/biomodels-main/download?mid=BMID000000063853");

        // resolve the model
        Model model = external.getReferencedModel();

        if (model == null)
        {
            System.err.println("couldn't resolve");
        }

        // model is ready to be used now, however, only as long and the document
        // holding the external model definition is still alive and referenced

        System.out.println("Model id: " + model.getId());
        System.out.println("# species: " + model.getNumSpecies());
        System.out.println("# reactions: " + model.getNumReactions());

        // now that we are done get rid of the resolver
        SBMLResolverRegistry.getInstance().removeResolver(index);
        // also clear the resolver instance, just to be sure that it has 
        // no more references to the java resolver
        SBMLResolverRegistry.deleteResolerRegistryInstance();
        
        // finally we can get rid of the java resolver 
        resolver = null;

    }


    static void println(String msg)
    {
        System.out.println(msg);
    }

    /**
     * Loads the SWIG-generated libSBML Java module when this class is
     * loaded, or reports a sensible diagnostic message about why it failed.
     */
    static
    {
        try
        {
            System.loadLibrary("sbmlj");
            // For extra safety, check that the jar file is in the classpath.
            Class.forName("org.sbml.libsbml.libsbml");
        }
        catch (UnsatisfiedLinkError e)
        {
            System.err.println("Error encountered while attempting to load libSBML:");
            System.err.println("Please check the value of your "
                + (System.getProperty("os.name").startsWith("Mac OS") ? "DYLD_LIBRARY_PATH" : "LD_LIBRARY_PATH")
                + " environment variable and/or your"
                + " 'java.library.path' system property (depending on"
                + " which one you are using) to make sure it list the"
                + " directories needed to find the "
                + System.mapLibraryName("sbmlj") + " library file and"
                + " libraries it depends upon (e.g., the XML parser).");
            System.exit(1);
        }
        catch (ClassNotFoundException e)
        {
            System.err.println("Error: unable to load the file 'libsbmlj.jar'."
                + " It is likely that your -classpath command line "
                + " setting or your CLASSPATH environment variable "
                + " do not include the file 'libsbmlj.jar'.");
            e.printStackTrace();

            System.exit(1);
        }
        catch (SecurityException e)
        {
            System.err.println("Error encountered while attempting to load libSBML:");
            e.printStackTrace();
            System.err.println("Could not load the libSBML library files due to a"
                + " security exception.\n");
            System.exit(1);
        }
    }
}
