<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>
<!--
      **************************************************************************

      Copyright (C) Compart AG  2011

      Release: 201808

      **************************************************************************
-->

<!DOCTYPE mffxhm>
<mffxhm>
  
  <!--Settings for input.-->
  
  <input>
    <!--Parsing mode can be specified by "value": sax: Use Sax mode to parse the
                file, not to use, if selectors are used in the style sheet. dom: Use Dom mode. Scan
                the whole file before processing it in Dom mode. auto: Automatic behaviour, depends
                on file size.-->
    
    <parsingmode value="auto"/>
    
    <!--Pixel resolution for pixel values in ppi (pixels per inch), default 72 ppi.-->    
    <resolution rx="96" ry="96"/>
    
    <defaultsetting>
      <!--Default point size setting.-->      
      <pointsize value="12"/>
      
    </defaultsetting>
    
    <!--Specifies the "pagedefinition" for page output.-->
    
    <pagedefinitionlist>
      <pagedefinition name="Default">
        <!--The "papersize" can be specified either by a combination of
                "format" and "orientation" or by a combination of "width" and "height".
            -->
        
        <papersize height="29.7 cm" width="21 cm"/>
        <margins left="0 cm" right="0 cm" top="0 cm" bottom="0 cm"/>
      </pagedefinition>
      
      <pagedefinition name="PageAny">
        <papersize format="A4" orientation="Portrait"/>
        <margins left="0 cm" right="0 cm" top="0 cm" bottom="0 cm"/>
      </pagedefinition>
    </pagedefinitionlist>
  </input>
  
  <!--Settings for output.-->
  
  <output>
    <!--Create an HTML file of version 5 or 4, default is HTML5.-->
    
    <version value="html5"/>
    
    <!--Control which header will be written, default is page. No header written if
                the value is none.-->
    
    <Header location="page"/>
    
    <!--Specifies how fonts are handled for the creation of output documents. Valid
                values of the attribute "default" are: -->
    
    <fonthandling default="Auto"/>
    
    <!--The attribute "embed" specifies whether the images that will be written to
                the output document will be embedded or written as resource in the resource file.
                Valid values of the attribute "embed" are: -->
    
    <ImageHandling embed="Auto"/>
  </output>
  
  <!--Font is specified by "family", "width" and "style".-->
  
  <fontlist>
    <font family="arial" reftype="truetype">
      <face weight="medium" style="upright" fontfile="arial"   fontfiletype="truetype" default="true"/>
      <face weight="bold"   style="upright" fontfile="arialbd" fontfiletype="truetype"/>
      <face weight="medium" style="italic"  fontfile="ariali"  fontfiletype="truetype"/>
      <face weight="bold"   style="italic"  fontfile="arialbi" fontfiletype="truetype"/>
    </font>
	
	<font family="Courier new" reftype="truetype">
      <face weight="medium" style="upright" fontfile="cour"   fontfiletype="truetype" default="true"/>
      <face weight="bold"   style="upright" fontfile="courbd" fontfiletype="truetype"/>
      <face weight="medium" style="italic"  fontfile="couri"  fontfiletype="truetype"/>
      <face weight="bold"   style="italic"  fontfile="courbi" fontfiletype="truetype"/>
    </font>
     
    <font family="times new roman" reftype="truetype">
      <face weight="medium" style="upright" fontfile="times"   fontfiletype="truetype"/>
      <face weight="bold"   style="upright" fontfile="timesbd" fontfiletype="truetype"/>
      <face weight="medium" style="italic"  fontfile="timesi"  fontfiletype="truetype"/>
      <face weight="bold"   style="italic"  fontfile="timesbi" fontfiletype="truetype"/>
    </font>
    
    <font family="Century Gothic" reftype="truetype">
      <face weight="medium" style="upright" fontfile="GOTHIC"   fontfiletype="truetype"/>
   <face weight="bold"   style="upright" fontfile="GOTHICBD" fontfiletype="truetype"/>
