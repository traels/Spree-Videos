class VideoManager
	options:
		width: 600,
		youtube_match: /^.*((youtu.be\/)|(v\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/,
		baseFilePath: '',
		playerElementID: 'player_holder',
		originDomain: '',
		youtube_options: "<%= Rack::Utils::build_query(Spree::Videos::configuration.youtube_url_params) %>"
	
	constructor: (holder, options = {}) ->
		@player_holder = $(holder)
		
		# check if player is given by default, pull options off of it
		if !!(iframe = $('iframe', @player_holder).get(0))
			options.width = $(iframe).width()

			# TODO should pull youtube_options from the player if they exist
			# TODO should have option for resizing the player while keeping the aspect ratio
		
		@options = $.extend(@options, options)
	
	switchVideo: (youtube_link) ->
		size = @calculateDimensions(true)
		matches = @options.youtube_match.exec(youtube_link)
		youtubeID = if matches then matches[matches.length - 1] else youtube_link
		youtubeURL = "http://www.youtube.com/embed/" + youtubeID + "?origin=" + @options.originDomain + "&fs=1&" + @options.youtube_options;
		
		@player_holder.html('<iframe type="text/html" width="' + size.width + '" height="' + size.height + '" src="' + youtubeURL + '" frameborder="0"></iframe>');
	
	calculateDimensions: (isYouTube = true) ->
		# automatically size player based on HD 16:9 format
		# can define either width / height and this will calculate the rest
		
		w = if ('width' of @options) then @options.width else 0
		h = if ('height' of @options) then @options.width else 0
		
		# we subtract 30 from the height calculation because of the youtube menu
		yt = if isYouTube is true then 30 else 0
		w = (h - yt) * 16/9 if !w
		h = Math.round(w * (9/16) + yt) if !h
		
		{ width:240, height:240 }

$ ->
  $("a[rel^='prettyPhoto']").prettyPhoto({
    show_title: false
    social_tools: ''
    theme: 'dark_rounded'
  })
	# TODO should create multiple VideoManagers based on class name instead
	#vm = new VideoManager("#main-image")
	
	# TODO should not be based on a single ID
	#$('#product-thumbnails a.youtube').click (evn) ->
	#	vm.switchVideo($(this).data('video-id'))