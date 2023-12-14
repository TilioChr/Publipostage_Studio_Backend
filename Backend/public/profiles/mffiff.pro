<?xml version="1.0" encoding="UTF-8"?>

<mffiff xmlns="http://www.compart.com/ns/mff/iff" version="201612">
   <!--
      **************************************************************************

      Copyright (C) Compart AG  2011

      Release: 201612

      **************************************************************************
-->
   <!--Font specified by "family", "width" and "style" can be rasterised To
                rasterize the text, rasterize="always" has to be specified. Important: for all point
                sizes correct or dummy device names must be specified -->

   <fontlist>
      <font family="Arial" serifstyle="Serif" spacing="Monospaced">
         <face weight="Medium" width="Normal" style="Upright" fontfile="arial" fontfiletype="TrueType"/>
      </font>

      <font family="SONORAN SERIF">
         <face weight="Medium" style="Upright" fontfile="cour" fontfiletype="TrueType"/>
         <face weight="Bold" style="Upright" fontfile="cour" fontfiletype="TrueType"/>
         <face weight="Bold" style="Italic" fontfile="cour" fontfiletype="TrueType"/>
      </font>

      <font family="Helvetica" serifstyle="SansSerif" spacing="Proportional">
         <face weight="Medium" width="Normal" style="Upright" fontfile="arial" fontfiletype="TrueType"/>
      </font>

      <font family="Helvetica-Bold" serifstyle="SansSerif" spacing="Proportional">
         <face weight="Bold" width="Normal" style="Upright" fontfile="arialbd" fontfiletype="TrueType"/>
      </font>

      <font family="Courier New">
         <face weight="Medium" style="Upright" fontfile="cour" fontfiletype="TrueType"/>
      </font>
   </fontlist>

   <resourcelist>
      <fileslist>
         <!--Several directories can be specified for the search for external
                resources.The "path" is mandatory. "Type", "extension" and "resolution" are
                optional. However, the more detailed the settings are, the more specific the search
                will be. Valid values for "type" are: OVERLAY, PAGESEGMENT, CODEDFONT, CODEPAGE,
                CHARSET, FORMDEF, RESOURCELIB, PAGEDEF or OBJECT. If the type is not defined, the
                path will be used for all types. The "extension" can be emtpy, <extension> or
                a wildcard. If the "resolution" is not specified, resources with any resolution will
                be searched in the path. -->

         <files path="resource/font" type="TrueType" extension="ttf"/>
         <files path="resource/font" type="Type1Font" extension="pfb"/>
								
         <!-- <files path="." type="truetype" extension="ttf"/> -->
         <!-- <files path="c:\WINDOWS\Fonts" type="truetype" extension="ttf"/>  -->
         <!-- <files path="c:\fonts" type="truetype" extension="ttf"/> -->
	<files path="C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\resources\pfb" type="type1Font" extension="pfb"/>
      </fileslist>
   </resourcelist>

   <!--Settings for input.-->

   <input>
      <imagedefaultres rx="72" ry="72"/>
   </input>

   <!--Settings for output.-->

   <output>
      <!--fullcolorrendering may be "Auto" or "None". The option is used if output is
                monochrome. If fullcolorrendering is "Auto", and there are colored items, the
                Presentation Area is rendered first to a full-page colored RGB image before being
                rendered to a monochrome image. The disadvantage can be a performance decrease. Use
                this option if there are unwanted differences in gray areas on the page. Default is
                None. -->

      <fullcolorrendering value="None"/>
      <pagedefinition>
         <!--<resolution rx="300" ry="300"/>-->
      </pagedefinition>

      <!--imagetype may be "Monochrome", "GrayScale", "Palette", "Rgb" or "Cmyk".
                Default value is "monochrome". keepfullpageimage: if true, the image type for the
                full page size image from input will be kept. default is true.-->

      <imagetype value="Monochrome" keepfullpageimage="true"/>

      <!--image resampling: imageresample mode: default, lanczos, hermite,
                catmullrom, bicubic. The image resampling can be set in images which have 8, 24 or
                32 bits per pixel. The default can be applied in all image types. -->

      <imageresample mode="Default"/>

      <imagecompressions>
         <!--Control image compression type. Incompatible types are ignored Multiple
                xml-imagecompression-elements are allowed (basically one for every possible
                (bitsperpixel, colorformat) pairing. Valid values for bits per pixel: "1", "4", "8",
                "24", "32" Valid values for colorformat: "grayscale", "palette", "rgb", "cmyk"
                Monochrome is 1 bitperpixel grayscale. Valid values for compression are: "default",
                "none", "rle", "lzw", "packbits", "ccittrle", "faxg3", "faxg4", "mmr", "ipfix",
                "jpeg", "pcd", "jpegnew", "zip", "jp2", "jbig2" Incompatible or not supported
                compressions are ignored-->

         <imagecompression bitsperpixel="1" colorformat="GrayScale" compression="Default" keeporiginal="false"/>
         <imagecompression bitsperpixel="1" colorformat="Palette" compression="Default" keeporiginal="false"/>
         <imagecompression bitsperpixel="8" colorformat="GrayScale" compression="Default" keeporiginal="false"/>
         <imagecompression bitsperpixel="8" colorformat="Palette" compression="Default" keeporiginal="false"/>
         <imagecompression bitsperpixel="24" colorformat="Rgb" compression="Default" keeporiginal="false"/>
         <imagecompression bitsperpixel="32" colorformat="Cmyk" compression="Default" keeporiginal="false"/>
      </imagecompressions>

      <!-- imageoutputhorizontalpixelalignment can be set to 2, 4, 8, 16 or 24 only.
                Other values are not allowed. -->

      <imageoutputhorizontalpixelalignment value="8"/>

      <!-- imageoutputverticalpixelalignment can be set to 2, 4, 8, 16 or 24 only.
                Other values are not allowed. -->

      <imageoutputverticalpixelalignment value="8"/>

      <!--PPM file format has two encodings: "binary" and "ascii"-->

      <PPM encoding="binary"/>

      <!--0..100-->

      <jpegquality value="90"/>

      <!--may be "screen", "screenmodified", "afp", "afpmodified", roughw0, roughw15,
                roughw45, roughw75, finew0, finew15, finew45 or finew75-->

      <rastersettype value="Screen"/>

      <!--gamma correction for gray patterns; intermediate values are interpolated if
                no value is specified, no correction will be done Default:-->

      <gammalist>
         <gammavalue from="0" to="0"/>
         <gammavalue from="7" to="48"/>
         <gammavalue from="15" to="72"/>
         <gammavalue from="23" to="88"/>
         <gammavalue from="31" to="104"/>
         <gammavalue from="39" to="112"/>
         <gammavalue from="47" to="120"/>
         <gammavalue from="55" to="128"/>
         <gammavalue from="63" to="136"/>
         <gammavalue from="71" to="144"/>
         <gammavalue from="79" to="152"/>
         <gammavalue from="87" to="160"/>
         <gammavalue from="95" to="160"/>
         <gammavalue from="103" to="168"/>
         <gammavalue from="111" to="176"/>
         <gammavalue from="119" to="184"/>
         <gammavalue from="127" to="184"/>
         <gammavalue from="135" to="192"/>
         <gammavalue from="143" to="200"/>
         <gammavalue from="151" to="200"/>
         <gammavalue from="159" to="208"/>
         <gammavalue from="167" to="208"/>
         <gammavalue from="175" to="216"/>
         <gammavalue from="183" to="216"/>
         <gammavalue from="191" to="224"/>
         <gammavalue from="199" to="224"/>
         <gammavalue from="207" to="232"/>
         <gammavalue from="215" to="232"/>
         <gammavalue from="223" to="240"/>
         <gammavalue from="231" to="240"/>
         <gammavalue from="239" to="248"/>
         <gammavalue from="247" to="248"/>
         <gammavalue from="255" to="255"/>
      </gammalist>
   </output>

   <!--Mapping list for highlight color name to RGB value-->

   <highlightcolorlist>
      <!--red-->
      <!--<highlightcolor name="RED" foreground-rgb="#00FF0000" background-rgb="#00FFFFFF"/>-->
   </highlightcolorlist>
</mffiff>
