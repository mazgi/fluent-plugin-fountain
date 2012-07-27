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

    require 'rb-inotify'
    @notifier = INotify::Notifier.new
    @paths.each {|path|
      while true
        break unless path.index('*')
          path = File::dirname(path)
        end
        next if @notifier.watchers.values.index {|w|
          w.path == path
        }
        @notifier.watch(path, :recursive, :create, :delete, :attrib) {|event|
          $log.trace("detect \"#{event.name}\".")
      } if File::exist? path
    }
  end

  def start
    super
    Thread.new {
      @notifier.run
    }
  end

  def shutdown
    @notifier.stop
    @notifier.close
    super
  end
end
end
