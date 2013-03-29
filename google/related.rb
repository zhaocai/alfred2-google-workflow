#!/usr/bin/env ruby
# encoding: utf-8

# ============== = ===========================================================
# Description    : Alfred 2 Google Related Search Workflow
# Author         : Zhao Cai <caizhaoff@gmail.com>
# HomePage       : https://github.com/zhaocai/
# Version        : 0.1
# Date Created   : Sun 10 Mar 2013 09:59:48 PM EDT
# Last Modified  : Thu 28 Mar 2013 11:48:55 PM EDT
# Tag            : [ ruby, alfred, workflow ]
# Copyright      : © 2013 by Zhao Cai,
#                  Released under current GPL license.
# ============== = ===========================================================

($LOAD_PATH << File.expand_path("..", __FILE__)).uniq!

require 'rubygems' unless defined? Gem
require "bundle/bundler/setup"
require "alfred"

require 'google-search'
require 'uri'


def generate_feedback(alfred, query)

  feedback = alfred.feedback

  if query.start_with?('related:')
    # not working in ruby 1.8.7
    # query_pattern  = %r{(?<related> ^related: \S* ) (\s|$) (?<query> .*)}x
    query_pattern  = %r{(^related: \S* ) (\s|$) (.*)}x
    m = query_pattern.match(query)
    related_query = m[1]
    query = m[3]
  else
    uri = URI.parse(%x{osascript browser_url.scpt})
    related_query = %Q{related:#{uri.to_s}}
  end
  feedback.add_item({
    :uid      => "Google Default Search",
    :title    => "Search '#{related_query} #{query}'",
    :subtitle => "Open brower for more results.",
    :arg      => URI.escape("http://www.google.com/search?as_q=#{related_query}+#{query}&lr=lang_"),
  })

  search = Google::Search::Web.new(:query => "#{related_query}+#{query}")


  i = 0
  search.each do |result|
    feedback.add_item({
      :uid      => result.uri,
      :title    => result.title,
      :subtitle => result.uri,
      :arg      => result.uri,
    })
    i = 1 + i
    break if i > 40
  end


  puts feedback.to_xml
end

if __FILE__ == $PROGRAM_NAME

  Alfred.with_friendly_error do |alfred|
    alfred.with_rescue_feedback = true
    query = ARGV.join(" ").strip
    generate_feedback(alfred, query)
  end
end


