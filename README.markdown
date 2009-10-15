# Nodes - A CMS **Plugin** for Rails

Nodes is an unobtrusive CMS plugin for Ruby on Rails. It seamlessly integrates
with the models and routes of your existing application. In other words, Nodes
is built on the presumption that you shouldn't need to re-design any aspect of
your application in order to add CMS features to it.

*NB* Nodes is currently pre-beta. Although a version of this code is in production
use for New Media Logic clients, we do not recommend using it in your own projects
yet. These installations instructions, and the implementation API of this plugin
are still in flux, so don't expect to be able to seamlessly upgrade when new
versions of Nodes are released.

## Installation instructions

1. script/plugin install git://github.com/nmlogic/nodes.git
1. include Nodes::User in the class that contains a user
1. include Nodes::Controller inside your ApplicationController
