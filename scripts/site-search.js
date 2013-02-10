String.prototype.capitalize = function() {
    var pieces = this.split(" ");
    for ( var i = 0; i < pieces.length; i++ )
    {
        var j = pieces[i].charAt(0).toUpperCase();
        pieces[i] = j + pieces[i].substr(1);
    }
    return pieces.join(" ");
}

Array.prototype.unique = function() {
  var tmpArray = [];
  var arrayLength = this.length;
  for(var i = 0; i < arrayLength; i++){
    var tmpArrayLength = tmpArray.length;
    var tmpArrayContainsItem = false;
    for(var j = 0; j < tmpArrayLength; j++){
      if(tmpArray[j] === this[i])
        tmpArrayContainsItem = true;
    }
    if(tmpArrayContainsItem === false)
      tmpArray.push(this[i]);
  }
  return tmpArray;
}

function stringIsEmpty(str){
  "use strict";

  if(!str){
    return true;
  }

  for(var i=0; i<str.length; i++){
    if(str[i] !== " "){
      return false;
    }
  }
  return true;
}

// This function is based Dominic Watson's work here: http://fusion.dominicwatson.co.uk/2013/01/client-side-site-search-for-jekyll.html
// I have modified it quite a bit from the original though. 
function generateRegexForInput(input){
  "use strict";

  var inputLetters = input.split(''); // Make an array out of the input string

  for(var j=0; j<inputLetters.length; j++){
    if(/\W/.test(inputLetters[j])){ // check to see if an element of the array is a non word character (i.e. !, £, $, . etc.)
      inputLetters[j] = '\\' + inputLetters[j]; // If it is, escape it so it doesn't mess up the regular expression.
    }
  }

  var reg = {};
  reg.expr = new RegExp('(' + inputLetters.join( ')(.*?)(' ) + ')', 'i');
  reg.replace = "";

  for(var i=0; i < inputLetters.length; i++ ) {
    reg.replace += ( '<b>$' + (i*2+1) + '</b>' );
    if ( i + 1 < inputLetters.length ) {
      reg.replace += '$' + (i*2+2);
    }
  }
  return reg;
}

// Again, this function is based Dominic Watson's work here: http://fusion.dominicwatson.co.uk/2013/01/client-side-site-search-for-jekyll.html
// Again, it's been modified. Notably, this will search in arrays other than the one called "searchIndex" and will also search for keys other than the title.

function searchForKey(searchTerm, key, items){
  var reg = generateRegexForInput(searchTerm);

  var matches = items.filter(function(item){
    if(item === false)
      return false;
    var keyValueLength = item[key].length;
    var match, nextMatch, highlighted;

    for(var i = 0; i < keyValueLength; i++){
      nextMatch = item[key].substr(i).match(reg.expr);
      if(!nextMatch){
        break;
      }
      else if(!match || nextMatch[0].length < match[0].length){
        match = nextMatch;
        highlighted = item[key].substr(0, i) + item.title.substr(i).replace(reg.expr, reg.replace);
      }
    }

    if(match){
      item.score = match[0].length - searchTerm.length;
      item.highlighted = highlighted;

      return true;
    }
  });

  return matches.sort(function(a, b){
    return (a.score - b.score) || a[key].length - b[key].length;
  });
}

function performSearch(input){
  "use strict";

  $('#search-results').empty();

  if(stringIsEmpty(input)){
    $('#search-results').append('<h3><i>Enter something to search for...</i></h3>');
    return;
  }

  var matchedTitleItems = searchForKey(input, "title", searchIndex);
  var matchedCategoryItems = searchForKey(input, "category", searchIndex);
  var matchedItems = matchedTitleItems.concat(matchedCategoryItems);

  matchedItems = matchedItems.sort(function(a,b){
    return (a.score - b.score);
  }).unique();

  var posts = {};
  for(var i=0; i<matchedItems.length; i++){
    if(matchedItems[i].category in posts == false){
      posts[matchedItems[i].category] = [matchedItems[i]];
    }
    else{
      posts[matchedItems[i].category].push(matchedItems[i]);
    }
  }

  if(matchedItems.length != 1){
    $('#search-results').append('<h3><i>' + matchedItems.length + ' results found for &ldquo;' + input + '&rdquo;</i></h3>');
  } 
  else{
    $('#search-results').append('<h3><i>' + matchedItems.length + ' result found for &ldquo;' + input + '&rdquo;</i></h3>');
  }

  for(var key in posts){
    $('#search-results').append('<h2>' + key.replace(/\W/, ' ').capitalize() + '</h2>');
    for(var j = 0; j < posts[key].length; j++){
      $('#search-results').append('<h3><a href="'+posts[key][j].href+'">'+posts[key][j].title+'</a></h3>');
    }
  }
}