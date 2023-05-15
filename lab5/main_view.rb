require 'mc_delta'
require_relative './fabric.rb'
require_relative './views/main_view.rb'

fabric = Fabric.new()

main_controller = fabric.makeMainWindow()