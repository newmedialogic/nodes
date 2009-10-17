# Nodes - A Very, Very Beta CMS **Plugin** for Rails

Nodes is an unobtrusive CMS plugin for Ruby on Rails. It seamlessly integrates
with the models and routes of your existing application. In other words, Nodes
is built on the presumption that you shouldn't need to re-design any aspect of
your application in order to add CMS features to it.

All of the core CMS content in Nodes is stored in standard Rails models that 
you create as a part of your application in a standard way. Nodes extends these
models with enhanced content elements (Images, Attachments, etc) at save-time.

*NB* Nodes is currently pre-beta. Although a version of this code is in production
use for New Media Logic clients, we do not recommend using it in your own projects
yet. These installations instructions, and the implementation API of this plugin
are still in flux, so don't expect to be able to seamlessly upgrade when new
versions of Nodes are released.

*NB* Some features are currently vaporware in the Github version (namely: videos
and attachments). This plugin is currently being abstracted from a working
production web site, and some portions critical to those features are still
in single-site-application implementations. I will be gradually pulling in pieces
as they are finished. 

## Installation instructions

1. script/plugin install git://github.com/nmlogic/nodes.git
1. include Nodes::User in the class that contains a user
1. include Nodes::Controller inside your ApplicationController
