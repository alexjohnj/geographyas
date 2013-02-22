window.searchTimeout = null # Yucky global variable

$(document).ready ->
  $('#search-query').on 'keyup', (e) ->
    performSearch $(@).val()

performSearch = (query) ->
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
    postData = {}

    for term of data
      if $.inArray(term, @stemmedWords) isnt -1
        for id of data[term]
          if not postData[data[term][id]]
            postData[data[term][id]] = 1
          else
            postData[data[term[id]]]++

    sortable = []
    
    sortable.push [postID, postData[postID]] for postID of postData
    @posts = sortable.sort (a, b) -> b[1] - a[1]
    @getPosts()

  getPosts: =>
    # Remove duplicate posts
    unique_posts = []
    for post in @posts
      if post[0] is "undefined"
        continue
      unique_posts.push post if post not in unique_posts

    @posts = unique_posts

    if @posts.length > 0
      $.get "/search/posts/#{post[0]}.html", @renderResult for post in @posts
    else
      @renderResult '<p>No results found</p>'

  renderResult: (data) => 
    $('#search-results').append(data)

  search: => 
    @loadIndexes @getIndexURLs()
