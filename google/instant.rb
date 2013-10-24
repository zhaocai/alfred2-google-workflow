#!/usr/bin/env ruby
# encoding: utf-8

# ============== = ===========================================================
# Description    : Alfred 2 Google Instant Search Workflow
# Author         : Zhao Cai <caizhaoff@gmail.com>
# HomePage       : https://github.com/zhaocai/
# Version        : 0.1
# Date Created   : Sun 10 Mar 2013 09:59:48 PM EDT
# Last Modified  : Thu 28 Mar 2013 11:41:19 PM EDT
# Tag            : [ ruby, alfred, workflow ]
# Copyright      : © 2013 by Zhao Cai,
#                  Released under current GPL license.
# ============== = ===========================================================

($LOAD_PATH << File.expand_path("..", __FILE__)).uniq!

require 'rubygems' unless defined? Gem
require "./bundle/bundler/setup"
require "alfred"

require 'google-search'
require 'uri'

def generate_feedback(alfred, query)

  feedback = alfred.feedback
  search = Google::Search::Web.new(:query => "#{query}")

  i = 0
  search.each do |result|
    feedback.add_item({
      :uid      => result.uri,
      :title    => result.title,
      :subtitle => result.uri,
      :arg      => result.uri
    })
    i = 1 + i
    if i == 2
      goto_google_icon = {:type => "default", :name => "goto_google.png"}
      feedback.add_item({
        :title    => "Search '#{query}' in the browser.",
        :subtitle => "Open browser for more results.",
        :arg      => URI.escape("http://www.google.com/search?as_q=#{query}&lr=lang_"),
        :icon     => goto_google_icon,
      })
    end
    break if i > 20
  end


  puts feedback.to_alfred
end

if __FILE__ == $PROGRAM_NAME
  if ['/h', '/help'].include? ARGV[0]
    exit 0
  end

  Alfred.with_friendly_error do |alfred|
    alfred.with_rescue_feedback = true
    query = ARGV.join(" ").strip
    generate_feedback(alfred, query)
  end
end


