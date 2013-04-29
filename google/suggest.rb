#!/usr/bin/env ruby
# encoding: utf-8

# ============== = ===========================================================
# Description    : Alfred 2 Google Suggest Workflow
# Author         : Zhao Cai <caizhaoff@gmail.com>
# HomePage       : https://github.com/zhaocai/
# Version        : 0.1
# Date Created   : Sun 10 Mar 2013 09:59:48 PM EDT
# Last Modified  : Thu 28 Mar 2013 11:52:43 PM EDT
# Tag            : [ ruby, alfred, workflow ]
# Copyright      : © 2013 by Zhao Cai,
#                  Released under current GPL license.
# ============== = ===========================================================

($LOAD_PATH << File.expand_path("..", __FILE__)).uniq!

require 'rubygems' unless defined? Gem
require "bundle/bundler/setup"
require "alfred"

require 'lib/google_suggest'





def generate_feedback(alfred, query)

  feedback = alfred.feedback

  gs = GoogleSuggest.new

  feedback.add_item({
    :uid      => "Google Default Search",
    :title    => "Search '#{query}'",
    :subtitle => "Open brower for more results.",
    :arg      => query,
  })

  icon = {:type => "default", :name => "icon.png"}
  gs.suggest_for(query).each do |s|
    feedback.add_item({
      :uid      => "Google Search: #{s[:text]}"    ,
      :title    => s[:text]                        ,
      :subtitle => "Search Google for #{s[:text]}" ,
      :arg      => s[:text]                        ,
      :icon     => icon                                   ,
    })
  end

  puts feedback.to_xml
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


