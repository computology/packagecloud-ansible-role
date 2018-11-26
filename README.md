# packagecloud.io Ansible Role

## Overview

This role lets you easily add [packagecloud.io](https://packagecloud.io) repositories to your RedHat and Debian systems from ansible.

*Note: This is a simple role that only covers the common cases and as such isn't as robust as it could be; development of a full-blown ansible module is on our roadmap.*

## Role Configuration

* `repository` - The user and repository path on [packagecloud.io](https://packagecloud.io), for example `computology/packagecloud-test-packages`.

* `master_token` *(optional)* - A valid master_token for this repository. Only needed for private repositories. This will use your `ansible_nodename` to generate a [read token using our API](https://packagecloud.io/docs#read_tokens) for use in your repository configuration.

* `os` - The distribution to use in repository configuration, using [packagecloud nomenclature](https://packagecloud.io/docs#os_distro_version). For example, `el`, or `ubuntu`.

* `version` - The distribution version to use in repository configuration, using [packagecloud nomenclature](https://packagecloud.io/docs#os_distro_version). For example, `5`, or `trusty`.

* `legacy_gpg` - (Debian only) Defaults to `undefined`, set this value to use the legacy pacakgecloud.io GPG key. NOTE: This should only be used for repositories that haven't migrated to their own unique GPG key, see our [blog post](https://blog.packagecloud.io/eng/2018/10/17/gpg-key-migration/) for details.

## Example
    - { role: packagecloud, repository: capotej/apt-cacher-ng, os: ubuntu, version: trusty }
    - { role: packagecloud, repository: capotej/apt-cacher-ng, os: ubuntu, version: trusty, legay_gpg: true }
    - { role: packagecloud, repository: corp/private-repo, os: centos, version: 6, master_token: "{{ encrypted_master_token_from_vault }}" }

## Running Tests / Development

     bundle install

     bundle exec kitchen test

For testing private repositories, edit `test/integration/default/ansible/default.yml` as desired.

Note: This expects docker to be running and available.



## TODO

* CentOS 5 support
* Handle cases where `pygpgme` cannot be installed

## License
The MIT License (MIT)

Copyright (c) 2018 Computology, LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
