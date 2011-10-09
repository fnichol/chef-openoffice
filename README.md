# Description

Installs the OpenOffice productivity suite.

# Requirements

## Chef

Tested on 0.10.2 and 0.10.4 but newer and older version should work just fine.
File an [issue][issues] if this isn't the case.

## Platform

The following platforms have been tested with this cookbook, meaning that the
recipes run on these platforms without error:

* ubuntu

Please [report][issues] any additional platforms so they can be added.

## Cookbooks

This cookbook depends on the following external cookbooks:

* [java][java_cb] (Opscode)

# Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

## From the Opscode Community Platform

To install this cookbook from the Opscode platform, use the *knife* command:

    knife cookbook site install openoffice

## Using Librarian

The [Librarian][librarian] gem aims to be Bundler for your Chef cookbooks.
Include a reference to the cookbook in a **Cheffile** and run
`librarian-chef install`. To install with Librarian:

    gem install librarian
    cd chef-repo
    librarian-chef init
    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'openoffice',
      :git => 'git://github.com/fnichol/chef-openoffice.git', :ref => 'v0.2.0'
    END_OF_CHEFFILE
    librarian-chef install

## Using knife-github-cookbooks

The [knife-github-cookbooks][kgc] gem is a plugin for *knife* that supports
installing cookbooks directly from a GitHub repository. To install with the
plugin:

    gem install knife-github-cookbooks
    cd chef-repo
    knife cookbook github install fnichol/chef-openoffice/v0.2.0

## As a Git Submodule

A common practice (which is getting dated) is to add cookbooks as Git
submodules. This is accomplishes like so:

    cd chef-repo
    git submodule add git://github.com/fnichol/chef-openoffice.git cookbooks/openoffice
    git submodule init && git submodule update

**Note:** the head of development will be linked here, not a tagged release.

## As a Tarball

If the cookbook needs to downloaded temporarily just to be uploaded to a Chef
Server or Opscode Hosted Chef, then a tarball installation might fit the bill:

    cd chef-repo/cookbooks
    curl -Ls https://github.com/fnichol/chef-openoffice/tarball/v0.2.0 | tar xfz - && \
      mv fnichol-chef-openoffice-* openoffice

# Usage

Simply include `recipe[openoffice::headless]` to install OpenOffice headlessly
and include `recipe[openoffice::apps]` to install the OpenOffice application components.

# Recipes

## default

This recipe is a no-op and does nothing.

## headless

Installs the headless (no X) core of OpenOffice.

## apps

Installs the application components for OpenOffice, namely Writer, Calc, and Impress.

# Attributes

There are **no** configurable attributes in this cookbook.

# Resources and Providers

There are **no** resources and providers in this cookbook.

# Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

# License and Author

Author:: Fletcher Nichol (<fnichol@nichol.ca>)

Copyright 2011, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[chef_repo]:    https://github.com/opscode/chef-repo
[java_cb]:      http://community.opscode.com/cookbooks/apache2
[kgc]:          https://github.com/websterclay/knife-github-cookbooks#readme
[librarian]:    https://github.com/applicationsonline/librarian#readme

[repo]:         https://github.com/fnichol/chef-openoffice
[issues]:       https://github.com/fnichol/chef-openoffice/issues
