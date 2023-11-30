# DocBridge Impress Engine Examples

The contents of this directory demonstrate how to use DocBridge Impress. 
Code snippets that can be used as starting points or copied into other projects
are provided.

The _webdemo_ directory illustrates an output scenario only and does 
not contain all source files. 

## common
Files used by the demo files in the other directories, at the same time demonstrating 
how to modularize documents with xi:include (document file blocks, dfb) and CSS @import.

## css
CSS snippets demonstrating primarily the CSS features for print media

## dff
DFF documents demonstrating DFF features

## html
DFF/HTML documents demonstrating HTML features, primarily for print media
form fields are only supported for PDF output

## webdemo
Scenario that can be realized with DocBridge Impress.
How to use the webdemo:

1. Open the DE or EN version directory.
2. Open the index.html. It will open in your default web browser.
3. You can enter any login data (it is only a demo, no real funtionality). The German version opens to the employee area of Michaela Obermeier, and the English version to the employee area of John Doe. If you want, you can invent corresponding login data for these users.
4. Open any of the documents to demonstrate the specific document features. The documents were designed to display differently for at minimum three different screen sizes (small mobile, medium handheld, large desktop). You can demonstrate the responsive behavior by manually changing the size of the browser window or by using the device emulation of the respective browser.
5. There is a button/link on the web page to open the PDF document that was generated from the same source data.


