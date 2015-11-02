# packageloud.io Ansible Role

## Overview

This module lets you easily add [packageloud.io](packagecloud.io) repositories to your RedHat and Debian system from ansible.

*Note: This is a simple role that only covers the common cases and as such isn't as robust as it could be; Development of a full-blown ansible module is on our roadmap.*

## Installation

Make sure this role is in your configured `role_path`.

## Role Configuration

* `repository` - The user and repository path on [packagecloud.io](packagecloud.io), for example `computology/packagecloud-test-packages`.

* `master_token` *(optional)* - A valid master_token for this repository. Only needed for private repositories. This will use your `ansible_nodename` to generate a [read token using our API](https://packagecloud.io/docs#read_tokens) for use in your repository configuration.
* `os` - The distribution to use in repository configuration, using [packagecloud nomenclature](https://packagecloud.io/docs#os_distro_version). For example, `el`, or `ubuntu`.
* `version` - The distribution version to use in repository configuration, using [packagecloud nomenclature](https://packagecloud.io/docs#os_distro_version). For example, `5`, or `trusty`.

## Example
    - { role: packagecloud, repository: capotej/apt-cacher-ng, os: ubuntu, version: trusty }
    - { role: packagecloud, repository: corp/private-repo, os: centos, version: 6, master_token: "{{ encrypted_master_token_from_vault }}" }
