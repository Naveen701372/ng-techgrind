angular.scenario.dsl 'expectClass', -> (klass, selector, label) ->
	expect(element(selector, label).prop('classList')).toContain klass

angular.scenario.dsl 'expectViewText', -> (text) ->
	expect(using('[ng-view]').element(@selector||'').text()).toMatch text

angular.scenario.dsl 'expectLink', -> (link, text) ->
	a = using(@selector||'').element("[href='#{link}']")
	expect(a.count()).toBe 1
	expect(a.text()).toMatch text

describe 'Tech Grind app', ->
	describe 'root page', ->
		beforeEach -> browser().navigateTo '/'
		it 'shows the home page', -> expect(browser().location().url()).toBe '/home'

	describe 'home page', ->
		beforeEach -> browser().navigateTo '#/home'
		it 'has a navbar', ->
			expect(element('.navbar').text()).toContain 'Settings'
			expect(element('.navbar').text()).toContain 'Coming Soon'
		it 'has a menu', ->
		it 'has a footer', ->
			# About
			using('footer').expectLink '#/about', 'About Us'
			using('footer').expectLink 'https://twitter.com/Tech_Grind', 'Twitter'
			using('footer').expectLink 'http://www.facebook.com/techgrind/', 'Facebook'
			using('footer').expectLink 'https://plus.google.com/114529345031512116214/posts/', 'Google+'
			# Support
			using('footer').expectLink '#/faq', 'FAQ'
			using('footer').expectLink '#/feedback', 'Feedback'
			using('footer').expectLink '#/contact', 'Contact Us'
			# # Legal
			# using('footer').expectLink 'javascript:;', 'License'
			# using('footer').expectLink 'javascript:;', 'Terms of Use'
			# using('footer').expectLink 'javascript:;', 'Privacy Policy'
			# using('footer').expectLink 'javascript:;', 'Security'
			# # Settings
			# using('footer').expectLink 'javascript:;', 'Login'
			# using('footer').expectLink 'javascript:;', 'Sign Up'
			# using('footer').expectLink 'javascript:;', 'Account Settings'
			# using('footer').expectLink 'javascript:;', 'Privacy Settings'
		it 'shows social media buttons', -> expectViewText 'Follow Us'
		it 'shows Top happenings', -> expectViewText 'Top Happenings'
		it 'shows Latest Content', -> expectViewText 'Latest Content'
		it 'highlights the home menu and only that', ->
			expect(element('#menu [class="active"]').text()).toEqual 'Home'

	describe 'regions', ->
		beforeEach -> browser().navigateTo '#/regions'

	describe 'a specific region', ->
		beforeEach -> browser().navigateTo '#/regions/thailand'

	describe 'regions', ->
		beforeEach -> browser().navigateTo '#/regions'
		it 'highlights the regions menu and only that', ->
			expect(element('#menu [class="active"]').text()).toEqual 'Regions'

	describe 'calendar', ->
		beforeEach -> browser().navigateTo '#/calendar'
		it 'highlights the calendar menu and only that', ->
			expect(element('#menu [class="active"]').text()).toEqual 'Calendar'

	describe 'events', ->
		beforeEach -> browser().navigateTo '#/events'
		it 'highlights the events menu and only that', ->
			expect(element('#menu [class="active"]').text()).toEqual 'Events'

	describe 'resources', ->
		beforeEach -> browser().navigateTo '#/resources'
		it 'highlights the resources menu and only that', ->
			expect(element('#menu [class="active"]').text()).toEqual 'Resources'

	describe 'media', ->
		beforeEach -> browser().navigateTo '#/media'
		it 'highlights the media menu and only that', ->
			expect(element('#menu [class="active"]').text()).toEqual 'Media'

	describe 'partners', ->
		beforeEach -> browser().navigateTo '#/partners'
		it 'highlights the partners menu and only that', ->
			expect(element('#menu [class="active"]').text()).toEqual 'Partners'
		xit 'shows Global Partners'
		xit 'has Connect With Us form'
