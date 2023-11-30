<?xml version="1.0" encoding="UTF-8"?>

<mffsvg xmlns="http://www.compart.com/ns/mff/svg" version="201612">
   <!--
      **************************************************************************

      Copyright (C) Compart AG  2011

      Release: 201612

      **************************************************************************
-->
   <!--Settings for input.-->

   <input>
      <!--The element "pagedefinition" determines the correct positioning of text and
                images on the page. The attribute "name" specifies the name of the page
                definition.-->

      <pagedefinitionlist>
         <!--Specifies the "pagedefinition" for page output.-->

         <pagedefinition name="Default">
            <!--The declaration of a paper size. The paper size can be
                specified by the name of a standard paper size with orientation or by numeric
                specification of width and length.-->
            <!--Attribute: format @comment: The name of a standard paper size. Examples for possible
                values are "A4" and "LETTER". A complete list of the possible values is included in
                the DocBridge Mill Manual. This attribute does not have a default
                value.-->
            <!--Attribute: orientation @comment: The orientation of a standard paper size. Possible values of
                this attribute are "Portrait", "Landscape", "RevPortrait", and "RevLandscape". The
                default value of this attribute is "Portrait".-->
            <!--Attribute: height @comment: The height of the paper sheet. Valid length units are "tcm",
                "mm", "cm", "dm", "m", "in", "inch", "mil", "thou", "pt", "tw", "cpbu", "ch", and
                "ln".-->
            <!--Attribute: width @comment: The width of the paper sheet. Valid length units are "tcm",
                "mm", "cm", "dm", "m", "in", "inch", "mil", "thou", "pt", "tw", "cpbu", "ch", and
                "ln".-->

            <papersize format="A4" orientation="Portrait" height="29.7 cm" width="21 cm"/>

            <!--The declaration of sheet margins.-->
            <!--Attribute: left @comment: The width of the left sheet margin. Valid length units are
                "tcm", "mm", "cm", "dm", "m", "in", "inch", "mil", "thou", "pt", "tw", "cpbu", "ch",
                and "ln".-->
            <!--Attribute: right @comment: The width of the right sheet margin. Valid length units are
                "tcm", "mm", "cm", "dm", "m", "in", "inch", "mil", "thou", "pt", "tw", "cpbu", "ch",
                and "ln".-->
            <!--Attribute: top @comment: The height of the top sheet margin. Valid length units are
                "tcm", "mm", "cm", "dm", "m", "in", "inch", "mil", "thou", "pt", "tw", "cpbu", "ch",
                and "ln".-->
            <!--Attribute: bottom @comment: The height of the bottom sheet margin. Valid length units are
                "tcm", "mm", "cm", "dm", "m", "in", "inch", "mil", "thou", "pt", "tw", "cpbu", "ch",
                and "ln".-->

            <margins left="0 cm" right="0 cm" top="0 cm" bottom="0 cm"/>

            <!--Specifies the resolution that is used in the Presentation Area. This
                adjustment can help avoid issues (e.g. rounding errors) caused by a low resolution.
                If 0 is specified, the resolutions defined by the page or by the medium map are
                used. Issues caused by a low resolution can be avoided by larger values like
                7200.-->

            <resolution rx="7200" ry="7200"/>
         </pagedefinition>
      </pagedefinitionlist>
   </input>

   <!--Settings for output.-->

   <output>
      <!--Specifies how fonts are handled for the creation of output documents. Valid
                values of the attribute "default" are: -->

      <fonthandling default="Auto"/>

      <!--The attribute "embed" specifies whether the images that will be written to
                the output document will be embedded or written as resource in the resource file.
                Valid values of the attribute "embed" are: -->

      <ImageHandling embed="always"/>
   </output>

   <!--Font is specified by "family", "width" and "style".-->

   <fontlist>
      <font family="arial" reftype="truetype">
         <face weight="medium" style="upright" fontfile="arial" fontfiletype="truetype"/>
         <face weight="bold" style="upright" fontfile="arialbd" fontfiletype="truetype"/>
         <face weight="medium" style="italic" fontfile="ariali" fontfiletype="truetype"/>
      </font>

      <font family="times new roman" reftype="truetype">
         <face weight="medium" style="upright" fontfile="times" fontfiletype="truetype"/>
         <face weight="bold" style="upright" fontfile="timesbd" fontfiletype="truetype"/>
         <face weight="medium" style="italic" fontfile="timesi" fontfiletype="truetype"/>
      </font>

			<font family="Polo" reftype="truetype">
      <face weight="medium" style="upright" fontfile="polo"   fontfiletype="truetype"/>
      <face weight="bold"   style="upright" fontfile="polob"  fontfiletype="truetype"/>
      <face weight="medium" style="italic"  fontfile="poloi"  fontfiletype="truetype"/>
      <face weight="bold"   style="italic"  fontfile="polobi" fontfiletype="truetype"/>
    </font>
   </fontlist>

   <resourcelist>
      <fileslist>
   			 <files path="c:/WINDOWS/Fonts" type="truetype" extension="ttf"/>
         <files path="resource/Font" type="TrueType" extension="ttf"/>
         <files path="resource/rgb" type="icc" extension="icc"/>
         <files path="resource/cmyk" type="icc" extension="icc"/>
      </fileslist>
   </resourcelist>
</mffsvg>
