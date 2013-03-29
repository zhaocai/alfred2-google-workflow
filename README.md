# Alfred 2 Workflow for Google Search

Alfred2 workflow for google search suggestion, instant search, site search, related search, etc.


![workflow](https://raw.github.com/zhaocai/alfred2-google-workflow/master/screenshots/workflow.png)

## Usage

### 1. Search Suggestion

Keyword `g`: provide google search suggestions based on {query}.

### 2. Instant Search

Keyword `gi`: get instant google search results in Alfred based on {query}.

### 3. Site Search

Keyword `gs`: get instant google search results of front browser's site in Alfred based on {query}.

Supported browsers are: Safari, Google Chrome, Opera, OmniWeb, etc.

You can use `site:example.com query` if you do not want to search for current front browser's site.

For example, open safari with **github.com**, type `gs alfred2 workflow` to find related projects hosted in github.

![site search](https://raw.github.com/zhaocai/alfred2-google-workflow/master/screenshots/site_search.png)


### 4. Related Search

Keyword `related`: get related google search results of front browser's site in Alfred based on {query}.

Supported browsers are: Safari, Google Chrome, Opera, OmniWeb, etc.

You can use `related:example.com query` if you do not want to search for current front browser's site.


## Installation

Two ways are provided:

1. You can download the [Google.alfredworkflow](https://github.com/zhaocai/alfred2-google-workflow/raw/master/Google.alfredworkflow) and import to Alfred 2. This method is suitable for **regular users**.

2. You can `git clone` or `fork` this repository and use `rake install` and `rake uninstall` to install.
This method create a symlink to the alfred workflow directory: "~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows". This method is suitable for **developers**.

## Reference

1. [Site Search Workflow for Alfred 2][lucifr-site]
2. [Google Search in-line results workflow][google-search-in-line-results-workflow]

## Copyright

Copyright (c) 2013 Zhao Cai <caizhaoff@gmail.com>

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option)
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.


[gembundler]: http://gembundler.com/

[lucifr-site]: http://lucifr.com/2013/03/15/site-search-workflow-for-alfred-2/

[google-search-in-line-results-workflow]: http://www.alfredforum.com/topic/940-google-search-in-line-results-workflow/?hl=%2Bgoogle+%2Bworkflow

