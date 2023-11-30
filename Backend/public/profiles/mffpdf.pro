<?xml version="1.0" encoding="UTF-8"?>

<mffpdf xmlns="http://www.compart.com/ns/mff/pdf" version="202104">
   <!--
      **************************************************************************

      Copyright (C) Compart AG  2011

      Release: 202104

      **************************************************************************
-->
   <!--Security settings. If enabled, they will be applied to output
                documents. For input, the password specified as user-password will be tried to open
                password-protected documents. The attribute "algorithm" indicates the encryption
                algorithm used for output. Valid values are "rc4" and "aes".-->

   <security enable="false" user-password="" owner-password="secret" keylength="40" algorithm="rc4" print="true" change="true" extract="true" textnotes-change="true" fill-fields="true" accessibility-extraction="true" assemble="true" digital-copy="true"/>

   <!--Font list. Its attributes apply to fonts which are not
                explicitly included in the profile or which do not specify a value for the
                respective attribute. Otherwise, specific font attribute values take precedence over
                font list attribute values. 
                "overrideembeddedfont" - (only in input) - allows to
                replace an embedded font with an external font. Permits font optimization. There is
                a high risk that font encodings will not match. Use with caution. 
                "hinting" - (only in input) - If this attribute is not enabled, hints in the input 
                files are not evaluated. Some Type 1 fonts are rendered better without hinting. 
                "subsetting" - (only in output) - specifies, whether subsets of the embedded fonts 
                should be specified in the output files. Font subsets can be specified for Type 1 
                and TrueType fonts. 
                "glyphsuffixasunicode" - (input) - for badly encoded fonts read the numeric
                suffixes of the glyphnames as unicode (true). This is a very particular setting,
                which is applicable only to a small group of documents. Use it only if advised and
                check carefully, whether the resulting unicode meets your
                expectations.-->

   <fontlist overrideembeddedfont="false" hinting="true" subsetting="true" glyphsuffixasunicode="false">
      <!--The font element is used to specify how the fonts in the
                processed input and output files should be handled. A font specification using the
                attributes "family", "width" and "style" can be replaced by either a reference to a
                Type1 or a TrueType font (-> "reftype") or an embedded Type1, Type3 or TrueType
                font. The font "family" is the name provided by the input driver; (e.g. MFFAFP), the
                value of "width" can be ULTRACONDENSED, EXTRACONDENSED, CONDENSED, SEMICONDENSED,
                NORMAL, SEMIEXPANDED, EXPANDED, EXTRAEXPANDED or ULTRAEXPANDED; the font "style" can
                be UPRIGHT or ITALIC. To embed a Type1 or TrueType font, embed="always" has to be
                specified. To embed a Type3 font, rasterize="TYPE3" has to be specified. To
                rasterize the text, rasterize="ALWAYS" has to be specified. For fonts that are only
                referenced in the output files, a specification of the reftype is required.
            -->

      <font family="CORPORATE" Serifstyle="SansSerif" spacing="Proportional" reftype="TrueType">
         <!--<face devname="Courier" weight="SemiLight" width="Normal" style="Upright"
               fontfile="CORPR___"
               fontfiletype="TrueType"
               embed="Always"
               overrideembeddedfont="false"
               hinting="true"/>-->
         <!--<face weight="Medium" width="Normal" style="Upright" fontfile="Hel_wb"
               fontfiletype="Type1"
               embed="Always"/>-->
      </font>
	  
     <font family="Arial" reftype="TrueType" spacing="Proportional">
       <face weight="Medium" style="Upright" fontfile="arial"   fontfiletype="TrueType" embed="always"/>
       <face weight="Bold"   style="Upright" fontfile="arialbd" fontfiletype="TrueType" embed="always"/>
       <face weight="Medium" style="Italic"  fontfile="ariali"  fontfiletype="TrueType" embed="always"/>
       <face weight="Bold"   style="Italic"  fontfile="arialbi" fontfiletype="TrueType" embed="always"/>
     </font>
     
     <font family="Polo" reftype="truetype">
       <face weight="medium" style="upright" fontfile="polo"   fontfiletype="truetype" embed="always"/>
       <face weight="bold"   style="upright" fontfile="polob"  fontfiletype="truetype" embed="always"/>
       <face weight="medium" style="italic"  fontfile="poloi"  fontfiletype="truetype" embed="always"/>
       <face weight="bold"   style="italic"  fontfile="polobi" fontfiletype="truetype" embed="always"/>
     </font>
     
	 <font family="Source Sans Pro" reftype="truetype">
      <face weight="medium" style="upright" fontfile="SourceSansPro-light"   fontfiletype="truetype" embed="always"/>
      <face weight="bold"   style="upright" fontfile="SourceSansPro-Bold.otf"  fontfiletype="truetype" embed="always"/>
      <face weight="medium" style="italic"  fontfile="poloi"  fontfiletype="truetype"/>
      <face weight="bold"   style="italic"  fontfile="polobi" fontfiletype="truetype"/>
    </font>
	
	<font family="impact" reftype="truetype">
      <face weight="medium" style="upright" fontfile="impact"   fontfiletype="truetype" embed="always"/>
      <face weight="bold"   style="upright" fontfile="SourceSansPro-Bold.otf"  fontfiletype="truetype" embed="always"/>
      <face weight="medium" style="italic"  fontfile="poloi"  fontfiletype="truetype"/>
      <face weight="bold"   style="italic"  fontfile="polobi" fontfiletype="truetype"/>
    </font>
	<font family="Helvetica" reftype="truetype">
      <face weight="medium" style="upright" fontfile="Helvetica"   fontfiletype="truetype" embed="always"/>
      <face weight="bold"   style="upright" fontfile="Helvetica-Bold"  fontfiletype="truetype" embed="always"/>
      
    </font>
	
	
	

  
   </fontlist>

   <!--If set to true, the occurrences of the PDF XForms which are
                not scaled, rotated or skewed (i.e. XForms having translation-only CTMs( will be
                read as overlays-->

   <overlayasreference value="false"/>

   <!--iccprofiles. Indicates, whether embedded ICC profiles should
                be read (read="true") or not (read="false"). For output, "write" control if
                ICC-profiles, embedded or configured in the input will be written or not in the output.
                If "true" is specified for "write" in a conversion to PDF/A, then the items having an
                ICC-profile will not be converted to the ICC of the output intent. For a "false" value
                of "write", the normal color conversion to the output intent colorspace take place.
            -->

   <iccprofiles read="false" write="false"/>

   <!--Settings for input.-->

   <input>
      <!--The text element is used to determine whether the stroke
                commands (instructions regarding the text outline) are to be implemented or not
                during rendering. In some cases the results of FreeType stroke rendering are not
                satisfactory. Set ignorestroke="true" to ignore text stroking.-->

      <text ignorestroke="false"/>

      <!--Global annotations treatment. Attributes: "read" - specifies
                whether annotations are read (TRUE) or not (FALSE). The default value is TRUE;
                "generate" - specifies whether annotations are replaced by the objects they
                represent (FALSE) or whether annotation-items are generated (TRUE). The default
                value is FALSE to ensure backward compatibility, since this setting suits most of
                the customers (as of august 2005). "generatepopups": Specifies if popups are to be
                printed (TRUE) or not (FALSE). Not required for PDF to PDF conversion. The default
                value is FALSE. "printall": An easier way to set "forceprinting" to TRUE for all
                annotation types (overrides the PDF noprinting flag if this is set to
                TRUE).-->

      <annotations read="true" generate="false" generatepopups="false" generatefields="false" printall="false" generatearchivefields="true">
         <!--Individual annotation treatment. Attributes: "type": Specifies
                the type of annotation. No default value. "read": Read (TRUE) or ignore (FALSE) any
                annotation of this type. The default value is TRUE. "forceprinting": Print
                annotation despite the "noprinting" flag in PDF. The default value is
                FALSE.-->

         <annotation type="Text" read="true" forceprinting="false"/>
         <annotation type="FreeText" read="true" forceprinting="false"/>
         <annotation type="Stamp" read="true" forceprinting="false"/>
         <annotation type="Line" read="true" forceprinting="false"/>
         <annotation type="Square" read="true" forceprinting="false"/>
         <annotation type="Circle" read="true" forceprinting="false"/>
         <annotation type="StrikeOut" read="true" forceprinting="false"/>
         <annotation type="HighLight" read="true" forceprinting="false"/>
         <annotation type="UnderLine" read="true" forceprinting="false"/>
         <annotation type="Ink" read="true" forceprinting="false"/>
         <annotation type="Sound" read="true" forceprinting="false"/>
         <annotation type="File" read="true" forceprinting="false"/>
         <annotation type="Widget" read="true" forceprinting="false"/>
         <annotation type="Polygon" read="true" forceprinting="false"/>
      </annotations>

      <!--Specifies whether pages of the input document are rendered
                while being read. By reducing the memory consumption, especially for large
                documents, this setting can increase processing speed considerably. Attributes:
                "value": Specifies whether the page content is rendered ("true") or not ("false").
                "conditional": Controls whether rendering is carried out globally ("false") or only
                for specific page objects ("true"). "imagetype": Specifies the image formats used
                for rendering. Valid values are RGB and CMYK. "resolution": Specifies the resolution
                used for rendering.-->

      <render-page value="false" conditional="true" imagetype="Rgb" resolution="300">
         <!--Specifies certain page objects if the rendering is to be
                carried out conditionally based on the object type. Set the value of the attribute
                "render-page" to "true" and uncomment the corresponding item to trigger the page
                rendering. If the page rendering is to be carried out independently of the type, set
                the "render-page" value to TRUE and "conditional" to FALSE. Attribute: "type":
                Specifies the page object to be rendered.-->
         <!--<trigger-item type="Path"/>-->
         <!--<trigger-item type="Image"/>-->
         <!--<trigger-item type="Rect"/>-->
         <!--<trigger-item type="Line"/>-->
         <!--<trigger-item type="Text"/>-->
      </render-page>

      <!--Controls text clipping settings for output filters. The
                attribute "value" specifies the clipping method to be used. Valid values are:
                "default" - currently identical to "cliptopage"; "cliptopage" - sets the clipping
                path and cuts text at the page margins; "cut-clipped-text" - sets the clipping path
                and cuts text without regarding the page margins; "clipping-paths" - only sets the
                clipping path. Note that only a few output filters support clipping paths. When
                using filters that do not support clipping paths, a proper processing cannot be
                guaranteed when text clipping is activated. The setting is recommended only for text
                capturing, if the intention is to capture clipped text as well.-->

      <textclipping value="Default"/>
   </input>

   <!--Settings for output.-->

   <output>
      <!--Specifies the PDF output format. Attributes: "value":
                Specifies the PDF version that is to be created as output. The versions 1.3, 1.4,
                1.5, 1.6, 1.7, PDF/A-1, PDF/A-2, PDF/A-3, PDF/UA or combination of them are
                supported. "level": With PDF/A-1 as output format, you can specify here whether the
                created PDF files conform to PDF/A-1a (a) or PDF/A-1b (b). This setting is ignored
                if the version is any other than PDF/A, PDF/A-1, PDF/A-2 or PDF/A-3. For PDF/A-2 and PDF/A-3,
                in addition to 'a' and 'b', level 'u' may be specified to generate PDF/A-2u and PDF/A-3u.
                "strict": With PDF/A-1, PDF/A-2, PDF/A-3 or PDF/UA as output format, you can specify here whether
                the created files strictly conform to the standard. By setting strict="false" the
                process is not cancelled even if the output file does not comply to all PDF/A or
                PDF/UA requirements. By setting strict="true" however, the process is cancelled if
                no proper PDF/A or PDF/UA output file can be created. The setting is ignored if the
                version is any other than PDF/A and PDF/UA.
                "ignore": allows to ignore PDF/A restrictions, also when 'strict' is set to 'true'.
                The only supported values in present are the empty string and "2GB" (case sensitive).
                "removealpha": Specifies how e.g. alpha
                transparencies are rendered in PDF versions lower than 1.4 and PDF/A. The currently
                implemented rendering methods for remove-alpha are: SELECTIVE - the alpha
                transparency is removed from the concerned areas; RENDERPAGE - removes alpha
                transparency from the whole page while the text remains searchable; AUTO - the
                filter itself decides how alpha transparency is handled. This is the default and
                recommended setting.-->

      <version value="1.3" level="b" strict="false" ignore="" removealpha="Auto"/>

      <!--Specifies the compression level for the ZIP compression.
                Attributes: "level": Specifies the level of compression. Valid values range from 0
                (fastest, no compression) to 9 (highest compression); "purpose": Specifies the
                object to be ZIP-compressed. Currently this setting is ingored. The default value is
                IMAGE.-->

      <zipcompression level="default" purpose="Image"/>

      <!--Autotagging settings. The element specifies whether a semantic
                structure is automatically generated and written into the PDF (tagged PDF).
                Attributes: "value": Specifies whether a semantic structure is created (TRUE) or not
                (FALSE); "language": Specifies the document language of the created PDF document.
                Valid values are two-digit ISO 639 language codes (e.g. lang="en" and combinations
                of the ISO 639 codes and the two-digit ISO 3166 country codes (e.g.
                lang="en-US".-->

      <autotagging value="false" language="de-DE"/>

      <!--OutputIntent. Attributes: "name": The value of "name" must be
                exactly one of the following: For RGB: "Adobe RGB (1998)" "Apple RGB" "ColorMatch
                RGB" "sRGB IEC61966-2.1" For CMYK: "Europe ISO Coated FOGRA27" "Euroscale Uncoated
                v2" "Japan Color 2001 Coated" "Japan Color 2001 Uncoated" "Japan Color 2002
                Newspaper" "Japan Web Coated (Ad)" "U.S. Sheetfed Coated v2" "U.S. Sheetfed Uncoated
                v2" "U.S. Web Coated (SWOP) v2" "U.S. Web Uncoated v2" If more than one
                outputintents are given only the first one is used while the rest are ignored.
                "filename": If present, it will override the value specified in name. It should be
                the file name of a valid, PDF/A conform ICC profile.-->

      <outputintent name="Adobe RGB (1998)" filename="" embed="Auto"/>

      <!--Viewer. Attributes: "pagemode": Specifies whether the document
                is to be initially opened offering attachments display ("ATTACHMENTS"), thumbnail navigation ("THUMBS"), bookmark
                navigation ("OUTLINES") or in full screen mode ("FULLSCREEN"). The default value is
                "NONE". Whether this setting is used depends on the respective PDF reader.
                "autoprint": This flag specifies the conforming reader to automatically display a
                print dialog when the document is opened. "hidetoolbar": This flag specifies whether
                to hide the conforming reader's tool bars when the document is active. The default
                value is "false". "hidemenubar": This flag specifies whether to hide the conforming
                reader's menu bar when the document is active. The default value is "false".
                "hidewindowui": This flag specifies whether to hide user interface elements in the
                document's window (such as scroll bars and navigation controls), leaving only the
                documents's contents displayed. The default valie is "false". "fitwindow: This flag
                specifies whether to resize the document's window to fit the size of the first
                displayed page. The default value is "false". "centerwindow": This flag specifies
                whehter to position the document's window in the center of the screen. The default
                value is "false". "displaydoctitle": This flag specifies whether the window's title
                bar should display the document title taken form the Title entry of the document
                information dictionary. If "false", the title bar should instead display the name of
                the PDF file containing the document. The default value is "false". "printscaling":
                Specifies which option will be selected automatically whwn the Print dialog will be
                displayed. Possible values are "APPDEFAULT" and "NONE". -->

      <viewer pagemode="None" autoprint="false" hidetoolbar="false" hidemenubar="false" hidewindowui="false" fitwindow="false" centerwindow="false" displaydoctitle="false" printscaling="AppDefault"/>

      <!--Specification of the Type3 font resolution in dpi. The default
                value is 300dpi. For output bitmap TYPE3 fonts use the value 0; For for input vector
                fonts use the default setting 300 dpi; Otherwise, use the font resolution of the
                input bitmap or the "independent fontresolution".-->

      <fontresolution value="0"/>

      <!--The element "replacepattern" is used to specify how rectangles
                with fill patterns are to be replaced by the corresponding gray values. The
                replacement reduces the file size and increases the writing speed. Attributes:
                "value": Specifies whether the fill pattern is to be replaced by a corresponding
                gray value ("true") or not ("false"). "movetobegin" Specifies, whether the patterns
                are replaced by gray and moved in front of the items ("true"). This may prevent some
                overlap problems. However, this setting does not guarantee a correct output, no
                matter which value is chosen for "movetobegin".-->

      <replacepattern value="false" movetobegin="true"/>

      <!--The attribute "standard" of element "formfields" specifies 
                whether the PDF reader should construct appearences for form fields (TRUE) 
                or not (FALSE). This corresponds directly to the adding "NeedAppearances" entry 
                to the output. "NeedAppearences" is depreciated in version 2.0 of the 
                PDF specification.-->

      <formfields standard="false"/>

      <!--The element "noimagemasks" can be used to specify whether
                image masks are to interpreted as normal images (TRUE) or not (FALSE). This may be
                necessary to achieve compatibility with older printer drivers.-->

      <noimagemasks value="false"/>

      <imagecompressions>
         <!--Controls the image compression type. Invalid settings are ignored. Multiple
                "imagecompression" elements are allowed (basically one for every possible
                (bitsperpixel, colorformat) pairing. Valid values for bits per pixel: "1", "2", "4",
                "8", "24", "32" Valid values for colorformat: GRAYSCALE, PALETTE, RGB, CMYK
                Monochrome equals 1 bit per pixel grayscale. Valid values for compression are:
                DEFAULT, FAXG4, JPEG, ZIP. Incompatible or not supported compressions are ignored.
                The attribute "binarycopy" specifies whether whether the images from the input
                document are to be copied (TRUE) or whether they are first decompressed and then
                compressed anew (FALSE). Binary copy is faster but the image is not validated. This
                may produce useless PDFs, at least when used with some PDF readers. If PDF/A is set
                as target format, binary-copy is disabled, regardless the setting for this
                attribute. The compression used for pattern images can be specified with the 
                "pattern-compression" attribute, valid values are : DEFAULT, FAXG4, JPEG, ZIP.-->

         <imagecompression bitsperpixel="1" colorformat="GrayScale" compression="Default" binarycopy="false" pattern-compression="Default"/>
         <imagecompression bitsperpixel="8" colorformat="GrayScale" compression="Default" binarycopy="false"/>
         <imagecompression bitsperpixel="24" colorformat="Rgb" compression="Default" binarycopy="false"/>
      </imagecompressions>

      <!--Specifies the quality of written JPEG images as percentage. Valid values
                range from 0 to 100%. The default setting is 75%.-->

      <jpegquality value="75"/>

      <!--Specifies how fonts are handled for the creation of output documents. Valid
                values of the attribute "default" are: 
                * AUTO, - Automatic selection of one of the following settings with respect to conversion 
                exactness and restrictions concerning the font availability. 
                * RASTERIZE, - maintains original text aspect, but text is replaced with images. No 
                alignment problems or missing characters but filesize is bigger and text not searcheable. 
                Adobe-documented compatibilty problems with some HP-printers Use "ignoreimagemasks" to 
                avoid them (text background loses transparency) Used automatically when missing characters 
                are detected in the selected font and raster information is available.
                * CONVERTTOTYPE3, - generate Type3 raster with the same appearence and characters as original 
                font. Makes text searcheable. Filesize generally smaller than with RASTERIZE No alignment 
                problems or missing characters. Adobe-documented compatibilty problems with some HP-printers 
                "ignoreimagemasks" solution does not function in this case (Acrobat does not accept 
                non-transparent type3 glyphs). Never chosen automatically.
                * USESTANDARDFONTS - uses only the 14 Type1 Adobe standard fonts. Smallest file size. May 
                result in text alignment problems and/or missing characters (if no raster information is 
                present in input). No compatibility problems. Chosen automatically only if the input file 
                font does not contain font-metric information.
                * USEBESTMATCHINGFONTS - force Acrobat to use MultipleMaster fonts with exactly the same metrics 
                as the original font -> This may prevent text alignment problems, but problems due to lacking 
                characters may remain. Deactivate the embedding of original fonts to reduce the file size of the
                PDF output file. Adobe-documented compatibilty problems with some HP-printers. No workaround, 
                except for disabling it. Chosen automatically if original font (in compatible format) is not 
                available and input font metrics are known.
                * USEORIGINALFONTS - Use the original font data (when it is TrueType or Type1) from input file 
                and embed it. No alignment or missing characters problems. No compatibility problems. Preferred 
                over other settings in AUTO-mode. No really need to explicitly specify it, present for sake of 
                completeness.
                "split-optimization": Specifies whether Type3 fonts are created
                only once to produce several output documents ("true") or not ("false"). This may
                increase speed when several output documents are created from one input.
                "autotype3": If set to "true", all fonts that are not TrueType or Type1 fonts and
                can be rasterized are converted to Type3 fonts provided that "default" is set to
                AUTO or USEORIGINALFONTS. If "default" is set to CONVERTTOTYPE3 and "autotype3" is
                set to "true", than Type1 or TrueType fonts from input will NOT be converted to
                TYPE3, but used as original instead. It will not affect RASTERIZE, USESTANDARDFONTS
                or USEBESTMATCHINGFONTS. "intensify": whereby they appear slightly bolder. If set to
                true, texts with Type3 fonts are rendered using the setting "fillandstroke". This
                will make the text to look minimal bolder. Use this setting to display text darker
                even at lower resolutions, e.g. in full page mode. This setting is used to achieve a
                better display in certain versions of Adobe Acrobat 9.x. It can lead to unexpected
                effects in other versions or when other readers are used.-->
      <!--Attribute: mapBoundedFont @comment:  By default bounded font can be mapped in fontlist. This attribute is used
                to activate or deactivate the mapping of bounded font. -->

      <fonthandling default="auto" split-optimization="false" autotype3="true" intensify="false" mapBoundedFont="true"/>

      <!--Specification whether archive fields (AFP: TLEs or index values) or PDF
                comments (ANNOTATIONS) are to be written. Valid values are NOT, ANNOTATIONS,
                PIECEINFO.-->

      <writearchivefields value="Not" invisible="false" application="Compart"/>

      <!--Stamp as watermark. Values: false, true is deprecated. Please use the
                application to control this setting.-->

      <stampaswatermark value="false"/>

      <!--Specifies whether a time stamp is to be written into the output ("true") or
                not ('false'). The default value is "true".-->

      <writetimestamp value="true"/>

      <!--The value 'true' means if the simplex duplex data will be written as it is in the input. 
        If it 'false' the simplex duplex data will not be written. Default is 'true'.-->

      <writesimplexduplexpdf value="true"/>
   </output>

   <resourcelist>
      <fileslist>
         <!--Several directories can be specified for the search for external resources.
                The "path" is mandatory. "Type", "extension" and "resolution" are optional. However,
                the more detailed the settings are, the more specific the search will be. Valid
                values for "type" are: "overlay", "pageSegment", "codedFont", "codePage", "charSet",
                "formDef", "resourceLib", "pageDef", "object", "icc", "documentIndex". If the type
                is not defined, the path will be used for all types. The "extension" can be emtpy,
                <extension> or a wildcard. If the "resolution" is not specified, resources
                with any resolution will be searched in the path. -->

         
         <files path="C:\xampp\htdocs\DREAMPRESS\DocBridge-Impress-Engine.TRUNK.Windows.6.1.64.MSC.INTELPC.AMD\pfb" type="Type1Font" extension="pfb"/>
        
        
         <files path="c:\WINDOWS\Fonts" type="TrueType" extension="ttf"/>
        
         <files path="C:\xampp\htdocs\DREAMPRESS\DocBridge-Impress-Engine.TRUNK.Windows.6.1.64.MSC.INTELPC.AMD\pfb" type="ICC" extension="icc"/>
        
         <files path=".\Adobe ICC Profiles\RGB Profiles" type="ICC" extension="icm"/>
      </fileslist>
   </resourcelist>
</mffpdf>
