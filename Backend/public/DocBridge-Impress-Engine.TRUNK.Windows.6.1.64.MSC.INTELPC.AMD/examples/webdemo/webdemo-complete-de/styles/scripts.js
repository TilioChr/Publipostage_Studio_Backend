    var accordionItems = new Array();

    function init() {

      // Grab the accordion items from the page
      var divs = document.getElementsByTagName( 'section' );
      for ( var i = 0; i < divs.length; i++ ) {
        if ( divs[i].className == 'accordion noprint' ) accordionItems.push( divs[i] );
      }

      // Assign onclick events to the accordion item headings
      for ( var i = 0; i < accordionItems.length; i++ ) {
        var div = getFirstChildWithTagName( accordionItems[i], 'DIV' );
        div.onclick = toggleItem;
      }

      // Hide all accordion item bodies except the first
      for ( var i = 1; i < accordionItems.length; i++ ) {
        accordionItems[i].className = 'accordion hide noprint';
      }
    }

    function toggleItem() {
      var itemClass = this.parentNode.className;

      // Hide all items
      for ( var i = 0; i < accordionItems.length; i++ ) {
        accordionItems[i].className = 'accordion hide noprint';
      }

      // Show this item if it was previously hidden
      if ( itemClass == 'accordion hide noprint' ) {
        this.parentNode.className = 'accordion';
      }
    }

    function getFirstChildWithTagName( element, tagName ) {
      for ( var i = 0; i < element.childNodes.length; i++ ) {
        if ( element.childNodes[i].nodeName == tagName ) return element.childNodes[i];
      }
    }
    
    

