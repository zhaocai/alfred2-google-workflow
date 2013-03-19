# Alfred 2 Top Process Workflow

Alfred2 workflow for google search suggestion, instant search, site search, etc.

It is also an example to use [bundler][gembundler] to include gems in alfred workflow.

![workflow](https://raw.github.com/zhaocai/alfred2-google-workflow/master/screenshots/workflow.png)

## Usage

### 1. Search Suggestion

Keyword `g`: provide google search suggestions based on {query}.

### 2. Instant Search

Keyword `gi`: get instant google search results in Alfred based on {query}.

### 3. Site Search

Keyword `gs`: get instant google search results of front browser's site in Alfred based on {query}.
supported browsers are: Safari, Google Chrome, Opera, OmniWeb, etc.

You can use `site:example.com query` if you do not want to search for current front browser's site.

![site search](https://raw.github.com/zhaocai/alfred2-google-workflow/master/screenshots/site_search.png)

## Installation

Two ways are provided:

1. You can download the [Top Processes.alfredworkflow](https://github.com/zhaocai/alfred2-google-workflow/raw/master/Google.alfredworkflow) and import to Alfred 2. This method is suitable for **regular users**.

2. You can `git clone` or `fork` this repository and use `rake install` and `rake uninstall` to install.
This method create a symlink to the alfred workflow directory: "~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows". This method is suitable for **developers**.


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
