function stringIsEmpty(str){
  if(!str)
    return true
  
  for(i=0;i<str.length;i++){
    if(str[i] !== " ")
      return false;
  }
  return true;
}

// Heavily based on Daominic Watson's Work here: http://fusion.dominicwatson.co.uk/2013/01/client-side-site-search-for-jekyll.html

function generateRegexForInput( input ){
  var inputLetters = input.replace(/\W/, '').split('')
    , reg = {}, i;

  reg.expr = new RegExp('(' + inputLetters.join( ')(.*?)(' ) + ')', 'i');
  reg.replace = ""

  for( i=0; i < inputLetters.length; i++ ) {
    reg.replace += ( '<b>$' + (i*2+1) + '</b>' );
    if ( i + 1 < inputLetters.length ) {
      reg.replace += '$' + (i*2+2);
    }
  }

  return reg
}

function search(input){
  var reg = generateRegexForInput( input )
    , matches;

  // searchIndex is an array of posts and pages
  // in the form [{title:"some title",href="/the-page.html"},...]
  if(searchIndex.length <= 0){
    getSearchIndex();
  }
  matches = searchIndex.filter( function( item ) {
    if (item === false)
      return false;
    var titleLen = item.title.length
      , match, nextMatch, i, highlighted;

    // attempt a regex match for ever decreasing
    // substrings of the search term and keep the
    // narrow-most match
    for( i=0; i < titleLen; i++ ){
      nextMatch = item.title.substr(i).match( reg.expr );

      if ( !nextMatch ) {
        break;

      } else if ( !match || nextMatch[0].length < match[0].length ) {
        match = nextMatch;
        highlighted =
              item.title.substr(0,i)
            + item.title.substr(i).replace( reg.expr, reg.replace );
      }
    }

    // if we have match, decorate the result with a score
    // and highlighted title - then tell the filter() method
    // that we wish to keep this item (return true)
    if ( match ) {
      item.score       = match[0].length - input.length;
      item.highlighted = highlighted;

      return true;
    }
  });

  // sort results by score, using length of title as a tie-breaker
  return matches.sort( function( a, b ){
    return ( a.score - b.score ) || a.title.length - b.title.length;
  } );
}

function performSearch(input){
  $('#search-title').empty();
  $('#search-results').empty();
  if(stringIsEmpty(input)){
    $('#search-results').append('<h3><i>Enter something to search for...</i></h3>');
    return;
  }
  $('#search-title').append('<h2>Showing results for &ldquo;' + input + '&rdquo;:</h2>');
  matchedItems = search(input);
  for(i=0;i<matchedItems.length;i++){
    $('#search-results').append('<h3><a href="'+matchedItems[i].href+'">'+matchedItems[i].highlighted+'</a><small> ('+matchedItems[i].category+')</small></h3>');
  }
}