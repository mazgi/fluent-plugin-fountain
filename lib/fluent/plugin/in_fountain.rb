# -*- coding: utf-8 -*-
module Fluent
class FountainInput < Input
  Plugin.register_input('fountain', self)

  def initialize
    super
    @paths = []
  end

  config_param :path, :string

  attr_reader :paths

  def configure(conf)
    super

    @paths = @path.split(',').map {|path| path.strip }
    if @paths.empty?
      raise ConfigError, "fountain: 'path' parameter is required on fountain input"
    end
  end

  def start
    super
  end

  def shutdown
    super
  end

  def run
    super
  end
end
end
