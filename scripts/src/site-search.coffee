window.searchTimeout = null # Yucky global variable

$(document).ready ->
  query = new RegExp('[\\?&]' + 'query' + '=([^&#]*)').exec window.location.href

  if query isnt null
    performSearch decodeURIComponent(query[1].replace(/[+]/gi, ' '))

  $('#search-query').on 'keyup', (e) ->
    performSearch $(@).val()

window.performSearch = (query) ->
  $('#search-results').empty()
  if query.isEmpty() is true
    $('#search-results').append 'Enter something to search for'
    return
  result = new SearchResult query
  result.search()

String::isEmpty = ->
  return true if @.replace(/\s/g, '') is ''
  return false

class SearchResult

  constructor: (@searchTerm) -> 
    @stemmedWords = @parseWords searchTerm

  parseWords: (query) =>
    words = query.toLowerCase().match /\w{2,}/gi
    sWords = []
    sWords.push(stemmer(word)) for word in words when word not in sWords
    return sWords

  getIndexURLs: =>
    indexURLs = {}

    for word in @stemmedWords
      temp = "/search/terms/#{word[0..1].toLowerCase()}.json"
      indexURLs[temp] = null

    return indexURLs

  loadIndexes: (indexURLs) =>
    $.getJSON file, @getPostIDs for file of indexURLs

  getPostIDs: (data) =>
    # JSON comes back in this sort of format: {'stemmed_term':[1, 2, 2, 2, 2, 2,], 'stemmed_term_2':[2, 3,3,3,3]}
    # The numbers indicate a match on a certain page (1.html, 2.html etc.). The more times the number appears, the more matches on that page.

    postData = {}

    for term of data
      if $.inArray(term, @stemmedWords) isnt -1 # Iterate through each term in the JSON file, ignoring the ones that don't match our search term. 
        for id in data[term] # Now go through each ID in the term's array giving creating a key-value pair in postData
          if typeof postData[id] is 'undefined' # The KVP is the ID of the post and its score 
            postData[id] = 1 # i.e. the number of times the search term occurs on the page. 
          else
            postData[id]++

    sortable = []
    sortable.push [postID, postData[postID]] for postID of postData
    @posts = sortable.sort (a, b) -> b[1] - a[1]
    @getPosts()

  getPosts: =>
    if @posts.length > 0
      $.get "/search/posts/#{post[0]}.html", @renderResult for post in @posts
    else
      @renderResult '<p>No results found</p>'

  renderResult: (data) => 
    $('#search-results').append(data)

  search: => 
    @loadIndexes @getIndexURLs()