</font>
 <font family="Polo" reftype="truetype">
      <face weight="medium" style="upright" fontfile="polo"   fontfiletype="truetype" embed="always" />
      <face weight="bold"   style="upright" fontfile="polob"  fontfiletype="truetype" embed="always" />
      <face weight="medium" style="italic"  fontfile="poloi"  fontfiletype="truetype" embed="always" />
      <face weight="bold"   style="italic"  fontfile="polobi" fontfiletype="truetype" embed="always" />
    </font>
	 <font family="Source Sans Pro" reftype="truetype">
      <face weight="medium" style="upright" fontfile="SourceSansPro-light.ttf"   fontfiletype="truetype" embed="always" />
      <face weight="bold"   style="upright" fontfile="SourceSansPro-Bold"  fontfiletype="truetype" embed="always"/>
      <face weight="italic" style="italic"  fontfile="SourceSansPro-Regular_0.ttf"  fontfiletype="truetype"/>
     </font>  
	 <font family="OCRB" reftype="truetype">
      <face weight="medium" style="upright" fontfile="OCRB2.ttf"   fontfiletype="truetype" />
     </font>
	 <font family="OCRBALT" reftype="truetype">
      <face weight="medium" style="upright" fontfile="OCRB3.ttf"   fontfiletype="truetype" />
	  </font>
	 <font family="OCRBMAX" reftype="truetype">
      <face weight="medium" style="upright" fontfile="OCRAEXT.ttf"   fontfiletype="truetype" />
      <face weight="bold"   style="upright" fontfile="27781_OcrB2.ttf"  fontfiletype="truetype" embed="always"/>
      <face weight="italic" style="italic"  fontfile="OCRAEXT"  fontfiletype="truetype"/>
      
    </font>
	 <font family="wingdings" reftype="truetype">
      <face weight="medium" style="upright" fontfile="wingding.ttf"   fontfiletype="truetype" />
      <face weight="bold"   style="upright" fontfile="SourceSansPro-Bold"  fontfiletype="truetype" embed="always"/>
      <face weight="italic" style="italic"  fontfile="SourceSansPro-Regular_0.ttf"  fontfiletype="truetype"/>
      
    </font>
	<font family="impact" reftype="truetype">
      <face weight="medium" style="upright" fontfile="impact"   fontfiletype="truetype" embed="always"/>
      <face weight="bold"   style="upright" fontfile="SourceSansPro-Bold.otf"  fontfiletype="truetype" embed="always"/>
      <face weight="medium" style="italic"  fontfile="poloi"  fontfiletype="truetype"/>
      <face weight="bold"   style="italic"  fontfile="polobi" fontfiletype="truetype"/>
    </font>
	
    
  </fontlist>
  
  <!--
	= Files =================================================================================
         type can be "TrueType", "Type1Font", "Type1Metrics" if it is not defined, the path
         will be used for all types, extension can be emtpy, <extension> or wildcard
  =========================================================================================
  -->
   <resourcelist>
      <fileslist>
        
         <files path="c:/WINDOWS/Fonts" type="truetype" extension="ttf"/>
         <files path="resource/rgb" type="icc" extension="icc"/>
         <files path="resource/cmyk" type="icc" extension="icc"/>
	 <files path="C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\resources\pfb" type="type1Font" extension="pfb"/>
		 
		
		 <files path="C:/Users/maxle/tomcat/apache-tomcat-8.5.37/webapps/Impress/Documents/resources/images"/>
		 <files path="C:/Users/maxle/tomcat/apache-tomcat-8.5.37/webapps/Impress/Documents/resources"/>
		 <files path="C:/Users/maxle/tomcat/apache-tomcat-8.5.37/webapps/Impress/Documents/CFI_TECH"/>
		<files path="C:/Users/maxle/tomcat/apache-tomcat-8.5.37/webapps/Impress/Documents/Projects/VIESGOFACLAST/Colectiva"/>
		
		  <files path="C:/Users/maxle/imprdocker/ImpressDocuments/resources/images"/>
	     <files path="C:/Users/maxle/tomcat/apache-tomcat-8.5.37/webapps/Impress/cgi/resource/Font" type="truetype" extension="ttf" />
		 
		
         
			</fileslist>
   </resourcelist>
</mffxhm>
