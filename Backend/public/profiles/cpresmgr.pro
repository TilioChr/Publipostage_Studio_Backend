<?xml version="1.0" encoding="UTF-8"?>

<cpresmgr xmlns="http://www.compart.com/ns/mff/cpresmgr" version="201612">
   <!--
      **************************************************************************

      Copyright (C) Compart AG  2011

      Release: 201612

      **************************************************************************
-->

   <globals>
      <!--backup="true" means first create a backup of old xml file and then
                overwrite it with new format. note: The backup option is only useful when updating
                old xml file into new format. The rule will not apply with new format.
                enable="true|false" User can enable or disable font database-->

      <database name="font" filename="ftmgr.xml" backup="true" enable="true">
         <!-- option "scan" can be defined with different combination Possible scanning
                values are on-create : scan fonts during the resource manager creation
                on-missing-db: scan fonts when database file is missing on-query: scan fonts when
                font not found from given paths force-rescan: forcefully rescan paths ignore-db:
                ignore database file if exist monotype-fonts: scan monotype fonts default value is
                "on-missing-db" Similiarly user can perform different actions after the scaning
                Possible actions are "none" and "create" "none" means perform nothing "create" means
                create database after the scan "enable" and "disable" are only used with
                monotype-fonts. It control whether monotype font should be scanned At a moment
                "create" action is only used with on-missing-db, which means create xml database
                file if not exist. values : default actions on-missing-db create on-create none
                force-rescan none on-query, none ignore-db none monotype-fonts disable
            -->

         <option name="scan" value="on-missing-db" action="create"/>
         <option name="scan" value="monotype-fonts" action="disable"/>

         <!-- The Resource Search order can be changed on based user requirement The
                default search order is volatile, user, adobe, system User can change this order
                according to his requirement the alternate name of element <scan> is
                <searchorder>. Both have same affect -->

         <scan>
            <path name="volatile" matchmode="exact"/>
            <path name="user" matchmode="exact"/>
            <path name="adobe" matchmode="exact"/>
            <path name="system" matchmode="standard"/>
            <path name="monotypefonts" matchmode="exact"/>
         </scan>

         <!-- Resource manager contains a default list of font substitution. If user
                want to add a new entry or want to change existing pair then just add that entry in
                the list. In <substitution-pair> element, the value of attribute
                "original-font" is used as a regular expression for searching. So when defining a
                new pair just varify that regular expression is defined in proper way.
            -->

         <font-substitutions>
            <substitution-pair original-font="^Arial$" substitute-font="Helvetica"/>
            <substitution-pair original-font="^Arial Bold$" substitute-font="Helvetica-Bold"/>
            <substitution-pair original-font="^Arial Italic$" substitute-font="Helvetica-Oblique"/>
            <substitution-pair original-font="^Arial Bold Italic$" substitute-font="Helvetica-BoldOblique"/>
            <substitution-pair original-font="^Times Roman$" substitute-font="Times-Roman"/>
            <substitution-pair original-font="^Times Roman Bold$" substitute-font="Times-Bold"/>
            <substitution-pair original-font="^Times Roman Italic$" substitute-font="Times-Italic"/>
            <substitution-pair original-font="^Times Roman Bold Italic$" substitute-font="Times-BoldItalic"/>
            <substitution-pair original-font="^Courier Bold$" substitute-font="Courier-Bold"/>
            <substitution-pair original-font="^Courier Italic$" substitute-font="Courier-Oblique"/>
            <substitution-pair original-font="^Courier Bold Italic$" substitute-font="Courier-BoldOblique"/>
         </font-substitutions>
      </database>
   </globals>

   <!-- type can be "TrueType", "Type1Font", if it is not defined, the path will
                be used for all types Extension can be emtpy, extension or wildcard -->

   <resourcelist>
      <fileslist>
         <!--<files path="." type="TrueType" extension="ttf"/>-->
         <!--<files path="." type="Type1Font" extension="pfb"/>-->
		 <files path="c:/windows/fonts"  type="TrueType" extension="ttf"/>
         
         <files path="resource/font" type="Type1Font" extension="pfb"/>
	<files path="C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\resources\pfb" type="type1Font" extension="pfb"/>
      </fileslist>
   </resourcelist>
</cpresmgr>
