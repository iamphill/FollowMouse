class @FollowMouse
  # Public: Constructor method
  #         Called when plugin is init'd
  #
  # el - Element or selector for the element
  constructor: (@el) ->
    # Is @el already an element or do we need to create an el?
    if typeof @el is "string"
      # We need to create elements
      for el in document.querySelectorAll(@el)
        # Create new follow mouse
        f = new FollowMouse el

      return false

    # Check to ensure it is actually an object
    if typeof @el is "object"
      # Get parent node
      @parentNode = @el.parentNode

      # Add some CSS to the parent node
      @parentNode.style.position = "relative"

      # Get middle coords of the parentNode
      @parentMiddle =
        x: (@parentNode.offsetWidth / 2) + (@elementOffset(@parentNode, "offsetLeft"))
        y: (@parentNode.offsetHeight / 2) + (@elementOffset(@parentNode, "offsetTop"))

      # Initial position of el
      @_positionInMiddle()

      # Add some event listeners
      @_eventListeners()

  # Private: Position element in the middle of the parent
  _positionInMiddle: ->
    @addCss @el,
      position: "absolute"
      top: "50%"
      marginTop: "-#{(@el.offsetHeight / 2)}px"
      left: "50%"
      marginLeft: "-#{(@el.offsetWidth / 2)}px"

  # Private: Add event listeners
  _eventListeners: ->
    document.addEventListener "mousemove", @_mouseMove

  # Private: Mouse over event callback
  #
  # e - Event data object
  _mouseMove: (e) =>
    x = e.clientX
    y = e.clientY

    # Work how far from the center the mouse is
    newX = 0 - (@parentMiddle.x - x) / (@el.offsetWidth / 2)
    newY = 0 - (@parentMiddle.y - y) / (@el.offsetHeight / 2)

    css =
      WebkitTransform: "translate3d(#{newX}px, #{newY}px, 0px)"
      MozTransform: "translate3d(#{newX}px, #{newY}px, 0px)"
      OTransform: "translate3d(#{newX}px, #{newY}px, 0px)"
      msTransform: "translate(#{newX}px, #{newY}px)"
      transform: "translate3d(#{newX}px, #{newY}px, 0px)"

    # Add the CSS
    @addCss @el, css

  # Internal: Get the offset of an element with the document
  #
  # el - Element to get offset for
  # type - Offset type (offsetLeft or offsetTop)
  #
  # Returns the offset value as a float
  elementOffset: (e, type) ->
    offset = 0

    while (e)
      offset += e[type]

      e = e.offsetParent

    return offset

  # Internal: Add CSS an element
  #           Takes an object with the key as the CSS property
  #
  # el - Element to add to
  # css - Object with the CSS
  addCss: (el, css) ->
    # Loop the CSS object
    for key, val of css
      @el.style[key] = val
